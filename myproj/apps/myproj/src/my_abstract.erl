-module(my_abstract).
-export([start/1]).

%% api

loop(CBM) ->
    receive 
        {Sender, {do_it, A}} -> 
            Sender ! CBM:fn(A),
            loop(CBM);
        stop -> io:format("~p (~p): Farewell!~n",
                      [self(), ?MODULE]);
        Message ->   io:format("~p (~p): Received silliness: ~tp~n",
                      [self(), ?MODULE, Message]),
            loop(CBM)
    end.

start(CallbackMod) ->
    spawn(fun() -> loop(CallbackMod) end).