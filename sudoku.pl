valid([]) :- !.
valid([Head | Tail]) :- 
    fd_all_different(Head),  %这个是内置函数，但是我装的prolog 没有，目的就是判断一个数组是不是没有重复的 我回来可以自己实现下
    valid(Tail).

sudoku(Puzzle, Solution) :- 
    Solution = Puzzle,

    Puzzle = [
        S11, S12, S13, S14,
        S21, S22, S23, S24,
        S31, S32, S33, S34,
        S41, S42, S43, S44
    ],

    fd_domain(Solution, 1, 4),    % 原生函数，限制数组每个元素的值在1-4之间

    Row1 = [S11, S12, S13, S14],
    Row2 = [S21, S22, S23, S24],
    Row3 = [S31, S32, S33, S34],
    Row4 = [S41, S42, S43, S44],

    Col1 = [S11, S21, S31, S41],
    Col2 = [S12, S22, S33, S44],
    Col3 = [S13, S23, S33, S43],
    Col4 = [S14, S24, S34, S44],

    Square1 = [S11, S12, S21, S22],
    Square2 = [S13, S14, S23, S24],
    Square3 = [S31, S32, S41, S42],
    Square4 = [S33, S34, S43, S44],

    valid([Row1,Row2,Row3,Row4,Col1,Col2,Col3,Col4,Square1,Square2,Square3,Square4]).