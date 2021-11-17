%% ........
-module(helloworld).

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
    Fn = fun() ->
       io:fwrite("some function\n") end,
    Fn(),
    add(10,20).

for(0, _) ->
    [];
for(N, Term) when n > 0 ->
    io:fwrite("atom"),
    [Term | for(N - 1, Term)].

add(X,Y) ->
    Z = X + Y,
    io:fwrite("~w~n", [Z]).
