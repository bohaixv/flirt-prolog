factorial(1,1) :- !.
factorial(N, M) :- M1 is M - 1,  factorial(N1, M1) , N is M * N1.


/** 不能直接用M-1 **/