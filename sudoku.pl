different([X], []):-!.
different([X, Y | Tail], [Y|NT]) :- \+(X=Y), different([X|Tail], NT).
fd_all_different([]) :- !.
fd_all_different(List) :- different(List, Plumb), fd_all_different(Plumb).

fd_domain([Head], Min, Max):- Head >= Min, Head =< Max.
fd_domain([Head | Tail] , Min, Max) :- Head >= Min, Head =< Max, Min < Max, fd_domain(Tail, Min, Max).

valid([]) :- !.
valid([Head | Tail]) :- 
    fd_all_different(Head),
    valid(Tail).

sudoku(Puzzle, Solution) :-
    Solution = Puzzle,

    Puzzle = [
        S11, S12, S13, S14,
        S21, S22, S23, S24,
        S31, S32, S33, S34,
        S41, S42, S43, S44
    ],

    fd_domain(Solution, 1, 4),      % 这里有问题啊， 我不会初始化函数的那个实现方式，因为要用_ 通配符去匹配未知的元素，所以在这里执行的时候会报错。。。

    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],

    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S32, S42],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],

    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],

    valid([Row1,Row2,Row3,Row4,Col1,Col2,Col3,Col4,Square1,Square2,Square3,Square4]).