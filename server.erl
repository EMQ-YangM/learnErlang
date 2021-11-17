-module(server).

-export([start/2, rpc/2]).

rpc(Name, Request) ->
    Name ! {self(), Request},
    receive
        {Name, Response} ->
            Response
    end.

loop(Name, Mod, State) ->
    receive
        {From, Request} ->
            {Response, State1} = Mod:handle(Request, State),
            From ! {Name, Response},
            loop(Name, Mod, State1)
    end.

start(Name, Mod) ->
    register(Name, spawn(fun() -> loop(Name, Mod, Mod:init()) end)).
