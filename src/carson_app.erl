%-*- mode: erlang -*-
%%%'   HEADER
%%% @author Susan Potter <me@susanpotter.net>
%%% @copyright 2013 Susan Potter
%%% @doc
%%% @end

-module(carson_app).
-behaviour(application).

-export([start/2, stop/1]).
%%%.
%%%'   CALLBACKS
start(_StartType, _StartArgs) ->
  case carson_sup:start_link() of
    {ok, Pid} ->
      ok = riak_core:register(carson_core, [{vnode_module, carson_core_vnode}]),
      ok = riak_core_node_watcher:service_up(carson_core, self()),

      {ok, Pid};
    Other ->
      Other
  end.

stop(_State) ->
  ok.
%%%.
%%%'   PRIVATE FUNCTIONS

%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:
