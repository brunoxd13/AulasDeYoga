/*
Exercício:
https://rachacuca.com.br/logica/problemas/aula-de-yoga/

Dicas:
1) A aluna de calça Branca está em algum lugar à left da aluna que se matriculou em 2014.
2) Isabela está no segundo lugar.
3) Marta é Motorista.
4) A aluna de calça Verde está em algum lugar entre a Arquiteta e a mulher de 36 anos, nessa ordem.
5) No quarto lugar está a mulher de 30 anos.
6) A Manicure está exatamente à left da aluna que gosta de fazer a Ponte.
7) A aluna de calça Azul está ao lado da aluna de 48 anos.
8) A Psicóloga está em algum lugar entre a aluna matriculada a mais tempo e a Comerciante, nessa ordem.
9) A Motorista está em algum lugar à rigth da aluna de calça Branca.
10) A aluna que gosta da posição Lotus está exatamente à left da aluna que gosta da posição Triângulo.
11) A mulher que se matriculou em 2013 está no quarto lugar.
12) A aluna de calça Amarela está em algum lugar entre a aluna matriculada mais recentemente e a aluna de calça Branca, nessa ordem.
13) A mulher de 42 anos gosta da posição Lotus.
14) Alice está em algum lugar à rigth da aluna de calça Verde.
15) A aluna que gosta da posição Corvo está no primeiro lugar.
16) As mulheres de 42 e 48 anos estão lado a lado.
17) Quem se matriculou em 2016 está em algum lugar entre quem se matriculou em 2012 e quem se matriculou em 2015, nessa ordem.
18) A aluna que gosta da posição Árvore está em algum lugar à left da aluna de calça Branca.
19) Giovana está ao lado da Comerciante.
*/

:- use_rendering(table,[header(h('Calça', 'Nome', 'Posição', 'Matrícula', 'Idade', 'Profissão'))]).
slove(S) :-
    length(S, 5),
    left(h(_,_,_,2014,_,_), h(branca,_,_,_,_,_), S),                                 %1
    S = [_,h(_,isabela,_,_,_,_),_,_,_],                                              %2
    member(h(_,marta,_,_,_,motorista), S),                                           %3
    between(h(_,_,_,_,_,arquiteta), h(verde,_,_,_,_,_),h(_,_,_,_,36,_), S),          %4
    S = [_,_,_,h(_,_,_,_,30,_),_],                                                   %5
    nearl(h(_,_,ponte,_,_,_), h(_,_,_,_,_,manicure), S),                             %6
    near(h(azul,_,_,_,_,_), h(_,_,_,_,48,_), S),                                     %7
    between(h(_,_,_,2012,_,_), h(_,_,_,_,_,psicóloga),h(_,_,_,_,_,comerciante), S),  %8
    rigth(h(branca,_,_,_,_,_), h(_,_,_,_,_,motorista), S),                           %9
    nearl(h(_,_,triângulo,_,_,_), h(_,_,lotus,_,_,_), S),                            %10
    S = [_,_,_,h(_,_,_,2013,_,_),_],                                                 %11
    between(h(_,_,_,2016,_,_), h(amarela,_,_,_,_,_),h(branca,_,_,_,_,_), S),         %12
    member(h(_,_,lotus,_,42,_), S),                                                  %13
    rigth(h(verde,_,_,_,_,_), h(_,alice,_,_,_,_), S),                                %14
    S = [h(_,_,corvo,_,_,_),_,_,_,_],                                                %15
    near(h(_,_,_,_,42,_), h(_,_,_,_,48,_), S),                                       %16
    between(h(_,_,_,2012,_,_), h(_,_,_,2016,_,_),h(_,_,_,2015,_,_), S),              %17
    left(h(branca,_,_,_,_,_),h(_,_,árvore,_,_,_), S),                                %18
    near(h(_,giovana,_,_,_,_), h(_,_,_,_,_,comerciante), S),                         %19
    member(h(vermelha,_,_,_,_,_), S),                                                % não informado nas dicas
    member(h(_,_,_,_,24,_), S),                                                      % não informado nas dicas
    member(h(_,roberta,_,_,_,_), S).                                                 % não informado nas dicas
 
%testa todas que estão ao lado direito, quando não sei quem está ao lado
rigth(A, B, Ls) :- append(_, [A,B,_,_,_], Ls).
rigth(A, B, Ls) :- append(_, [A,_,B,_,_], Ls).
rigth(A, B, Ls) :- append(_, [A,_,_,B,_], Ls).
rigth(A, B, Ls) :- append(_, [A,_,_,_,B], Ls).
rigth(A, B, Ls) :- append(_, [_,A,B,_,_], Ls).
rigth(A, B, Ls) :- append(_, [_,A,_,B,_], Ls).
rigth(A, B, Ls) :- append(_, [_,A,_,_,B], Ls).
rigth(A, B, Ls) :- append(_, [_,_,A,B,_], Ls).
rigth(A, B, Ls) :- append(_, [_,_,A,_,B], Ls).
rigth(A, B, Ls) :- append(_, [_,_,_,A,B], Ls).

%testa todas que estão ao lado esquerdo, quando não sei quem está ao lado
left(A, B, Ls) :- rigth(B,A,Ls).

%quando está entre duas pessoas
between(A, B, C, Ls) :- append(_, [A,B,_,_,C], Ls).
between(A, B, C, Ls) :- append(_, [A,_,B,_,C], Ls).
between(A, B, C, Ls) :- append(_, [A,_,_,B,C], Ls).
between(A, B, C, Ls) :- append(_, [_,A,B,_,C], Ls).
between(A, B, C, Ls) :- append(_, [_,A,_,B,C], Ls).
between(A, B, C, Ls) :- append(_, [_,_,A,B,C], Ls).
between(A, B, C, Ls) :- append(_, [A,B,_,C,_], Ls).
between(A, B, C, Ls) :- append(_, [A,_,B,C,_], Ls).
between(A, B, C, Ls) :- append(_, [_,A,B,C,_], Ls).
between(A, B, C, Ls) :- append(_, [A,B,C,_,_], Ls).

%quando não é informado aode quem está
near(A, B, Ls) :- append(_, [A,B|_], Ls).
near(A, B, Ls) :- append(_, [B,A|_], Ls).

%quando é informado a esquerda de quem está
nearl(A, B, Ls) :- append(_, [B,A|_], Ls).

%quando é informado a direita de quem está
nearr(A, B, Ls) :- append(_, [A,B|_], Ls).

