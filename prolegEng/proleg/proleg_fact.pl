% Author:
% Date: 2009/08/27
passage(X) :- present_time(Y), before_the_day(X,Y).

%%%%%%%%%%%%%%%%%%%% 無断転貸の例 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
demo:-rightexists(cancellation_due_to_sublease(plaintiff,defendant,T_cancel)).
demob:-block(cancellation_due_to_sublease(plaintiff,defendant,T_cancel)).
democ:-block_no_output(cancellation_due_to_sublease(plaintiff,defendant,T_cancel)).
%%%%%%%%%%%%%%%%%%%% 無断転貸の事実allegeおよび認定 %%%%%%%%%%%%%%%%%%%%%%%%
% Contingent Knowledge


%%%% expiration_of_the_term_of_the_lease_contract  %%%%
allege(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),plaintiff).
producing_of_evidence(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),plaintiff).
admission(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),defendant).
% %
allege(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),plaintiff).
producing_of_evidence(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),plaintiff).
admission(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),defendant).
% %
% %
allege(expiration_of_the_term_of_the_lease_contract(2019 year 3 month 31 day),plaintiff).
producing_of_evidence(expiration_of_the_term_of_the_lease_contract(2019 year 3 month 31 day),plaintiff).
plausible(expiration_of_the_term_of_the_lease_contract(2019 year 3 month 31 day),plaintiff).
% %
allege(passage(2019 year 3 month 31 day),_).
% %
allege(notice_of_renewal_refusal(plaintiff,defendant,2018 year 7 month 31 day),plaintiff).
producing_of_evidence(notice_of_renewal_refusal(plaintiff,defendant,2018 year 7 month 31 day),plaintiff).
admission(notice_of_renewal_refusal(plaintiff,defendant,2018 year 7 month 31 day),defendant).
% %
allege(fact_of_justifiable_reason(necessity_for_make_use_of_this_real_estate_by_myself,2018 year 7 month 31 day),plaintiff).
producing_of_evidence(fact_of_justifiable_reason(necessity_for_make_use_of_this_real_estate_by_myself,2018 year 7 month 31 day),plaintiff).
plausible(fact_of_justifiable_reason(necessity_for_make_use_of_this_real_estate_by_myself,2018 year 7 month 31 day),plaintiff).
% %
% %
allege(fact_of_anti_justifiable_reason(mother_attends_a_hospital,2018 year 7 month 31 day),defendant).
producing_of_evidence(fact_of_anti_justifiable_reason(mother_attends_a_hospital,2018 year 7 month 31 day),defendant).
plausible(fact_of_anti_justifiable_reason(mother_attends_a_hospital,2018 year 7 month 31 day),defendant).
% %
% %
%% present_time(2019 year 8 month 15 day).
%% obvious_fact(present_time(_)).
%% obvious_fact(passage(_)).
%
% %
%%%%% cancellation_due_to_sublease  %%%%%%%%% %
% %% allege(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),plaintiff).
% %% producing_of_evidence(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),plaintiff).
% %% admission(agreement_of_lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years'),defendant).
% %
% %% allege(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),plaintiff).
% %% producing_of_evidence(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),plaintiff).
% %% admission(handover_based_on_the_contract(plaintiff,defendant,lease_contract(plaintiff,defendant,this_real_estate,'2_thousand_euro_per_month',2014 year 4 month 1 day,'term_is_5years')),defendant).
% %
allege(agreement_of_lease_contract(defendant,nonparty_A,this_real_estate, permonth(800 euro),2018 year 4 month 1 day,'term_is_2years'),plaintiff).
producing_of_evidence(agreement_of_lease_contract(defendant,nonparty_A,this_real_estate,permonth(800 euro),2018 year 4 month 1 day,'term_is_2years'),plaintiff).
admission(agreement_of_lease_contract(defendant,nonparty_A,this_real_estate,permonth(800 euro),2018 year 4 month 1 day,'term_is_2years'),defendant).
% %
allege(handover_based_on_the_contract(defendant,nonparty_A,lease_contract(defendant,nonparty_A,this_real_estate,permonth(800 euro),2018 year 4 month 1 day,'term_is_2years')),plaintiff).
producing_of_evidence(handover_based_on_the_contract(defendant,nonparty_A,lease_contract(defendant,nonparty_A,this_real_estate,permonth(800 euro),2018 year 4 month 1 day,'term_is_2years')),plaintiff).
admission(handover_based_on_the_contract(defendant,nonparty_A,lease_contract(defendant,nonparty_A,this_real_estate,permonth(800 euro),2018 year 4 month 1 day,'term_is_2years')),defendant).
% %
allege(make_use_of_or_take_the_profits_of_a_leased_thing(nonparty_A),plaintiff).
producing_of_evidence(make_use_of_or_take_the_profits_of_a_leased_thing(nonparty_A),plaintiff).
admission(make_use_of_or_take_the_profits_of_a_leased_thing(nonparty_A),defendant).
% %
allege(manifestation_of_intention_of_cancellation(plaintiff,defendant,2019 year 6 month 18 day),plaintiff).
producing_of_evidence(manifestation_of_intention_of_cancellation(plaintiff,defendant,2019 year 6 month 18 day),plaintiff).
admission(manifestation_of_intention_of_cancellation(plaintiff,defendant,2019 year 6 month 18 day),defendant).
% %
allege(date_of_approval_of_sublease(plaintiff,defendant,2017 year 12 month 6 day),defendant).
producing_of_evidence(date_of_approval_of_sublease(plaintiff,defendant,2017 year 12 month 6 day),defendant).
% plausible(date_of_approval_of_sublease(plaintiff,defendant,2017 year 12 month 6 day),defendant).
% %
allege(fact_of_nonabuse_of_confidence(short_time_usage),defendant).
producing_of_evidence(fact_of_nonabuse_of_confidence(short_time_usage),defendant).
plausible(fact_of_nonabuse_of_confidence(short_time_usage),defendant).
% %
% %
allege(fact_of_abuse_of_confidence(complaint_about_sublessee_usage),plaintiff).
producing_of_evidence(fact_of_abuse_of_confidence(complaint_about_sublessee_usage),plaintiff).
plausible(fact_of_abuse_of_confidence(complaint_about_sublessee_usage),plaintiff).

present_time(2019 year 7 month 21 day).
obvious_fact(present_time(_)).
obvious_fact(passage(_)).
% %
