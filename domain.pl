fd_domain([], Min, Max):-!.
fd_domain([Head | Tail] , Min, Max) :- Head >= Min, Head =< Max, Min < Max, fd_domain(Tail, Min, Max).

practice(A,B):- 
    B = A,
    A = [S1,S2,S3],
    fd_domain(B , 1, 4).