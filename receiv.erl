%---RECEIV---(change this comment together with -module().)
-module(receiv).
%---GEN_SERVER---
-behavour(gen_server).

-export([start_link/0, start_link/1]).
-export([init/1, handle_call/3, handle_cast/2]).

-define(INITARGS, []).
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

handle_call(Request, _From, State) ->
  { Number, Seq } = Request,
  io:write(Number),
  io:format(":"),
  io:write(Seq),
  io:format(" "),
  Reply = ok,
  NewState = State,
  {reply, Reply, NewState}.

handle_cast(Request, State) ->
  { Number, Seq } = Request,
  io:write(Number),
  io:format(":"),
  io:write(Seq),
  io:format(" "),
  NewState = State,
  {noreply, NewState}.
