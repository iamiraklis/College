% Problem 1
s --> [2].
s --> u,[2],u.
s --> v,[2],v.
s --> u,v,s,v,u.
s --> v,u,s,u,v.
u --> [1].
v --> [0].


% Problem 2
nbd -->  [h(Col1,Nat1,Pet1),h(Col2,Nat2,Pet2),h(Col3,Nat3,Pet3)],
         {lex(Col1,col),lex(Nat1,nat), lex(Pet1,pet),
         lex(Col2,col), lex(Nat2,nat),lex(Pet2,pet),
         lex(Col3,col), lex(Nat3,nat), lex(Pet3,pet),
         Col1\=Col2, Nat1\= Nat2, Pet1\=Pet2,
         Col1\=Col3, Nat1\=Nat3,Pet1\=Pet3,
         Col2 \=Col3, Nat2\=Nat3,Pet2\=Pet3}.

col(Word) --> [Word], {lex(Word, col)}.
nat(Word) --> [Word], {lex(Word, nat)}.
pet(Word) --> [Word], {lex(Word, pet)}.

lex(red, col).
lex(blue, col).
lex(green, col).
lex(english, nat).
lex(spanish, nat).
lex(japanese, nat).
lex(jaguar, pet).
lex(snail, pet).
lex(zebra, pet).

% Problem 3.1
accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

final(q1).

tran(Y,0,n0) :- Y = q0; Y = q1; Y = n0.
tran(Y,1,n1) :- Y = q0; Y = q1; Y = n0.
tran(n1,X,h1):- X = 0 ; X = 1.
tran(h1,X,q1):- X = 0 ; X = 1.

% Problem 3.2
q0 --> steps1(q,F),{final1(F)}.
steps1(Q,Q) --> [].
steps1(Q,Q2) --> tran1(Q,Qn), steps1(Qn,Q2).

final1(q1).
tran1(State,n0) --> [0], {State = q;State = q1;State = n0}.
tran1(State,n1) --> [1], {State = q;State = q1;State = n0}.
tran1(n1,h1) -->[Symbol], {Symbol = 0; Symbol = 1}.
tran1(h1,q1) -->[Symbol], {Symbol = 0; Symbol = 1}.
