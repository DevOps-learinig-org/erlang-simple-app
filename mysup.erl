%---MODULE-NAME---(change this comment together with -module().)
-module(mysup).
%---GEN_SERVER---
-behavour(supervisor).

-export([start_link/0, start_link/1]).
-export([init/1]).

-define(INITARGS, []).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, ?INITARGS).

start_link(SupervisorName) ->
  supervisor:start_link(SupervisorName, ?MODULE, ?INITARGS).

init(_Args) ->
  SupervisorFlags = #{strategy   => one_for_one, % optional: one_for_one | one_for_all | rest_for_one | simple_one_for_one
               intensity  => 1,           % optional, default = 1
               period     => 5,           % optional, default = 5, means 1 restart per 5 sec 
               auto_shutdown => never },   % optional: never | any_significant | all_significant
  ChildSpecs = [
    new_child(commander),
    new_child(caster_1, caster),
    new_child(caster_2, caster),
    new_child(caster_3, caster),
    new_child(receiv)
    ],
  {ok, {SupervisorFlags, ChildSpecs}}.

new_child(Id, Module) ->
    #{id        => Id,
      start     => { Module, start_link, [{local, Id}] }, % { Mod, Fun, Args }
      restart   => permanent,   % optional: permanent | temporary | transient
      shutdown  => brutal_kill, % optional: brutal_kill | timeout()
      significant => false,     % optional: boolean() if true then auto_shutdown \= never and restart \= permanent
      type      => worker %,    % optional: worker | supervisor
      }.
new_child(Id) -> new_child(Id, Id).

