/* p(Calça,Nome,Posição,Matrícula,Idade,Profissão)*/
gera(p(C, N, P, M, I, L)) :-
    member(C, [azul,verde,amarela,branca,vermelha]),
    member(N, [roberta,isabela,alice,giovana,marta]),
    member(P, [corvo,arvore,lotus,triangulo,ponte]),
    member(M, [2012,2016,2015,2013,2014]),
    member(I, [24,48,42,30,36]),
    member(L, [arquiteta,psicologa,comerciante,manicure,motorista]).

dif(p(C1, N1, P1, M1, I1, L1), p(p(C2, N2, P2, M2, I2, L2))) :-
        C1 \= C2, N1 \= N2, P1 \= P2, M1 \= M2, I1 \= I2, L1 \=L2.

todas_dif(P1, P2, P3, P4, P5) :-
        dif(P1, P2), dif(P1, P3), dif(P1, P4), dif(P1, P5),
        dif(P2, P3), dif(P2, P4), dif(P2, P5), dif(P3, P4), 
    	dif(P3, P5), dif(P4, P5).

gera_ef(P1, P2, P3, P4, P5) :-
        P1 = p(azul, _, _, _, _, _),
        P2 = p(verde, _, _, _, _, _),
        P3 = p(amarela, _, _, _, _, _),
        P4 = p(branca, _, _, _, _, _),
    	P5 = p(vermelha, _, _, _, _, _),
        gera(P1), gera(P2), gera(P3), gera(P4), gera(P5),
        todas_dif(P1, P2, P3, P4, P5).

solucao2(S) :-
        S = [P1, P2, P3, P4, P5],
        gera_ef(P1, P2, P3, P4, P5),
    	member(p(azul, _, corvo, 2012, 24, arquiteta), S), 
        member(p(verde, isabela, arvore, M, 48, psicologa), S), M\=2012,
        member(p(amarela, alice, lotus, 2015, I, L), S), L\=psicologa, I\=48, 
        member(p(branca, N, triagulo, M, 30, _), S), N\=alice, M\=2015,
        member(p(vermelha, marta, _, _, 36, motorista), S),
        !.