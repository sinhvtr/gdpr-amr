:- dynamic fact/1.
:- dynamic nonfact/1.    

% Date: 2017/10/19
allege(X,_):- fact(X).
producing_of_evidence(X,_):- fact(X).
plausible(X,_):- fact(X).
allege(X,_):- nonfact(X).
producing_of_evidence(X,_):- nonfact(X).
    
%%%%%%%%%%%%%%%%%%%% Example of lease_contract %%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% cancellation_due_to_sublease %%%%%%
cancellation_due_to_sublease <=
   effective_lease_contract,
   effective_sublease_contract,
   using_leased_thing,
   manifestation_cancellation.

effective_lease_contract<=
   agreement_of_lease_contract,
   handover_based_on_the_lease_contract.
effective_sublease_contract<=
   agreement_of_sublease_contract,
   handover_based_on_the_sublease_contract.

exception(cancellation_due_to_sublease,approval_of_sublease).
approval_of_sublease <=
      approval_of_sublease_before_the_day.

exception(cancellation_due_to_sublease,nonabuse_of_confidence).
nonabuse_of_confidence <= fact_of_nonabuse_of_confidence(X).

exception(nonabuse_of_confidence,abuse_of_confidence).
abuse_of_confidence <= fact_of_abuse_of_confidence(X).

%%%%%%%%%%%%%%%%%%%% cancelation due to sublease %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
demo:-rightexists(cancellation_due_to_sublease).
demob:-block(cancellation_due_to_sublease).
% Contingent Knowledge
%%%%% cancellation_due_to_sublease  %%%%%%%%% %
% %%  
fact(agreement_of_lease_contract).
fact(handover_based_on_the_lease_contract).
fact(agreement_of_sublease_contract).
fact(handover_based_on_the_sublease_contract).
fact(using_leased_thing).
fact(manifestation_cancellation).
% fact(approval_of_sublease_before_the_day).
nonfact(approval_of_sublease_before_the_day).
fact(fact_of_nonabuse_of_confidence(short_time_usage)).
fact(fact_of_abuse_of_confidence(complaint_about_sublessee_usage)).
