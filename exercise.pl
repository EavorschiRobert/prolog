%Remove last 3 elements
removeLasts([_, _, _], []).
removeLasts([H | T], [H | T1]):-
  removeLasts(T, T1).

%Remove last and first 3
removeFirst([_,_,_| T], T).
removeFirstAndLast([_, _, _ | T], Z):-
  removeLasts(T, Z).

%last(Item, List) true if Item is the last item in list
last([X], X).
last([_| T], X):-
  last(T, X).

%penultimo(Item, List) 
penultimo(X, [X, _]).
penultimo(X, [_ | T]):-
  penultimo(X, T).

%element_at(Item, List, Index) true if Item is in position Index of List
element_at(X, [X], 0).
element_at(X, [X|_], 0).
element_at(X, [_ | T], I):-
  element_at(X, T, I1),
  I is I1 + 1.

%len(Length, List) true if Length is the lenght of List
len(1, [_]).
len(X, [_ | T]):-
  len(X1, T),
  X is X1 + 1.

%pari(Lista)
%dispari(Lista)
pari([]).
pari([_|T]):-
  dispari(T).
dispari([_]).

dispari([_|T]):-
  pari(T).

%reverse(List, ReversedList)

append(X, [], [X]).
append(X, [H|T], [H | T2]):-
  append(X, T, T2).

reverse([], []).
reverse([H|T], Z):-
  reverse(T, Z1),
  append(H, Z1, Z).

%palindroma(Frase)
lastItem(X, [X]).
lastItem(X, [_|T]):-
  lastItem(X, T).

removeLast([_], []).
removeLast([H|T], [H|T1]):-
  removeLast(T, T1).

palindroma([X, X]).
palindroma(Pal):-
  append(H, [H|T], Pal),
  palindroma(T).

%shift(List, ShiftedList)
shift([X], [X]).
shift([H|T], T2):-
  append(H, T, T2).

%translate(List1, List2) true if List2 is List1 translated from numbers to characters
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([], []).
translate(X, Y):-
  means(X, Y).

translate([H|T], [H1|T1]):-
  translate(H, H1),
  translate(T, T1).

%subset(Set, Subset) true if Subset is a generic Subset of Set
subset([], []).
subset([H|T], [H|T1]):-
  subset(T, T1).
subset([_|T], Y):-
  subset(T, Y).

%dividelist(List, List1, List2) true if the concatenation between List1 and List 2 gives List and List1
%and List2 have nearly the same amount of elements
divideright([X], [], [X]).
divideright([H|T], [H|T1], Y):-
  divideleft(T, T1, Y).

divideleft([X], [X], []).
divideleft([H|T], Y, [H|T2]):-
  divideright(T, Y, T2).
dividelist(X, Y, Z):-
  divideleft(X, Y, Z).

%flatten(List, FlatList) true if FlatList is List without annidated lists inside
not(P):-
  P, !, fail;
  true.

%concat(List1, List2, ResultList)
conc([], Y, Y).
conc([H | T], L2, [H | Z]):-
  conc(T, L2, Z).

%X is not a list
flatten([X], [X]):-
  not(is_list(X)), !.
flatten([X], Y):-
  is_list(X),
  flatten(X, Y).
flatten([H|T], [H|T1]):-
  not(is_list(H)),
  flatten(T, T1).
flatten([H|T], List):-
  flatten(H, H1),
  flatten(T, T1),
  conc(H1, T1, List).

%operators
:-op(300, xfx, plays).
:-op(200, xfy, and).
jimmy plays football and squash.

:-op(100, fx, the).
:-op(200, xfx, of).
:-op(300, xfy, was).
diana was the secretary of the department.

%max(X, Y, Max) true if Max is The max between X and Y
max(X, Y, X):-
  X >= Y.
max(X, Y, Y):-
  Y > X.

%maxList(List, Max) true if Max is the bigger item in List

maxList([X, Y], P):-
  max(X, Y, P).

maxList([H|T], P):-
  maxList(T, P1),
  max(H, P1, P).

%sumList(List, Sum) true if Sum is the sum of all elements in List

sumList([X], X).
sumList([H|T], Sum):-
  sumList(T, Sum1),
  Sum is H + Sum1.

%ordered(List) true if List is an ordered list of numbers
ordered([X, Y]):-
  X =< Y.
ordered([H1, H2|T]):-
  H1 =< H2,
  ordered([H2|T]).
%subSum(Set, Sum, SubSet) true if Set is a list of numbers, SubSet is a subset of Set and the sum of all the elements in Subset is Sum
subSum([], 0, []).
subSum([H|T], Sum, [H|T1]):-
  subSum(T, Sum1, T1),
  Sum is Sum1 + H.
subSum([H|T], Sum, List):-
  subSum(T, Sum, List).

%betwen(N1, N2, X) generates all the integers that N1 <= X <= N1
between(X, X, X).
between(X, Y, Z):-
  X1 is X + 1,
  Y is Y - 1,
  between(X1, Y1, Z).
%compress(List, Compressed) remove all consecutive s duplicate
compress([],[]).
compress([X],[X]).

compress([X,X|Xs],Zs):-
  compress([X|Xs],Zs).

compress([X,Y|Ys],[X|Zs]):-
  X \= Y,
  compress([Y|Ys],Zs).
%P09 pack(List, Packed) If a list contains repeated elements they should be placed in separate sublists.
transfer([X], [], [X]).
transfer([H1, H2|T], [H2|T], [H1]):-
  H1 \= H2.
transfer([H1, H2|T], Z, [H1|T1]):-
  transfer([H2|T], Z, T1).
pack([], []).
pack(List, [H1|T1]):-
  transfer(List, T, H1),!,
  pack(T, T1).