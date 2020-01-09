hanoi(N) :- move(N, left , middle, right).

move(0, _ ,_ ,_) :- !.
move(N, Left, Middle, Right) :- 
    N1 is N - 1,
    move(N1, Left, Right, Middle),
    inform(Left, Right),
    move(N1, Middle, Left, Right).

inform(Source , Target) :- write("把盘子从"), write(Source), write("移动到"), write(Target), nl.