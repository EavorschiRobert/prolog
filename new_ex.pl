%concat(List, List1, Result)
concat([], L, L).
concat([H1|T1], L, [H1|T2]):-
    concat(T1,L,T2).
%append(Item, List, Result)
append(X, [], [X]).
append(X, [H|T], [H|T1]):-
    append(X,T,T1).


%P07 my_flatten(List, Flatted) vera se Flatted e' List ma senza liste annidate
my_flatten([], []).
my_flatten([X], [X]):-
    not(is_list(X)).
my_flatten(X, [X]):-
    not(is_list(X)).
my_flatten([X|Xs],List):-
    my_flatten(X,Y),!,
    my_flatten(Xs,Ys),!,
    concat(Y,Ys,List).

%P08 compress(List, Compressed) vera se Compressed è List senza duplicati consecutivi
%Example:
%?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%X = [a,b,c,a,d,e]
compress([], [], _).
compress([X], [X], _).

compress([H|T], List, H):-
    compress(T, List, H), !.

compress([H|T], [H|T1], _):-
    compress(T, T1, H),!.

start_compress([H|T], [H|T1]):-
    compress(T, T1, H), !.

% P09 (**) Pack consecutive duplicates of list elements into sublists.
% If a list contains repeated elements they should be placed in separate sublists.
% Example:
% ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
pack_list([], [], _).
pack_list(X, [X], _).
