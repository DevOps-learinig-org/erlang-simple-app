%---SIMPLE---(change this comment together with -module().)
-module(simple).
%---GEN_SERVER---
-behavour(gen_server).

-export([start_link/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(INITARGS, 1).
-define(STARTOPTS, []).

start_link() ->
  gen_server:start_link(
    {local, ?MODULE}, ?MODULE, ?INITARGS, ?STARTOPTS
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
  io:format("Hi!~n"),
  NewState = State,
  {noreply, NewState}.
