%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    P = {john, 24, {june, 25}},
    io:fwrite("~w", [tuple_size(P)]).

%% shell
%% b() ----------------
