member(X , [X | H]).
member(X, [Y | H]) :- member(X, H).