concatenate([], List, List).
concatenate([Head | Tail1] , List, [Head | Tail2]) :- concatenate(Tail1 , List, Tail2).


reverseList([Head], [Head]):- !.
reverseList([Head | Tail], ReverseList) :- reverseList(Tail , ReverseListTrim) , concatenate(ReverseListTrim, [Head], ReverseList).
