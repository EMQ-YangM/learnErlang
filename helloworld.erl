%% ........
-module(helloworld).

-author("aa").

-version("1.2").

%% export ........
-export([start/0]).

-include("user.hrl").

while(L) ->
    while(L, 0).

while([], Acc) ->
    Acc;
while([_ | T], Acc) ->
    io:fwrite("~w~n", [Acc]),
    while(T, Acc + 1).

call(Arg1, Arg2) ->
    io:format("~p ~p~n", [Arg1, Arg2]).

start() ->
    X = [1, 2, 3, 4],
    while(X),
    for(5, atom),
    Fn = fun() -> io:fwrite("some function\n") end,
    Fn(),
    add1(5),
    add(11, 21),
    fac(10),
    Str1 = "this is a string",
    io:fwrite("~p~n", [Str1]),
    TrueFun = fun(_) -> true end,
    io:fwrite("~p~n", [lists:all(TrueFun, [true, true])]),
    {ok, File} = file:open("NewFile.txt", [read]),
    Txt = file:read(File, 1024 * 1024),
    io:fwrite("~p~n", [Txt]),
    io:fwrite(atom1),
    io:fwrite("~n"),
    io:fwrite(atom2),
    io:fwrite("~n"),
    io:fwrite(atom3),
    io:fwrite("~n"),
    io:fwrite(atom4),
    io:fwrite("~n"),
    P = #person{name = "John", personId = 1},
    P1 = P#person{name = "Dan"},
    E = #employee{person = P, employeeId = 2},
    io:fwrite("~w, ~w, ~w ~n", [P, P#person.personId, P1#person.name]),
    io:fwrite("~w", [E]),
    io:fwrite("~w~n", [demo1()]),
    %% io:fwrite("~w~n", [demo2()]),
    %% io:fwrite("~w~n", [demo3()]),
    io:fwrite("~w~n", [?a]),
    io:fwrite("~w~n", [?macrol(1, 2)]),
    io:fwrite("~w~n", [time()]),
    io:fwrite("~w~n", [tuple_to_list({1, 2, 3})]),
    io:fwrite("~w~n", [<<"hello">>]),
    Pid = spawn(?MODULE, call, ["hello", "process"]),
    io:fwrite("~p", [Pid]),
    {ok, Socket} = gen_udp:open(8789),
    io:fwrite("~p", [Socket]),
    ok = gen_udp:send(Socket, "localhost", 8789, "Hello"),
    res = gen_udp:recv(Socket, 20),
    io:fwrite("finish\n").

for(0, _) ->
    [];
for(N, Term) when n > 0 ->
    io:fwrite("atom"),
    [Term | for(N - 1, Term)].

add(X, Y) ->
    Z = X + Y,
    io:fwrite("~w~n", [Z]).

add1(X) when X > 3 ->
    io:fwrite("~w~n", [X]).

fac(N) when N == 0 ->
    1;
fac(N) when n > 0 ->
    io:fwrite("~w\n", [N]),
    N * fac(N - 1).

len([]) ->
    0;
len([_ | T]) ->
    1 + len(T).

tail_len(L) ->
    tail_len(L, 0).

tail_len([], Acc) ->
    Acc;
tail_len([_ | T], Acc) ->
    tail_len(T, Acc + 1).

duplicate(0, _) ->
    [];
duplicate(N, Term) when N > 0 ->
    io:fwrite("~w, ~n", [Term]),
    [Term | duplicate(N - 1, Term)].

tail_reverse([], Acc) ->
    Acc;
tail_reverse([H | T], Acc) ->
    tail_reverse(T, [H | Acc]).

generate_exception(1) ->
    a;
generate_exception(2) ->
    throw(a);
generate_exception(3) ->
    exit(a);
generate_exception(4) ->
    {'Exit', a};
generate_exception(5) ->
    erlang:error(a).

catcher(N) ->
    try generate_exception(N) of
        Val ->
            {N, normal, Val}
    catch
        X ->
            {N, caught, thrown, X};
        exit:X ->
            {N, caught, exited, X};
        error:X ->
            {N, caught, error, X}
    end.

demo1() ->
    [catcher(I) || I <- [1, 2, 3, 4, 5]].

demo2() ->
    [{I, catch generate_exception(I)} || I <- [1, 2, 3, 4, 5]].

demo3() ->
    try
        generate_exception(5)
    catch
        error:X ->
            {X, erlang:get_stacktrace()}
    end.

lookup(N) ->
    case N of
        1 ->
            {'EXIT', a};
        2 ->
            exit(a)
    end.

display(N) when N > 10 ->
    io:fwrite("greater then 10");
display(N) when n < 10 ->
    io:fwrite("less than 10").

tmpFun1(VA) ->
    case VA of
        {A} when A > 10 ->
            io:fwrite("nice");
        _ ->
            io:fwrite("finish")
    end.

server(Message) ->
    io:fwrite("~p", [Message]).

start1() ->
    Pid = spawn(fun() -> server("Hello") end),
    Pid ! {hello}.

loop() ->
    receive
        {rectangle, Width, Ht} ->
            io:fwrite("Area of rectangle is ~p~n", [Width * Ht]),
            loop;
        {circle, R} ->
            io:fwrite("Area of circle is ~p~n", [3.14159 * R * R]),
            loop();
        Other ->
            io:fwrite("Unkonwn"),
            loop()
    end.

max(N) ->
    Max = erlang:system_info(process_limit),
    io:format("Maxium allowed processes:~p~n", [Max]),
    statistics(runtime),
    statistics(wall_clock),
    %% L = for(1, N, fun() -> spwan(fun() -> wait()end)end),
    1.
