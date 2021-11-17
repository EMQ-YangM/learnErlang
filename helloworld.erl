%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    L = [10,20,30],
    io:fwrite("~w", [length(L)]).

%% shell
%% b() ----------------
