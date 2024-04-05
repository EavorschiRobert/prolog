%Rimuovi ultimi 3 elementi
removeLasts([_, _, _], []).
removeLasts([H | T], [H | T1]):-
  removeLasts(T, T1).

%Rimuovi i primi 3 e gli ultimi 3
removeFirst([_,_,_| T], T).
removeFirstAndLast([_, _, _ | T], Z):-
  removeLasts(T, Z).

%last(Item, List) vero se Item e ultimo di list
last([X], X).
last([_| T], X):-
  last(T, X).

%penultimo(Item, List) vero se Item e il penultimo elemento di List
penultimo(X, [X, _]).
penultimo(X, [_ | T]):-
  penultimo(X, T).

%element_at(Item, List, Index) vero se Item e in posizione Index di List
element_at(X, [X], 0).
element_at(X, [X|_], 0).
element_at(X, [_ | T], I):-
  element_at(X, T, I1),
  I is I1 + 1.

%len(Length, List) vero se Length e la dimensione di List
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