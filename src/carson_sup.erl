%-*- mode: erlang -*-
%%%'   HEADER
%%% @author Susan Potter <me@susanpotter.net>
%%% @copyright 2013 Susan Potter
%%% @doc 
%%% @end
-module(carson_sup).

-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).
%%%.
%%%'   PUBLIC API
start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%.
%%%'   CALLBACKS
init([]) ->
  {ok, { {one_for_one, 5, 10}, []} }.

%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:
