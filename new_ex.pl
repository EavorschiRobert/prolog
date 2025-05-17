%concat(List, List1, Result)
concat([], L, L).
concat([H1|T1], L, [H1|T2]):-
    concat(T1,L,T2).
%append(Item, List, Result)
append(X, [], [X]).
append(X, [H|T], [H|T1]):-
    append(X,T,T1).


%my_flatten(List, Flatted) vera se Flatted e' List ma senza liste annidate
my_flatten([], []).
my_flatten([X], [X]):-
    not(is_list(X)).
my_flatten(X, [X]):-
    not(is_list(X)).
my_flatten([X|Xs],List):-
    my_flatten(X,Y),!,
    my_flatten(Xs,Ys),!,
    concat(Y,Ys,List).