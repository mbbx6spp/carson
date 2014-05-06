%-*- mode: erlang -*-
%%%'   HEADER
%%% @author Susan Potter <me@susanpotter.net>
%%% @copyright 2014 Susan Potter
%%% @doc
%%% @end
%%%.

%%%'   TYPES

-type version()       :: {integer(), integer(), integer(), integer()}   %% e.g. Ruby 1.9.3-p545
                       | {integer(), integer(), integer()}              %% e.g. Elasticsearch 0.90.11
                       | {integer(), integer()}                         %% e.g. GCC 4.6
                       | atom().                                        %% e.g. v1_0_1

-type job_state()     :: pending
                       | initializing
                       | executing
                       | cancelled
                       | terminating
                       | successful
                       | failed.

-type parameter_type():: integer()
                       | atom()
                       | boolean()
                       | binary().

-type phase           :: not_implemented.
-type phase_parameter :: not_implemented.
-type phase_argument  :: not_implemented.
%%%.
%%%'   RECORDS

-record(parameter,
  { name              :: binary()
  , type              :: parameter_type()
  , value             :: parameter_type()
  }).

-record(argument,
  { param             :: parameter()
  , value             :: integer() | boolean() | atom() | binary()
  }).

-record(job_definition,
  { id                :: binary()
  , description       :: binary()
  , parameters        :: [parameter()]
  , phases            :: [phase()]
  , phase_parameters  :: [phase_parameter()]
  }).

-record(job_instance,
  { id                :: binary()
  , arguments         :: [argument()]
  , phase_arguments   :: [phase_argument()]
  }

%%%.
%%%'   DEFINES


%%%.
% vim: set filetype=erlang tabstop=2 foldmarker=%%%',%%%. foldmethod=marker:
