%% ........
-module(helloworld).

%% export ........
-export([start/0]).

%% import .......
-import(io, [fwrite/1]).

start() ->
    M1 = #{name=>john, age=>25},
    io:fwrite("~w", [map_size(M1)]).

%% shell
%% b() ----------------
