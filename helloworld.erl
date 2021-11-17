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
    for(5, atom).

for(0, _) ->
    [];
for(N, Term) when n > 0 ->
    io:fwrite("atom"),
    [Term | for(N - 1, Term)].
