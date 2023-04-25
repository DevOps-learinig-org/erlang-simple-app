%---COMMANDER---(change this comment together with -module().)
-module(commander).
%---GEN_SERVER---
-behavour(gen_server).

-export([start_link/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(INITARGS, 1).
-define(STARTOPTS, []).

start_link() ->
  gen_server:start_link(
    ?MODULE, ?INITARGS, ?STARTOPTS
  ).

start_link(RegisterName) ->
  gen_server:start_link(
    RegisterName, ?MODULE, ?INITARGS, ?STARTOPTS
  ).

init(InitArgs) ->
  State = InitArgs,
  {ok, State}.

handle_call(_Request, _From, State) ->
  Reply = ok,
  NewState = State,
  {reply, Reply, NewState}.

handle_cast(_Request, State) ->
  gen_server:cast(caster_1, 1),
  gen_server:cast(caster_2, 2),
  gen_server:cast(caster_3, 3),
  NewState = State,
  {noreply, NewState}.
