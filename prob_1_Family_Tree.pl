% ------------ Facts ------------

% Gender
male(rahul).
male(arjun).
male(vivek).
male(amit).

female(sita).
female(neha).
female(geeta).
female(meena).
female(rani).

% Marriage
married(rahul, sita).
married(sita, rahul).
married(arjun, geeta).
married(geeta, arjun).
married(neha, amit).
married(amit, neha).

% Parent-child relationships
father(rahul, arjun).
father(rahul, neha).

mother(sita, arjun).
mother(sita, neha).

father(arjun, vivek).
father(arjun, meena).

mother(geeta, vivek).
mother(geeta, meena).

father(amit, rani).
mother(neha, rani).

% ------------ Derived Rules ------------

% Child
child(X, Y) :- father(Y, X).
child(X, Y) :- mother(Y, X).

% Grandchild
grandchild(X, Y) :- child(X, Z), child(Z, Y).

% Descendant
descendant(X, Y) :- child(X, Y).
descendant(X, Y) :- child(X, Z), descendant(Z, Y).

% Sibling
sibling(X, Y) :-
    father(F, X), father(F, Y),
    mother(M, X), mother(M, Y),
    X \= Y.

% Sister
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Aunt
aunt(X, Y) :-
    parent(P, Y),
    sibling(X, P),
    female(X).

% Helper rule to define parent
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

% Mother-in-law
mother_in_law(X, Y) :-
    married(Y, Z),
    mother(X, Z).
