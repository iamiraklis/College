
numeral(0).
numeral(succ(X)) :- numeral(X).

pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1 - Increment
incr(null,f1(null)).              % base f(null) = null
incr(f0(X),f1(X)).                % f1(X) becomes the successor of f0(X)
incr(f1(X),f0(Y)) :- incr(X,Y).   % f0(Y) becomes the successor of f1(X), where Y = f1(X)


%Problem 2 - Legal
legal(f0(null)).                  % base
legal(Y) :- legal(X), incr(X,Y).
incrR(X,Y):- legal(X), incr(X,Y).  % incr(X,Y) if legal


% Problem 3 - Add
add(null,X,X).                    % base X = null
add(X,null,X).                    % base X = null
add(f0(X), f0(Y), f0(Z)) :- add(X,Y,Z).
add(f0(X), f1(Y), f1(Z)) :- add(X,Y,Z).
add(f1(X), f0(Y), f1(Z)) :- add(X,Y,Z).
add(f1(X), f1(Y), f0(Z)) :- add(X,Y,A), incr(A,Z).


%Problem 4 - Multiply
mult(_,null,f0(null)).          % base f0(null) = null
mult(null,_,f0(null)).          % base f0(null) = null
mult(f0(X),Y,Z) :- mult(X,f0(Y),Z).
mult(f1(X),Y,Z) :- mult(X,f0(Y),A), add(A,Y,Z).


% Problem 5 - Reverse
revers(null,null).             % reverse null
revers(f0(X),Y):- revers(X, f0(null),Y).
revers(f1(X),Y):- revers(X, f1(null),Y).
revers(null,X, X).
revers(f0(X), Y, Z) :- revers(X,f0(Y), Z).
revers(f1(X), Y, Z) :- revers(X,f1(Y), Z).


%Problem 6 - Normalize
normalize(null,f0(null)).     %base null = f0(null)
normalize(f0(null),f0(null)). % base f0(null) = f0(null)
normalize(X, Y) :- revers(X, Z), normalizE(Z, A), revers(A, Y).
normalizE(f1(X), f1(X)).
normalizE(f0(X), Y) :- normalizE(X, Y).


% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).


% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).


% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).


% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).


% make a pterm T from a number N numb2term(+N,?T) numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).


% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.


% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
