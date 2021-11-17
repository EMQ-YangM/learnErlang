%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    Bin1 = <<10,20>>,
    X = binary_to_list(Bin1),
    io:fwrite("~w", [X]).

%% shell
%% b() ----------------
