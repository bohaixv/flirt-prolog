different([X], []):-!.
different([X, Y | Tail], [Y|NT]) :- \+(X=Y), different([X|Tail], NT).

fd_all_different([]) :- !.
fd_all_different(List) :- different(List, Plumb), fd_all_different(Plumb).
