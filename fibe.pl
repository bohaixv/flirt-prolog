fibe(0, 1) :- !.
fibe(1, 2) :- !.
fibe(F, N) :- N1 is N-1, N2 is N - 2 , fibe(F1 , N1), fibe(F2, N2) , F is F1 + F2.