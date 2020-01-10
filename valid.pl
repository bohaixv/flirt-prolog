
valid_queen((Row, Col)) :- 
    Range = [1,2,3,4,5,6,7,8],
    member(Row, Range),member(Col, Range).

valid([]) :- !.
valid([Head | Tail]) :- valid_queen(Head) , valid(Tail).
