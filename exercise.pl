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