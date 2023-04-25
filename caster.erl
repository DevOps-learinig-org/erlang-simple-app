%---CASTER---(change this comment together with -module().)
-module(caster).
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

handle_call(_Request, _From, State) ->
  Reply = ok,
  NewState = State,
  {reply, Reply, NewState}.

handle_cast(Request, State) ->
  Me = Request,
  n_times(Me, 1000),
  NewState = State,
  {noreply, NewState}.

n_times(_, 0) -> ok;
n_times(Me, N) when N > 0 ->
  gen_server:call(receiv, { Me, N }),
  %gen_server:cast(receiv, { Me, N }),
  n_times(Me, N - 1).
  
