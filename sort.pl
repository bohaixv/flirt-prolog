/* 冒泡排序 我自己写的 */
sortBubble([Head], [Head]) :- !.
sortBubble([X, Y | Tail] , List) :- 
    (
        X >= Y -> 
            sortBubble([X | Tail], List1), List = [Y | List1];
            sortBubble([Y | Tail], List1), List = [X | List1]
    ).

sortWrapper([], ACC, ACC) :- !.
sortWrapper([_ | Tail], Source, Sorted) :- sortBubble(Source, Sorted1), sortWrapper(Tail, Sorted1, Sorted).

bubbleSort(List,Sorted ) :- sortWrapper(List, List, Sorted).

/* 插入排序*/
insertSort(List, Sorted) :- iSort(List, [], Sorted).

iSort([], Acc, Acc) :- !.
iSort([H | T], Acc, Sorted) :- insert(H , Acc, NtAcc), iSort(T, NtAcc, Sorted).

insert(X , [Y | T], [Y | NT]) :- X>=Y , insert(X, T , NT) .
insert(X, [Y | T], [X, Y | T]) :- X<Y .
insert(X, [], [X]) :- !.

/** 官方文档的冒泡算法，贼带劲 **/
sort_bubble(List, Sorted) :- b_sort(List, [], Sorted).

b_sort([], ACC, ACC):- !.
b_sort([H | T], ACC , Sorted) :- bubble(H , T, NT, Max), b_sort(NT, [Max | ACC], Sorted).

bubble(X, [], [], X) :- !.
bubble(X, [Y | Tail], [Y | NT], Max) :- X >= Y , bubble(X , Tail, NT, Max).
bubble(X, [Y | Tail], [X | NT], Max) :- X<Y , bubble(Y , Tail, NT, Max).