-module(my_callbacks).
-behaviour(my_behavior).
-export([fn/1]).

fn(A) -> A + 1.