-module(prop_my_sort).

-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").

-spec sort([T]) -> [T].
sort([]) ->
    [];
sort([P | Xs]) ->
    sort([X || X <- Xs, X < P]) ++ [P] ++ sort([X || X <- Xs, P < X]).

test_zero() ->
    ?_assertEqual([], sort([])).

test_two() ->
    [?_assertEqual([17, 42], sort([X, Y])) || {X, Y} <- [{17, 42}, {42, 17}]].

test_four() ->
    ?_assertEqual([1, 2, 3, 4], sort([3, 1, 4, 2])).

sort_test_() ->
    [test_zero(), test_two(), test_four()].

prop_ordered() ->
    ?FORALL(L, list(integer()), ordered(sort(L))).

ordered([]) ->
    true;
ordered([_]) ->
    true;
ordered([A, B | T]) ->
    A =< B andalso ordered([B | T]).

prop_same_length() ->
    ?FORALL(L, list(integer()), length(L) =:= length(sort(L))).
