concatenate([], List, List).
concatenate([Head | Tail1] , List, [Head | Tail2]) :- concatenate(Tail1 , List, Tail2).


reverseList([Head], [Head]):- !.
reverseList([Head | Tail], ReverseList) :- reverseList(Tail , ReverseListTrim) , concatenate(ReverseListTrim, [Head], ReverseList).


/** 文档内的实现方式 **/
reverseListOffical(L, R) :- reverseListOffical(L, [], R).
reverseListOffical([H | T] , A, R) :- reverseListOffical(T, [H|A], R).
reverseListOffical([], A, A):-!.