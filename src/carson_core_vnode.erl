%%%'   HEADER
%%% @copyright 2013 Susan Potter
%%% @license   BSD 3-clause (see LICENSE file)
%%% @doc The carson_core_vnode keeps track of job instances.
%%%
%%% @end
-module(carson_core_vnode).

-export(
  [ start_vnode/1
  , init/1
  , terminate/2
  , handle_command/3
  , is_empty/1
  , delete/1
  , handle_handoff_command/3
  , handoff_starting/2
  , handoff_cancelled/1
  , handoff_finished/2
  , handle_handoff_data/2
  , encode_handoff_item/2
  , handle_coverage/4
  , handle_exit/3
]).

-behaviour(riak_core_vnode).

-record(state, {partition, job_instances}).

%%%.
%%%'   PUBLIC API

%% @doc starts vnode
start_vnode(I) ->
  riak_core_vnode_master:get_vnode_pid(I, ?MODULE).

%% @doc initialize vnode
init([Partition]) ->
  {ok, #state{ partition=Partition }}.

%% @doc terminate vnode
terminate(_Reason, _State) ->
  ok.

%% @doc handles permitted commands for carson_core vnode
handle_command(ping, _Sender, State) ->
  {reply, {pong, State#state.partition}, State};
handle_command(Message, _Sender, State) ->
  lager:info("Unhandled command ~w~n", [Message]),
  {noreply, State}.

%% @doc determines if vnode is empty
is_empty(State) ->
  {true, State}.

%% @doc deletes vnode (not just entry)
delete(State) ->
  {ok, State}.

%% @doc handles commands while vnode is in handoff mode
handle_handoff_command(_Message, _Sender, State) ->
  {forward, State}.

%% @doc invoked by the container when a handoff needs to occur.
%%      Return true when vnode feels handoff is acceptable or false.
handoff_starting(_TargetNode, _State) ->
  {true, _State}.

%% @doc invoked when either an error has occurred during handoff or container
%%      will violate maximum concurrency threshold if continuing. Can use
%%      this callback to teardown any temporary state setup in
%%      handoff_starting/2.
handoff_cancelled(State) ->
  {ok, State}.

%% @doc invoked by the container when a handoff has finished successfully.
handoff_finished(_TargetNode, State) ->
  {ok, State}.

%% @doc handles commands that go across keyspace
handle_coverage(_Req, _KeySpaces, _Sender, State) ->
  {stop, not_implemented, State}.

%% @doc this callback deserializes data and updates the vnode state appropriately
handle_handoff_data(BinData, #state{job_instances=JobInstances}=State) ->
  {Id, Val} = binary_to_term(BinData),
  NewJobInstances = dict:store(Id, Val, JobInstances),
  {reply, ok, State#state{job_instances=NewJobInstances}}.

%% @doc encodes handoff item
encode_handoff_item(Id, JobInstance) ->
  term_to_binary(Id, JobInstance).

%% @doc When a process linked to the vnode dies this callback is invoked with
%%      Pid of the crashed process with the Reason for crash and vnode's
%%      current state. You can use the Pid and Reason to determine if the
%%      vnode should stop or just log a warning somehow and continue.
handle_exit(_Pid, _Reason, State) ->
  {noreply, State}. %% or {stop, NewState}

%%%.
%%%'   PRIVATE FUNCTIONS

%%%.
%%% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:
