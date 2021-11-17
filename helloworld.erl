%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    X = 40,
    Y = 50,
    Result = X + Y,
    io:fwrite("~w", [Result]).

%% shell
%% b() ----------------
