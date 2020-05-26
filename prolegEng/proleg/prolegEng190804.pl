:-dynamic indent/1.
:-dynamic proved/1.
:-dynamic allege/2.
:-dynamic admission/2.
:-dynamic plausible/2.
:-dynamic plausible/1.
:-dynamic producing_of_evidence/2.

:-dynamic fact/1.
:-dynamic nonfact/1.

:-dynamic exception/2.
:-dynamic exception/3.
:-dynamic debug_flag/1.
:-dynamic dummy/1.
:-dynamic is_a/2.
:-dynamic analyze_flag/1.
:-dynamic built_in_pred/1.
:-dynamic obvious_fact/1.
:-dynamic defendant/1.
:-dynamic plaintiff/1.
:-dynamic arg_info/1.

:- op(1100, xfx, user:(<=)).
:- op(1050, xfy, user:(&)).

:- op(480, xfy, user:(year)).
:- op(460, xfy, user:(month)).
:- op(440, xf, user:(day)).

:- op(440, xf, user:(euro)).
:- op(440, xf, user:(thousand_euro)).
:- op(440, xf, user:(tenthousand_euro)).
:- op(440, xf, user:(million_euro)).

:- discontiguous allege/2.
:- discontiguous allege_cond/2.
:- discontiguous allege_all/2.
:- discontiguous producing_of_evidence/2.
:- discontiguous possible_evidence/1.
:- discontiguous possible_evidence_cond/1.
:- discontiguous prove/2.
:- discontiguous prove_cond/2.
:- discontiguous defense/2.
:- discontiguous exception/2.
:- discontiguous (<=)/2.
:- discontiguous possible_instance1/1.
:- discontiguous print_message/3.

allege(X,_):- fact(X).
producing_of_evidence(X,_):- fact(X).
plausible(X,_):- fact(X).
plausible(X):- fact(X).

allege(X,_):- nonfact(X).
producing_of_evidence(X,_):- nonfact(X).

r:-reconsult('prolegEng190804.pl').

analyze:-abolish(analyze_flag/1),assert(analyze_flag(on)).
noanalyze:-abolish(analyze_flag/1),assert(analyze_flag(off)).

verbosedebug:-abolish(debug_flag/1),assert(debug_flag(on)).
noverbosedebug:-abolish(debug_flag/1),assert(debug_flag(off)).

analyze_flag(off).
debug_flag(off).

debugprint(X):-
    (debug_flag(on) -> (print(X),nl,flush);true).
%%%%%%%%%%%%%%%%%%%%%%%%%%% For Debug %%%%%%%%%%%%%%%%%%%%%%%%%%%
allege_all(X,P):-
    debugprint(announcing(X,P)),
    fail.
allege_cond(Cond,P):-
    debugprint(allege_cond(Cond,P)),
    fail.
possible_evidence(X):-
    debugprint(possible_evidence(X)),
    fail.
possible_evidence_cond(X):-
    debugprint(possible_evidence_cond(X)),
    fail.
prove_cond(Cond,P):-
    debugprint(prove_cond(Cond,P)),
    fail.
% producing_of_evidence(X,P):-
%    degugprint(producing_of_evidence(X,P)),fail.
% plausible(X,P):-
%    debugprint(plausible(X,P)),fail.
% plausible(X):-
%    debugprint(plausible(X)),fail.

prove(X,P):-
    debugprint(proving(X,P)),
    fail.
defense(X,O):-
    debugprint(defense(X,O)),
    fail.
%%%%%%%%%%%%%%%%%%%%%%%%%%% For Debug %%%%%%%%%%%%%%%%%%%%%%%%%%%
% definition: built_in_predicates

before_the_day(Y1 year _ month _ day,Y2 year _ month _ day):-Y1<Y2,!.
before_the_day(Y year M1 month _ day,Y year M2 month _ day):-M1<M2,!.
before_the_day(X year M month D1 day,X year M month D2 day):-D1<D2,!.

same_day_or_before_the_day(Y1 year _ month _ day,Y2 year _ month _ day):-Y1<Y2,!.
same_day_or_before_the_day(Y year M1 month _ day,Y year M2 month _ day):-M1<M2,!.
same_day_or_before_the_day(X year M month D1 day,X year M month D2 day):-D1<D2,!.
same_day_or_before_the_day(X year M month D day,X year M month D day):-!.

after_the_day(Y1 year _ month _ day,Y2 year _ month _ day):-Y1>Y2,!.
after_the_day(Y year M1 month _ day,Y year M2 month _ day):-M1>M2,!.
after_the_day(X year M month D1 day,X year M month D2 day):-D1>D2,!.

same_day_or_after_the_day(Y1 year _ month _ day,Y2 year _ month _ day):-Y1>Y2,!.
same_day_or_after_the_day(Y year M1 month _ day,Y year M2 month _ day):-M1>M2,!.
same_day_or_after_the_day(X year M month D1 day,X year M month D2 day):-D1>D2,!.
same_day_or_after_the_day(X year M month D day,X year M month D day):-!.

nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=1, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=28, Y=2, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=3, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=30, Y=4, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=5, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=30, Y=6, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=7, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=8, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=30, Y=9, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=10, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=30, Y=11, Xn is X, Yn is Y + 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Z=31, Y=12, Xn is X + 1, Yn is 1, Zn is 1,!.
nextday(X year Y month Z day,Xn year Yn month Zn day):- Xn is X, Yn is Y, Zn is Z + 1,!.

euro_compare(P):- P=..[OP,X,Y], euro2num(X,NEX), NX is NEX, euro2num(Y,NEY), NY is NEY, NP=..[OP,NX,NY], call(NP).

euro2num(P,NP):- P =.. [OP,X,Y],!,euro2num(X,NX), euro2num(Y,NY), NP =.. [OP,NX,NY].
euro2num(X euro, NX) :-!, NX is X.
euro2num(X thousand_euro, NX) :-!, NX is X * 1000.
euro2num(X tenthousand_euro,NX) :-!, NX is X * 10000.
euro2num(X million_euro, NX) :-!, NX is X * 1000000.
euro2num(X,X) :- number(X),!.

% definition: built_in_predicates

print_message(obvious,X,_):-
       indent(N), N2 is N + 2, tab(N2),
       print_proc(X),
       print('is obvious.'),nl.

print_message(builtin,_,_):-
       !.

print_message(prolegcond,_,_):-
       !.

allege_all(X,_):-
       is_a(X,built_in_pred),!,call(X).
allege_all(proleg_cond(X),_):-
       !,call(X).

rightexists(X):-
       abolish(indent/1),assert(indent(0)),
       finddefendant(P), prove(X,P).

finddefendant(P):-defendant(P),!.
finddefendant(plaintiff).

findplaintiff(P):-plaintiff(P),!.
findplaintiff(defendant).

% prove(X=Y,P):-!,X=Y.
prove(X,P):-
        is_a(X,built_in_pred),!,
        call(X),
        print_message(builtin,X,P).

prove(proleg_cond(X),P):-
        !,
        call(X),
        print_message(prolegcond,X,P).

allege_all(X,_):-
          is_a(X,obvious_fact),!,allege(X,_),call(X).

% producing_of_evidence(X,P):-
%         is_a(X,obvious_fact),!.
prove(X,P):-
        is_a(X,obvious_fact),!,
        call(X),
        print_message(obvious,X,P).

% admission
prove(X,P):-
    is_a(X,prerequisite),
    debugprint(is_a(X,prerequisite)),
    opposite(P,O),
    admission(X,O),!,
    print_message(fact_admission,O,X).

prove(X,P):-
    is_a(X,prerequisite),
    debugprint(is_a(X,prerequisite)),
    print_message(fact_proof_start,P,X),
  (((plausible(X,_);plausible(X)),
    print_message(plausible_evidence,P,X))->
        print_message(fact_proof_success,P,X);(print_message(fact_proof_failure,P,X),!,fail)).

prove(X,P):-
    is_a(X,legal_effect),
    allegecheck(X,_),
    evidencecheck(X),
    prove_maincheck(X,P).

prove_maincheck(X,P):-
    print_message(rule_proof_start,P,X),
%     ground(X),
    prove_main(X,P),
    opposite(P,O),
    \+defense(X,O),!,
    print_message(rule_proof_success,P,X).
% prove_maincheck(X,P):-
%     \+ground(X),print('Error: '),print(X),print(' is not ground for maincheck.'),nl,!,fail.
prove_maincheck(X,P):-
    print_message(rule_proof_failure,P,X),!,fail.

print_message(show_rules,(X,Body),_):-!,
    indent(N),
     tab(N),
     print('To prove '), print_proc(X),
     ((Body=(Theory&Cond))->(print(', by'),print(Theory));(Cond=Body)),
     print(','),nl,tab(N),print('we need to prove the following requisites:'),nl,
%    tab(N), print_proc(X), print(if),
    nl,
    N4 is N+4,
    print_cond(N4,Cond,1),
%    tab(N), print(fi),
    nl.

print_cond(N,(Atom,Rest),CondNo):-is_a(Atom,builtin),\+(Atom=before_the_day(_,_)),!,
    print_cond(N,Rest,CondNo).
print_cond(N,(Atom,Rest),CondNo):-!,
    tab(N),print('requisite'),print(CondNo),print(': '),print(Atom),nl,CondNo1 is CondNo +1,
    print_cond(N,Rest,CondNo1).
print_cond(_,Atom,_):-is_a(Atom,builtin),\+(Atom=before_the_day(_,_)),!.
print_cond(N,Atom,CondNo):-!,
    tab(N),print('requisite'),print(CondNo),print(': '),print(Atom),nl.

allege_all(X,P):-
    is_a(X,legal_effect),!,
    (X<=Body),
    allege_cond(Body,P).
allege_all(X,P):-!,
    debugprint(checking(allegeoradmission(X,P))),
    (allege(X,P);admission(X,_)),
    debugprint(checked(allegeoradmission(X,P))).

allege_cond((Cond,Rest),_):-!,
    allege_all(Cond,_), allege_cond(Rest,_).
allege_cond(Cond,_):- % \+Cond=(_,_),!,
    debugprint(checking(allege(Cond,_))),
    allege_all(Cond,_).

allege_condcheck(X,_):-
    setof(X,allege_cond(X,_),L),!,
    debugprint(allegecondpossible_instance(L)),
    member(X,L).
allege_fail_analize(X,L):-
    is_a(X,legal_effect),!,
    (X<=Cond), allege_fail_analize_cond(Cond,[X|L]).
allege_fail_analize(X,L):-
    is_a(X,prerequisite),
    ((allege(X,_);admission(X,_))->true;(indent(N),N2 is N+2, tab(N2),print(allege(X,_)),print(' not found at '),print(L),nl,!,fail)).
allege_fail_analize(X,L):-
    is_a(X,built_in_pred),!,(call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail)).
allege_fail_analize(proleg_cond(X),L):-
    !,(call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail)).
allege_fail_analize(X,L):-
    is_a(X,obvious_fact),!,
    (allege(X,_)->
       (call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail));
       (indent(N),N2 is N+2, tab(N2),print(allege(X,_)),print(' not found at '),print(L),nl,!,fail)).
allege_fail_analize_cond((Cond,Rest),L):-!,
    allege_fail_analize(Cond,L), allege_fail_analize_cond(Rest,L).
allege_fail_analize_cond(Cond,L):- % \+Cond=(_,_),!,
    allege_fail_analize(Cond,L).

possible_evidence(X):-
    is_a(X,legal_effect),!,
    (X<=Body),
    possible_evidence_cond(Body).
possible_evidence(X):-
    is_a(X,built_in_pred),!,call(X).
possible_evidence(proleg_cond(X)):-
    !,call(X).
possible_evidence(X):-
    is_a(X,obvious_fact),!,call(X).
possible_evidence(X):-
    is_a(X,prerequisite), admission(X,_),!.
possible_evidence(X):-
    is_a(X,prerequisite), producing_of_evidence(X,_).
% possible_evidence(X):-
%     is_a(X,prerequisite), plausible(X,_),!.
possible_evidence_cond((Cond,Rest)):-!,
    possible_evidence(Cond), possible_evidence_cond(Rest).
possible_evidence_cond(Cond):-!,
    possible_evidence(Cond).

possible_evidence_condcheck(Cond):-!,
    setof(Cond,possible_evidence_cond(Cond),L),
    debugprint(possible_evidence_condcheck(Cond,L)),
    member(Cond,L).

possible_evidence_fail_analize(X,L):-
    is_a(X,legal_effect),!,
    (X<=Cond), possible_evidence_fail_analize_cond(Cond,[X|L]).
possible_evidence_fail_analize(X,L):-
    is_a(X,prerequisite),
    ((producing_of_evidence(X,_);admission(X,_))->true;(indent(N),N2 is N+2, tab(N2),print(producing_of_evidence(X,_)),print(' not found at '),print(L),nl,!,fail)).
% 以下の2つのルールが適用されることは通常ないはず。懼ﾃｸﾕallege_fail_analyzeでfailしているはずだから
possible_evidence_fail_analize(X,L):-
    is_a(X,built_in_pred),!,(call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail)).
possible_evidence_fail_analize(proleg_cond(X),L):-
    !,(call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail)).
possible_evidence_fail_analize(X,L):-
    is_a(X,obvious_fact),!,(call(X)->true;(indent(N),N2 is N+2, tab(N2),print(X),print(' fail at '),print(L),nl,!,fail)).
possible_evidence_fail_analize_cond((Cond,Rest),L):-!,
    possible_evidence_fail_analize(Cond,L), possible_evidence_fail_analize_cond(Rest,L).
possible_evidence_fail_analize_cond(Cond,L):- % \+Cond=(_,_),!,
    possible_evidence_fail_analize(Cond,L).

prove_main(X,P):-
%     print(prove_main(X,P)),nl,
    (X<=Body),
    allege_condcheck(Body,P),
    possible_evidence_condcheck(Body),
    print_message(show_rules,(X,Body),P),
    prove_cond(Body,P).
prove_cond((Cond,Rest),P):-!,
    prove(Cond,P), prove_cond(Rest,P).
prove_cond(Cond,P):-!,
    prove(Cond,P).

defense(X,O):-
    exception(X,Defense),
    prove_exception(X,Defense,O).

prove_exception(E,X,O):-
%    print(prove_exception(E,X,O)),nl,
    allegecheck(X,_),
    evidencecheck(X),
    print_message(exception_start,O,E,X),
    prove_exceptioncheck(X,O,E).

% allegeでpossible ground instanceを見つける。
allegecheck(X,O):-
    setof(X,allege_all(X,O),L),!,
    debugprint(allegepossible_instance(X,L)),
    member(X,L).
allegecheck(X,_):-
    analyze_flag(on),allege_fail_analize(X,[]),!,fail.

evidencecheck(X):-
    setof(X,possible_evidence(X),L),!,
    debugprint(evidencecheck(X,L)),
    member(X,L).
evidencecheck(X):-
    analyze_flag(on),possible_evidence_fail_analize(X,[]),!,fail.

% \+ defense(X,O)から呼ばれているため、prove(X,O)が１回成功すれば、ここに戻ってくることはない。
% したがって、２番目のルールが適用されfail messageが出るのは、prove(X,O)が全部失敗するときのみとなる。
prove_exceptioncheck(X,O,C):-
%     ground(X),
    prove(X,O),print_message(exception_success,O,C,X),!.
% prove_exceptioncheck(X,O,C):-
%     \+ground(X),print('Error: '),print(X),print(' is not ground for exception.'),nl,!,fail.
prove_exceptioncheck(X,O,C):-
    print_message(exception_fail,O,C,X),!,fail.

inverse(-X,X):-!.
inverse(X,-X):-!.

opposite(X,Y):-finddefendant(X),findplaintiff(Y),!.
opposite(X,Y):-findplaintiff(X),finddefendant(Y),!.

% 以下はトレース出力用述語

print_message(fact_proof_start,P,X):-!,
    increment_indent(N2), tab(N2),
    print(P), print(' tried to prove '), print_proc(X), print('.'), nl.
print_message(fact_proof_success,P,X):-!,
    decrement_indent(N2), tab(N2),
    print(P), print(' successfully proved '), print_proc(X), print('.'), nl.
print_message(fact_proof_failure,P,X):-!,
    decrement_indent(N2), tab(N2),
    print(P),print(' failed to prove '),print_proc(X), print('.'), nl.

% print_message(fact_proof_start,P,X):-
%     increment_indent(N2), tab(N2),
%     print(P), print(は), print_proc(X), print('のproveを行った。'),nl,flush.
% print_message(fact_proof_success,P,X):-
%     decrement_indent(N2), tab(N2),
%     print(P), print(は), print_proc(X), print('のproveに成功した。'),nl,flush.
% print_message(fact_proof_failure,P,X):-
%     decrement_indent(N2), tab(N2),
%     print(P),print(は),print_proc(X), print('のproveに失敗した。'),nl,flush.

print_message(rule_proof_start,P,X):-
    increment_indent(N2), tab(N2),
    print(P), print(' tried to prove '), print_proc(X), print('.'), nl.
print_message(rule_proof_success,P,X):-
    decrement_indent(N2), tab(N2),
    print(P), print(' successfully proved '), print_proc(X), print('.'), nl.
print_message(rule_proof_failure,P,X):-
    decrement_indent(N2), tab(N2),
    print(P),print(' failed to prove '),print_proc(X), print('.'), nl.

% print_message(rule_proof_start,P,X):-
%     increment_indent(N2), tab(N2),
%     print(P), print(は), print_proc(X), print('というallegeをする。'),nl,flush.
% print_message(rule_proof_success,P,X):-
%     decrement_indent(N2), tab(N2),
%     print(P), print(の), print_proc(X), print('というallegeは認められた。'),nl,flush.
% print_message(rule_proof_failure,P,X):-
%     decrement_indent(N2), tab(N2),
%     print(P),print(の),print_proc(X), print('というallegeは認められなかった。'),nl,flush.

print_message(plausible_evidence,_,X):-
    is_a(X,legal_effect)->
    true;
   (indent(N), N2 is N + 2, tab(N2),
    print_proc(X), print(' is over the stringent belief level.'),nl).

% print_message(plausible_evidence,_,X):-
%     is_a(X,legal_effect)->
%     true;
%    (indent(N), N2 is N + 2, tab(N2),
%     print_proc(X), print('の心証度はprove度を超えている。'),nl).

% print_message(fail_plausible_evidence,P,X):-
%     is_a(X,legal_effect)->
%     true;
%    (indent(N), N2 is N + 2, tab(N2),
%     print(P), print('は、proveを尽くしたが'),nl,
%     N4 is N2 + 2, tab(N4),
%     print_proc(X), print('の蓋然性の高いevidenceを提出できなかった。'),nl).
print_message(exception_start,O,E,X):-!,
    ((E=(C&Theory))->true;C=E),
    increment_indent(N2), tab(N2),
    print(O),print(' alleges '),print_proc(X),nl,tab(N2),
    print(' as a defense against '), print_proc(C),
    ((E=(C&Theory))->(print(' by '), print(Theory));true),
    print('.'),nl.
print_message(exception_success,O,C,X):-!,
    decrement_indent(N2), tab(N2),
    print(O), print(' successfully proved '),
    print_proc(X), nl,tab(N2),
    print(' as a defense against '),
    print_proc(C), print('.'),nl.
print_message(exception_fail,O,C,X):-!,
    decrement_indent(N2), tab(N2),
    print(O), print(' failed to prove '),
    print_proc(X),nl,tab(N2),
    print(' as a defense against '),
    print_proc(C), print('.'),nl.

% print_message(exception_start,O,E,X):-
%     increment_indent(N2), tab(N2),
%     print(O),print('は'),
%     print_proc(E),
%     print('に対する抗弁として'),print_proc(X),print('をallegeする。'),nl,flush.
% print_message(exception_success,O,C,X):-
%     decrement_indent(N2), tab(N2),
%     print(O),print('の'),print_proc(C),
%     print('に対する抗弁である'),print_proc(X),print('は認められた。'),nl,flush.
% print_message(exception_fail,O,C,X):-
%     decrement_indent(N2), tab(N2),
%     print(O),print('の'),print_proc(C),
%     print('に対する抗弁である'),print_proc(X),print('は認められなかった。'),nl,flush.
print_message(alleged,X,P):-
    indent(N), N2 is N + 2, tab(N2),
    print(P), print('は'), print_proc(X),print('をallegeする。'),nl,flush.
print_message(fact_admission,P,X):-!,
    indent(N), N2 is N + 2, tab(N2),
    print(P), print(' admitted '), print_proc(X),print('.'),nl.

% print_message(fact_admission,P,X):-
%     indent(N), N2 is N + 2, tab(N2),
%     print(P), print('は、相手方の事実allege'), print_proc(X),print('を認めた。'),nl,flush.

increment_indent(N2):- 
    retract(indent(N)), N2 is N+2,
    assert(indent(N2)).  decrement_indent(N2):- retract(indent(N2)),
    N is N2-2, assert(indent(N)).

print_proc(-X):-print('"-'),print(X),print('"').
print_proc(X):- print('"'),print(X),print('"').

%%%%%%%%%%%%%%%%%%%%%%%%%%% For Debug %%%%%%%%%%%%%%%%%%%%%%%%%%%
% allege(P,X):-
%    debugprint(allege_fail(P,X)),!,fail.
possible_evidence(X):-
   debugprint(possible_evidence_fail(X)),!,fail.
prove_cond(Cond,P):-
   debugprint(prove_cond_fail(Cond,P)),!,fail.
% producing_of_evidence(X,P,A):-
%    debugprint(evidence_fail(X,P,A)),!,fail.
% prove(X,P):-
%    debugprint(prove_fail(X,P)),!,fail.
%%%%%%%%%%%%%%%%%%%%%%%%%%% For Debug %%%%%%%%%%%%%%%%%%%%%%%%%%%
copy(X,Y):-
  assert(dummy(X)),
  retract(dummy(Y)).

%%%%%%%%%%%%%%%%%%%%%%%%%%% Class Knowledge %%%%%%%%%%%%%%%%%%%%%
% General Knowledge

is_a(X,legal_effect):-functor(X,P,N),functor(Y,P,N),(Y<=_),!.
is_a(before_the_day(_,_),built_in_pred):-!.
is_a(same_day_or_before_the_day(_,_),built_in_pred):-!.
is_a(after_the_day(_,_),built_in_pred):-!.
is_a(same_day_or_after_the_day(_,_),built_in_pred):-!.
is_a(nextday(_,_),built_in_pred):-!.
is_a(not(_),built_in_pred):-!.
is_a(call(_),built_in_pred):-!.
is_a(euro_compare(_),built_in_pred):-!.
is_a(_=_,built_in_pred):-!.
is_a(_ is _,built_in_pred):-!.
is_a(print(_),built_in_pred):-!.
is_a(nl,built_in_pred):-!.
is_a(X,built_in_pred):-built_in_pred(X),!.
is_a(X,obvious_fact):-obvious_fact(X),!.
is_a(X,prerequisite):- \+(is_a(X,legal_effect);is_a(X,built_in_pred);is_a(X,obvious_fact)),!.

% Show a reasoning block    
block(Goal):-
  set_prolog_flag(print_write_options, [portray(true), quoted(false), numbervars(true)]),
  find_AND_der([Goal],_,Tree),
  output_block("prolegresult.trc",Tree),    
  !,
  true.

block(Goal,Postfix):-
  set_prolog_flag(print_write_options, [portray(true), quoted(false), numbervars(true)]),
  find_AND_der([Goal],_,Tree),
  name(Postfix,PostfixString),
  append("prolegresult_",PostfixString,TRCString),
  append(TRCString,".trc",TRCString1),
  output_block(TRCString1,Tree),
  !,
  true.

block_no_output(Goal):-
  find_AND_der([Goal],_,Tree),
  mktrcfile("prolegresult.trc",Tree),    
  !,
  true.

output_block(TRCString,Tree):-
    mktrcfile(TRCString,Tree),
    output_block_to_window(TRCString).

mktrcfile(TRCString,Tree):-
  name(TRCfile,TRCString),
  tell(TRCfile),
  telling(Stream),
  set_stream(Stream,encoding(utf8)),
%   put_header,
  numbering(Tree),
  told.

output_block_to_window(TRCString):-
  name('cmd /c "c:\\pl\\bin\\PrologTracer.exe" ',CMDString),
  name(TRCAtom,TRCString),
  name(TRCAtom,TRCString1),
  append(CMDString,TRCString1,CMDString1),
  name(CMD,CMDString1),
  win_exec(CMD,show).

numbering([(InitialGoal,false)]):-
  numbering([(InitialGoal,false,[])]).
numbering([(InitialGoal,Result,WholeTree)]):-
  output_result(InitialGoal,Result,NewInitialGoal),
%   print([]),print(','),
%   print(NewInitialGoal),nl,
  print_node([],NewInitialGoal),
  number_OR_tree(WholeTree,[],0).

ground_check(G):-ground(G),!.
ground_check(G):-!,
                 print('ERROR:'), 
                 print(G),print(' is not ground.'),nl,
                 fail.

complement(true,false):-!.
complement(false,true):-!.

number_AND_tree([],_,_):-!.
number_AND_tree([(\+G,Result)|Tail],ORLabel,ANDnum):-
 (Result=true;Result=false),
  !,
  append(ORLabel,[e,ANDnum],ANDLabel),
  complement(Result,InversedResult),
  output_result(G,InversedResult,NewG),
%   print(ANDLabel),print(','),
%   print(NewG),nl,
  print_node(ANDLabel,NewG),
  ANDnum1 is ANDnum+1,
  number_AND_tree(Tail,ORLabel,ANDnum1).
number_AND_tree([(G,Result)|Tail],ORLabel,ANDnum):-
 (Result=true;Result=false),
  !,
  append(ORLabel,[a,ANDnum],ANDLabel),
  output_result(G,Result,NewG),
%   print(ANDLabel),print(','),
%   print(NewG),nl,
  print_node(ANDLabel,NewG),
  ANDnum1 is ANDnum+1,
  number_AND_tree(Tail,ORLabel,ANDnum1).
number_AND_tree([(\+G,Result,Tree)|Tail],ORLabel,ANDnum):-
  !,
  append(ORLabel,[e,ANDnum],ANDLabel),
  complement(Result,InversedResult),
  output_result(G,InversedResult,NewG),
%   print(ANDLabel),print(','),
%   print(NewG),nl,
  print_node(ANDLabel,NewG),
  number_OR_tree(Tree,ANDLabel,0),
  ANDnum1 is ANDnum + 1,
  number_AND_tree(Tail,ORLabel,ANDnum1).
number_AND_tree([(G,Result,Tree)|Tail],ORLabel,ANDnum):-
  !,
  append(ORLabel,[a,ANDnum],ANDLabel),
  output_result(G,Result,NewG),
%   print(ANDLabel),print(','),
%   print(NewG),nl,
  print_node(ANDLabel,NewG),
  number_OR_tree(Tree,ANDLabel,0),
  ANDnum1 is ANDnum + 1,
  number_AND_tree(Tail,ORLabel,ANDnum1).

output_result(G,R,NewG):-!,
%   print(before_output_result(G,R,NewG)),nl,
  change_list(G,CLG),
%   print(after_change_list_in_output_result(G,CLG)),nl,
  CLG =.. [F|GL],
  functor(CLG,F,N),
%   print(in_output_result(CLG =.. [F|GL]),nl,
  functor(ArgInfo,F,N),
%   print(in_output_result(functor(ArgInfo,F,N))),nl,
 (arg_info(ArgInfo)->
  (ArgInfo =.. [F|AL],
   add_arg_info(AL,GL,AGL));
   GL=AGL),
%   print(agl(AGL)),nl,
 (R=true->append([F|AGL],[o],NewGL);append([F|AGL],[x],NewGL)),
  NewG =.. NewGL,
%   print(after_output_result(G,R,NewG)),nl,
  true.

change_list(X,X):-
  var(X),!.
change_list(X,X):-
  atomic(X),!.
change_list(euro_compare(X>Y),euro_compare('＞'(NewX,NewY))):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(euro_compare(X<Y),euro_compare('＜'(NewX,NewY))):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(euro_compare(X=Y),euro_compare('＝'(NewX,NewY))):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(euro_compare(X>=Y),euro_compare('＞＝'(NewX,NewY))):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(euro_compare(X=<Y),euro_compare('＝＜'(NewX,NewY))):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(X+Y,'＋'(NewX,NewY)):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(X-Y,'−'(NewX,NewY)):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(X*Y,'＊'(NewX,NewY)):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(X/Y,'／'(NewX,NewY)):-!,
  change_list(X,NewX),
  change_list(Y,NewY).
change_list(not(X=Y),(NewX \= NewY)):-!,
%   print(before_change_list(not(X=Y),(NewX \= NewY))),nl,
  change_list(X,NewX),
  change_list(Y,NewY),
%   print(after_change_list(not(X=Y),(NewX \= NewY))),nl,
  true.
change_list([],[]):-!.
change_list([H|T],Result):-!,
%   print(before_change_list2([H|T],Result)),nl,
  change_args_list([H|T],NewHT),
%   print(after_change_list2([H|T],Result)),nl,
  Result =.. [list|NewHT].
change_list(X,Result):-!,
%   print(before_change_list3(X,Result)),nl,
  X =.. ListX,
  change_args_list(ListX,NewListX),
%   print(after_change_list3(X,Result)),nl,
  Result =.. NewListX.

change_args_list([],[]):-!.
change_args_list([H|T],[NewH|NewT]):-!,
  change_list(H,NewH),
  change_args_list(T,NewT).

add_arg_info([],[],[]):-!.
add_arg_info([AH|AT],[GH|GT],[AGH|AGT]):-!,
  AGH =.. [AH,GH],
  add_arg_info(AT,GT,AGT).

append([],X,X):-!.
append([X|Y],W,[X|Z]):-
  !,
  append(Y,W,Z).

% number_OR_tree(GTreeS,ANDLabel,ORnum):-
%   print(number_OR_tree(GTreeS,ANDLabel,ORnum)),nl,fail.
number_OR_tree([],_,_).
number_OR_tree([GTreeS|Tail],ANDLabel,ORnum):-
  append(ANDLabel,[o,ORnum],ORLabel),
  number_AND_tree(GTreeS,ORLabel,0),
  ORnum1 is ORnum + 1,
  number_OR_tree(Tail,ANDLabel,ORnum1).

% possible_instance: find an instance for a goal (including negative literals) X in a list form
% with all ultimate facts alleged. the resulting X should be ground.
possible_instance([]).
possible_instance([X|R]):-!,
   possible_instance1(X),
   possible_instance(R).

possible_instance1(X):-
   debugprint(possible_instance1(X)),fail.

% We do not put '!' here since there might be other possibility. 
possible_instance1(X):-
  admission(X,_)
  ,debugprint(success(possible_instance1(admission(X))))
  .
possible_instance1(X):-
  is_a(X,obvious_fact),
　!,
  allege(X,_) % allege is needed for obvious_fact
  ,debugprint(success(possible_instance1(obvious_fact(X))))
  .
possible_instance1(X):-
%   debugprint(built_in_predcheck(possible_instance1(X))),
  is_a(X,built_in_pred),
%   debugprint(built_in_predsuccess(possible_instance1(X))),
  !,
  (executable(X)->call(X);true)
  ,debugprint(success(possible_instance1(built_in_pred(X))))
  . 

executable(X):-ground(X),!.
executable(_=_):-!.
executable(nth_argument(N,P,_)):-ground(N),ground(P),!.

possible_instance1(proleg_cond(X)):-
%   debugprint(chcking(proleg_cond(possible_instance1(X)))),
  !,
  call(X),
  debugprint(success(possible_instance1(proleg_cond(X))))
  . 

% Maybe the following rule for a negative literal is never applied.
possible_instance1(\+_):-!.
% We do not put '!' here since there might be other possibility.
possible_instance1(X):-
  is_a(X,prerequisite),
  debugprint(success(is_a(X,prerequisite))),
  debugprint((allege(X,_),producing_of_evidence(X,_))),
  allege(X,_),
  debugprint(success(allege(X,_))),
  producing_of_evidence(X,_)
  ,debugprint(success(producing_of_evidence(X,_)))
  ,debugprint(success(possible_instance1(allegeandproducing_of_evidence(X))))
  .
possible_instance1(X):-
 (X <= Body),
  debugprint(found(possible_instance1((X <= Body)))),
  change_to_list(Body,BL),
  possible_instance(BL)
  ,debugprint(success(possible_instance1(X)))
  .

% find_body_instance: find all the body ground instance for X including exceptions in goal form in PROLOG in a list form.
% X must not be ultimate fact.
% When it is called X should be ground.
find_body_instance(X,OL):-
   debugprint(find_body_instance(X,OL)),
   fail.
find_body_instance(X,OL):-
   extract_goals(X,BL),
   find_body_instance1(BL,OL),
   debugprint(success(find_body_instance(X,OL))).

extract_goals(OneGoal,GL):-!,
  newsetof((OneGoal,BL),mk_goal(OneGoal,BL),GL1),
  debugprint(newsetof_done((OneGoal,BL),mk_goal(OneGoal,BL),GL1)),
  get_first_element(GL1,GL),
  debugprint(extract_goals_success(OneGoal,GL)).

get_first_element([],[]):-!.
get_first_element([(_,BL)|Rest],[BL|RestGL]):-!,
  get_first_element(Rest,RestGL).

find_body_instance1([],[]).
find_body_instance1([B|BR],OL):-
   newsetof(B,possible_instance(B),OL1),
   debugprint(newsetof_done(B,possible_instance(B),OL1)),
   find_body_instance1(BR,OL2),
   debugprint(ol1(OL1)),
   debugprint(ol2(OL2)),
   append(OL1,OL2,OL).

mk_goal(X,GL):-
  (X<=Body),
  debugprint(found((X<=Body))),
  change_to_list(Body,BL),
  newsetof(\+Ex,(exception(X,Ex),possible_instance1(Ex)),ExL),
  debugprint(executed(newsetof(\+Ex,(exception(X,Ex),possible_instance1(Ex)),ExL))),
  append(BL,ExL,GL)
  ,debugprint(success(mk_goal(X,GL)))
  .

change_to_list((X,Y),[X|YL]):-!,
   change_to_list(Y,YL).
change_to_list(X,[X]):-!.

newsetof(X,G,XL):-!,
  (setof(X,G,XL)->true;XL=[]).

find_AND_der(Goal,Result,Tree):-
  debugprint(find_AND_der(Goal,Result,Tree)),false.
find_AND_der(Goal,Result,Tree):-
  separate_pos_neg(Goal,PosGoal,NegGoal),
  find_der_pos(PosGoal,PosResult,PosTree),
 (PosResult=true->find_der_neg(NegGoal,NegResult,NegTree);NegTree=[]),
  append(PosTree,NegTree,Tree),
 ((PosResult=true,NegResult=true)->Result=true;Result=false),
  debugprint(find_AND_der(Goal,Result,Tree)).

separate_pos_neg([],[],[]):-!.
separate_pos_neg([\+G|R],[],[\+G|R]):-!. % We assume that one \+G is found the rest are all negative goals.
separate_pos_neg([G|R],[G|PosGoal],NegGoal):-!,
  separate_pos_neg(R,PosGoal,NegGoal).

find_der_pos(PosGoal,PosResult,PosTree):-
  debugprint(find_der_pos(PosGoal,PosResult,PosTree)),false.
find_der_pos([],WholeResult,[]):-
 (var(WholeResult)->WholeResult=true;true).
find_der_pos([OneGoal|Rest],WholeResult,[OneGoalTree|RestTrees]):-
  find_der_pos1(OneGoal,Result,OneGoalTree),
 (Result=false->WholeResult=false;true),
  find_der_pos(Rest,WholeResult,RestTrees),
  debugprint(find_der_pos([OneGoal|Rest],WholeResult,[OneGoalTree|RestTrees])).

find_der_pos1(OneGoal,Result,OneGoalTree):-
  debugprint(find_der_pos1(OneGoal,Result,OneGoalTree)),false.

find_der_pos1(OneGoal,true,(OneGoal_admission,true)):-
  admission(OneGoal,_),!,  % We assume that OneGoal is unique and ground when this predicate is called.
  OneGoal =.. [Predicate|Args],
  name(Predicate,Predicate_string),
%   name('：admission',Added_string),
  name(':admission',Added_string),
  append(Predicate_string,Added_string,NewPredicate_string),
  name(NewPredicate,NewPredicate_string),
  OneGoal_admission =.. [NewPredicate|Args],
  debugprint(success(find_der_pos1(admission(OneGoal)))).
find_der_pos1(OneGoal,Result,(OneGoal_obvious_fact,Result)):-
  obvious_fact(OneGoal),!,  % We assume that OneGoal is unique and ground when this predicate is called.
 (call(OneGoal)->Result=true;Result=false),
  OneGoal =.. [Predicate|Args],
  name(Predicate,Predicate_string),
  name('：obvious_fact',Added_string),
  append(Predicate_string,Added_string,NewPredicate_string),
  name(NewPredicate,NewPredicate_string),
  OneGoal_obvious_fact =.. [NewPredicate|Args],
  debugprint(success(find_der_pos1(obvious_fact(OneGoal)))).
find_der_pos1(OneGoal,Result,(OneGoal,Result)):-
  is_a(OneGoal,built_in_pred),!,  % We assume that OneGoal is unique and ground when this predicate is called.
 (call(OneGoal)->Result=true;Result=false),
  debugprint(success(find_der_pos1(built_in_pred(OneGoal,Result)))).
find_der_pos1(proleg_cond(OneGoal),Result,(proleg_cond(OneGoal),Result)):-
  !,  % We assume that OneGoal is unique and ground when this predicate is called.
 (call(OneGoal)->Result=true;Result=false),
  debugprint(success(find_der_pos1(built_in_pred(OneGoal,Result)))).
find_der_pos1(OneGoal,Result,(OneGoal,Result)):-
  is_a(OneGoal,prerequisite),!,  % We assume that OneGoal is unique and ground when this predicate is called.
  debugprint(is_a(OneGoal,prerequisite)),
 (plausible(OneGoal)->Result=true;Result=false),
  debugprint(success(find_der_pos1(plausible(OneGoal,Result)))).
find_der_pos1(OneGoal,Result,(OneGoal,Result,DerTree)):-
  find_body_instance(OneGoal,GL),
  find_OR_der(GL,OrResult,DerTree),
 (OrResult=true->Result=true;Result=false),
  debugprint(find_der_pos1(OneGoal,Result,(OneGoal,Result,DerTree))).
find_der_pos1(OneGoal,false,(OneGoal,false)).


find_OR_der(GL,OrResult,DerTree):-
  debugprint(find_OR_der(GL,OrResult,DerTree)),false.
find_OR_der([],Result,[]):-
 (var(Result)->Result=false;true).
find_OR_der([Goal|Rest],Result,[OrTree|RestOrTrees]):-
  find_AND_der(Goal,AndResult,OrTree),
 (AndResult=true->Result=true;true),
  find_OR_der(Rest,Result,RestOrTrees),
  debugprint(find_OR_der([Goal|Rest],Result,[OrTree|RestOrTrees])).

find_der_neg(NegGoal,NegResult,NegTree):-
  debugprint(find_der_neg(NegGoal,NegResult,NegTree)),false.
find_der_neg([],WholeResult,[]):-
 (var(WholeResult)->WholeResult=true;true).
find_der_neg([\+OneGoal|Rest],WholeResult,RestTrees):-
  find_body_instance(OneGoal,[]),!,
  find_der_neg(Rest,WholeResult,RestTrees),
  debugprint(find_der_neg([\+OneGoal|Rest],WholeResult,RestTrees)).

find_der_neg([\+OneGoal|Rest],WholeResult,[(\+OneGoal,NegResult,OneGoalTree)|RestTrees]):-
  find_der_neg1(\+OneGoal,WholeResult,NegResult,OneGoalTree),
  find_der_neg(Rest,WholeResult,RestTrees),
  debugprint(find_der_neg([\+OneGoal|Rest],WholeResult,[(\+OneGoal,NegResult,OneGoalTree)|RestTrees])).

find_der_neg1(\+OneGoal,WholeResult,NegResult,OneGoalTree):-
  find_der_pos1(OneGoal,Result,(OneGoal,Result,OneGoalTree)),
  complement(Result,NegResult),
 (Result=true->WholeResult=false;true).

print_node(Label,Goal):-
  print('node('),
  print(Label),
  print(','),
  print(Goal),
  print(').'),
  nl.
