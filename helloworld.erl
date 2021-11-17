%% ........
-module(helloworld).

-author("aa").

-version("1.2").

%% export ........
-export([start/0]).

while(L) ->
    while(L, 0).

while([], Acc) ->
    Acc;
while([_ | T], Acc) ->
    io:fwrite("~w~n", [Acc]),
    while(T, Acc + 1).

start() ->
    X = [1, 2, 3, 4],
    while(X),
    for(5, atom),
    Fn = fun() -> io:fwrite("some function\n") end,
    Fn(),
    add1(5),
    add(11, 21),
    fac(10),
    io:fwrite("finish\n").

for(0, _) ->
    [];
for(N, Term) when n > 0 ->
    io:fwrite("atom"),
    [Term | for(N - 1, Term)].

add(X, Y) ->
    Z = X + Y,
    io:fwrite("~w~n", [Z]).

add1(X) when X > 3 ->
    io:fwrite("~w~n", [X]).

fac(N) when N == 0 ->
    1;
fac(N) when n > 0 ->
    io:fwrite("~w\n", [N]),
    N * fac(N - 1).

len([]) ->
    0;
len([_ | T]) ->
    1 + len(T).

tail_len(L) ->
    tail_len(L, 0).

tail_len([], Acc) ->
    Acc;
tail_len([_ | T], Acc) ->
    tail_len(T, Acc + 1).

duplicate(0, _) ->
    [];
duplicate(N, Term) when N > 0 ->
    io:fwrite("~w, ~n", [Term]),
    [Term | duplicate(N - 1, Term)].

tail_reverse([], Acc) ->
    Acc;
tail_reverse([H | T], Acc) ->
    tail_reverse(T, [H | Acc]).
