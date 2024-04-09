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
add(X, [], [X]).
add(X, [H | T], [X, H | T]).

flatten([], []).
flatten([X], X).
flatten([H|T],  [H1|T1]):-
  flatten([H], H1),
  flatten(T, T1).


