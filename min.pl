min([Head], Head):- !.
min([X ,Y | Tail], Min) :- 
    (
        X>Y -> 
        min([Y|Tail] , Min);
        min([X|Tail] , Min)
    ).