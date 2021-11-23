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

%% prop_same_length() ->
%%     ?FORALL(L, list(integer()), length(L) =:= length(sort(L))).

prop_same_length_conditional_check() ->
    ?FORALL(L, list(integer()), ?IMPLIES(no_duplicates(L), length(L) =:= length(sort(L)))).

no_duplicates([]) ->
    true;
no_duplicates([A | T]) ->
    not lists:member(A, T) andalso no_duplicates(T).

list_no_dupls(T) ->
    ?LET(L, list(T), remove_duplicates(L)).

remove_duplicates([]) ->
    [];
remove_duplicates([A | T]) ->
    case lists:member(A, T) of
        true ->
            remove_duplicates(T);
        false ->
            [A | remove_duplicates(T)]
    end.

prop_same_length_no_dupls() ->
    ?FORALL(L, list_no_dupls(integer()), length(L) =:= length(sort(L))).

prop_equiv_usort() ->
    ?FORALL(L, list(), sort(L) =:= lists:usort(L)).

% prop_same_length() ->
%     ?FORALL(L, list(), length(L) =:= length(sort(L))).
