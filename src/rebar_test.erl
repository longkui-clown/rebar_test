-module(rebar_test).
-export([start/0]).
-define(NAME, lala).
-define(KEY, lala).

start() ->
  dets:open_file(?NAME, [{type, set}]),
  N = fetch(),
  io:format("rebar_test has been run ~p times~n", [N]),
  store(N + 1),
  dets:close(?NAME),
  init:stop().

store(N) ->
  dets:insert(?NAME, {?KEY, N}).

fetch() ->
  case dets:lookup(?NAME, ?KEY) of
    [{lala, N}] -> N;
    _ -> 0
  end.

