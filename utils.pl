/*
https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/
https://www.lix.polytechnique.fr/~catuscia/teaching/cg428/exercises/Prolog_solutions.html
*/
%functor
data(25, 12, 2997).

%segmento verticale o orizzontale
point(X, Y).
seg(point(X1, Y1), point(X2, Y2)).
vertical(seg(point(X,Y), point(X, Z))).
oriz(seg(point(X, Y), point(Z, Y))).
%list [Head, Tail] oppure [Head | Tail] oppure [H1, H2 | Tail]

%Membership
member([X|_], X).
member([X | Y], Z):-
  member(Y, Z).
%concat(List1, List2, ResultList)
concat([], Y, Y).
concat([H | T], L2, [H | Z]):-
  concat(T, L2, Z).

%add(Item, List, ResultList)
add(X, [], [X]).
add(X, [H | T], [X, H | T]).

%del(Item, List, ResultList)
del(X, [X], []).
del(X, [X | T], T).
del(X, [H | T], [H |T1]):-
  del(X, T, T1).

%insert(Item, List, Result):-
insert(X, List, BiggerList):-
  del(X, BiggerList, List).

%sublist(SubList, List)
sublist(S, L):-
  concat(L1, L2, L),
  concat(S, L3, L2).
%permutation(List, Permutation).
permutation([], []).
permutation([X | T], P):-
  permutation(T, L1),
  insert(X, L1, P).
%append(Item, List, ResultList)
append(X, [], [X]).
append(X, [H|T], [H | T2]):-
  append(X, T, T2).