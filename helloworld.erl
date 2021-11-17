%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    X = 40.00,
    Y = 50.00,
    io:fwrite("~f~n", [X]),
    io:fwrite("~e", [Y]).

%% shell
%% b() ----------------
