/*
Предположим, что кем-то уже написаны на Прологе
утверждения, определяющие следующие отношения:
мужчина(Х)  X – мужчина
женщина(Х)  X - женщина
отец(Х,Y)  X является отцом Y
мать(Х, Y)  X является матерью Y
родитель(Х,Y)  X является родителем Y
различны(Х,Y)  X и Y различны


Задача состоит в том, чтобы написать правила для следующих отношений:

является_матерью(Х)  X является матерью
является_отцом(Х)  X является отцом
является_сыном(Х)  X является сыном
общие_родители(Х,Y)  X и Y имеют общих родителей
является_сестрой(Х,Y)  X является сестрой Y
дедушка(Х, Y)  X является дедушкой Y
*/


male(artem).
male(vladislav).
male(egor).
male(vladimir).

female(alice).
female(victoria).

father(egor, artem).
father(artem, vladislav).
father(artem, alice).
father(vladislav, vladimir).

mother(victoria, vladislav).
mother(victoria, alice).

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).


is_mother(X) :- mother(X, _).
is_father(X) :- father(X, _).


is_son(X) :- male(X), parent(_, X).

same_parents(X, Y) :-
    dif(X, Y),
    mother(M, X),
    mother(M, Y),
    father(F, X),
    father(F, Y).

sister_of(X, Y) :-
    female(X),
    same_parents(X, Y).

grandpa_of(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).



