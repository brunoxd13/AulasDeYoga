/*
Exercício:
https://rachacuca.com.br/logica/problemas/aula-de-yoga/

Dicas:
1) A aluna de calça Branca está em algum lugar à esquerda da aluna que se matriculou em 2014.
2) Isabela está no segundo lugar.
3) Marta é Motorista.
4) A aluna de calça Verde está em algum lugar entre a Arquiteta e a mulher de 36 anos, nessa ordem.
5) No quarto lugar está a mulher de 30 anos.
6) A Manicure está exatamente à esquerda da aluna que gosta de fazer a Ponte.
7) A aluna de calça Azul está ao lado da aluna de 48 anos.
8) A Psicóloga está em algum lugar entre a aluna matriculada a mais tempo e a Comerciante, nessa ordem.
9) A Motorista está em algum lugar à direita da aluna de calça Branca.
10) A aluna que gosta da posição Lotus está exatamente à esquerda da aluna que gosta da posição Triângulo.
11) A mulher que se matriculou em 2013 está no quarto lugar.
12) A aluna de calça Amarela está em algum lugar entre a aluna matriculada mais recentemente e a aluna de calça Branca, nessa ordem.
13) A mulher de 42 anos gosta da posição Lotus.
14) Alice está em algum lugar à direita da aluna de calça Verde.
15) A aluna que gosta da posição Corvo está no primeiro lugar.
16) As mulheres de 42 e 48 anos estão lado a lado.
17) Quem se matriculou em 2016 está em algum lugar entre quem se matriculou em 2012 e quem se matriculou em 2015, nessa ordem.
18) A aluna que gosta da posição Árvore está em algum lugar à esquerda da aluna de calça Branca.
19) Giovana está ao lado da Comerciante.
*/

:- use_rendering(table,[header(h('Calça', 'Nome', 'Posição', 'Matrícula', 'Idade', 'Profissão'))]).
solucao(Hs) :-
    length(Hs, 5),
    esquerda(h(_,_,_,2014,_,_), h(branca,_,_,_,_,_), Hs),							%1
    Hs = [_,h(_,isabela,_,_,_,_),_,_,_],											%2
    member(h(_,marta,_,_,_,motorista), Hs),											%3
    entre2(h(_,_,_,_,_,arquiteta), h(verde,_,_,_,_,_),h(_,_,_,_,36,_), Hs),   	  	%4
    Hs = [_,_,_,h(_,_,_,_,30,_),_],										      		%5
    nexte(h(_,_,ponte,_,_,_), h(_,_,_,_,_,manicure), Hs),							%6
    next(h(azul,_,_,_,_,_), h(_,_,_,_,48,_), Hs),	                    	     	%7
    entre2(h(_,_,_,2012,_,_), h(_,_,_,_,_,psicóloga),h(_,_,_,_,_,comerciante), Hs),	%8
    direita(h(branca,_,_,_,_,_), h(_,_,_,_,_,motorista), Hs),						%9
    nexte(h(_,_,triângulo,_,_,_), h(_,_,lotus,_,_,_), Hs),							%10
    Hs = [_,_,_,h(_,_,_,2013,_,_),_],										      	%11
    entre2(h(_,_,_,2016,_,_), h(amarela,_,_,_,_,_),h(branca,_,_,_,_,_), Hs),		%12
    member(h(_,_,lotus,_,42,_), Hs),												%13
    direita(h(verde,_,_,_,_,_), h(_,alice,_,_,_,_), Hs),							%14
    Hs = [h(_,_,corvo,_,_,_),_,_,_,_],										      	%15
    next(h(_,_,_,_,42,_), h(_,_,_,_,48,_), Hs),	                    	     		%16
    entre2(h(_,_,_,2012,_,_), h(_,_,_,2016,_,_),h(_,_,_,2015,_,_), Hs),				%17
    esquerda(h(branca,_,_,_,_,_),h(_,_,árvore,_,_,_), Hs),							%18
    next(h(_,giovana,_,_,_,_), h(_,_,_,_,_,comerciante), Hs),	                    %19
    member(h(vermelha,_,_,_,_,_), Hs),												% não informado nas dicas
    member(h(_,_,_,_,24,_), Hs),													% não informado nas dicas
    member(h(_,roberta,_,_,_,_), Hs).												% não informado nas dicas
  

nextd(A, B, Ls) :- append(_, [A,B|_], Ls).
nexte(A, B, Ls) :- append(_, [B,A|_], Ls).

next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).

entre(A, B,C, Ls) :- append(_, [A,B,C|_], Ls).

entre2(A, B, C, Ls) :- append(_, [A,B,_,_,C], Ls).
entre2(A, B, C, Ls) :- append(_, [A,_,B,_,C], Ls).
entre2(A, B, C, Ls) :- append(_, [A,_,_,B,C], Ls).
entre2(A, B, C, Ls) :- append(_, [_,A,B,_,C], Ls).
entre2(A, B, C, Ls) :- append(_, [_,A,_,B,C], Ls).
entre2(A, B, C, Ls) :- append(_, [_,_,A,B,C], Ls).
entre2(A, B, C, Ls) :- append(_, [A,B,_,C,_], Ls).
entre2(A, B, C, Ls) :- append(_, [A,_,B,C,_], Ls).
entre2(A, B, C, Ls) :- append(_, [_,A,B,C,_], Ls).
entre2(A, B, C, Ls) :- append(_, [A,B,C,_,_], Ls).

direita(A, B, Ls) :- append(_, [A,B,_,_,_], Ls).
direita(A, B, Ls) :- append(_, [A,_,B,_,_], Ls).
direita(A, B, Ls) :- append(_, [A,_,_,B,_], Ls).
direita(A, B, Ls) :- append(_, [A,_,_,_,B], Ls).
direita(A, B, Ls) :- append(_, [_,A,B,_,_], Ls).
direita(A, B, Ls) :- append(_, [_,A,_,B,_], Ls).
direita(A, B, Ls) :- append(_, [_,A,_,_,B], Ls).
direita(A, B, Ls) :- append(_, [_,_,A,B,_], Ls).
direita(A, B, Ls) :- append(_, [_,_,A,_,B], Ls).
direita(A, B, Ls) :- append(_, [_,_,_,A,B], Ls).

esquerda(A, B, Ls) :- direita(B,A,Ls).

