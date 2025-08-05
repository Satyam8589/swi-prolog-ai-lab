% Base Case: Empty list has sum 0
sum_list([], 0).
% Recursive Case: Add head to sum of tail
sum_list([H|T], Sum):- sum_list(T, S1),
    Sum is S1 + H.




% Base Case: appending to empty list gives List2
my_append([], L, L).

% Recursive Case: add head of List1 to result of appending tail
my_append([H|T], L2, [H|Rest]) :-
    my_append(T, L2, Rest).




% Base Case: empty list
deep_reverse([], []).

% Recursive Case
deep_reverse([H|T], Reversed) :-
    deep_reverse(T, RevT),
    ( is_list(H) ->
        deep_reverse(H, RevH)
    ;
        RevH = H
    ),
    my_append(RevT, [RevH], Reversed).



% Case: found directly
deep_member(X, [X|_]).

% Case: head is list, recurse into it
deep_member(X, [H|_]) :-
    is_list(H),
    deep_member(X, H).

% Case: check rest of the list
deep_member(X, [_|T]) :-
    deep_member(X, T).
