different([X], []):-!.
different([X, Y | Tail], [Y|NT]) :- \+(X=Y), different([X|Tail], NT).

fd_all_different([]) :- !.
fd_all_different(List) :- different(List, Plumb), fd_all_different(Plumb).

member(X , [X | H]).
member(X, [Y | H]) :- member(X, H).

valid_queen((Row, Col)) :- 
    Range = [1,2,3,4,5,6,7,8],
    member(Col, Range).

valid([]) :- !.
valid([Head | Tail]) :- valid_queen(Head) , valid(Tail).

rows([], []).
rows([(Row, _) |Tail],[Row | NT]) :- rows(Tail, NT).

cols([], []).
cols([(_, Col) |Tail],[Col | NT]) :- cols(Tail, NT).

disags1([],[]).
disags1([(Row, Col) | Tail], [ Disags | NT]) :- 
    Disags is Row + Col,
    disags1(Tail, NT).

disags2([],[]).
disags2([(Row, Col) | Tail], [ Disags | NT]) :- 
    Disags is Row - Col,
    disags2(Tail, NT).

eight_queen(Board) :- 
   /* length(Board, 8),
    valid(Board), */

    Board = [(1,_), (2,_),(3,_),(4,_),(5,_),(6,_),(7,_),(8,_) ],
    valid(Board),

    rows(Board, Rows),
    cols(Board, Cols),
    disags1(Board, Disags1),
    disags2(Board, Disags2),

    fd_all_different(Rows),
    fd_all_different(Cols),
    fd_all_different(Disags1),
    fd_all_different(Disags2).