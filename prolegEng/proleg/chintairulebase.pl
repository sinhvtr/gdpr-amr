% Author:
% Date: 2009/08/27

%%%%%%%%%%%%%%%%%%%% lease_contractの例 %%%%%%%%%%%%%%%%%%%%%%%%

% demo_henkan:-prove(right_to_transfer_subject_matter_at_Lease_contract_end(plaintiff,defendant),plaintiff).

% ----------------------------------------------------
% （賃借権の譲渡及び転貸の制限）
% 第612条
% 1 賃借人は、賃貸人の承諾を得なければ、その賃借権を譲り渡し、又は賃借物を転貸することができない。
% 2 賃借人が前項の規定に違反して第三者に賃借物の使用又は収益をさせたときは、賃貸人は、contractのcancellationをすることができる。
% ----------------------------------------------------

% ----------------------------------------------------
% 貸主Lenderが借主Borrowerに対してcontract終了に基づく目的物返還claimをするときとは
%     LenderがBorrowerとlease_contractを成立させ、
%     LenderがBorrowerに賃貸目的物を引き渡し、
%     LenderとBorrowerのlease_contractが終了したときである。
% ----------------------------------------------------
right_to_transfer_subject_matter_at_Lease_contract_end(Lender,Borrower)<=
      agreement_of_lease_contract(Lender,Borrower,Object,Price,T,Term),
      handover_based_on_the_contract(Lender,Borrower,lease_contract(Lender,Borrower,Object,Price,T,Term)),
      end_of_lease_contract(Lender,Borrower,T_end).


% ---------------------------------------------------
% 貸主Lenderと借主Borrowerのlease_contractが終了したときとは
%     LenderがBorrowerの無断転貸に基づきcontractをcancellationした場合である。
% LenderがBorrowerに無断転貸に基づきcontractをcancellationした場合とは
%     Borrowerが転借主ExBorrowerとlease_contractを成立させ、
%     BorrowerがExBorrowerに賃貸物を引き渡し、
%     ExBorrowerがmake_use_of_or_take_the_profits_of_a_leased_thingを行い、
%     LenderがBorrowerに対してmanifestation_of_intention_of_cancellationをしたときである。
% ただし、以下の場合には無断転貸に基づくcancellationはできない。
%     LenderがBorrowerにその承諾を与えたとき
%     借主の転貸借に関して背信性がないこと示す評価根拠事実があるとき
%     cancellation権の行使が権利の濫用となるとき

%
% 貸主Lenderと借主Borrowerのlease_contractが終了したときとは
%     lease_contractの期間が満了したときである。
% lease_contractの期間が満了したときとは、
%     lease_contractで定められたcontract期間が満了し,
%     期間満了の1year前から6カmonth前までにnotice_of_renewal_refusalがあり、
%     更新拒絶について正当事由があることである。（解約申し入れ時に必要）
% ただし、以下の場合には期間満了によりcontractは終了しない。
%      正当事実があることの評価障害事実がある場合
%
% ------------------------------------------------------------------

end_of_lease_contract(Lender,Borrower,T_end)<=expiration_of_the_term_of_the_lease_contract(Lender,Borrower,T_end,T3).
end_of_lease_contract(Lender,Borrower,T_end)<=cancellation_due_to_sublease(Lender,Borrower,T_end).


%%%%%% 期間満了　%%%%%
expiration_of_the_term_of_the_lease_contract(Lender,Borrower,T_end,T3)<=
          expiration_of_the_term_of_the_lease_contract(T2),     % 借家contractのcontract期間が1year未満の場合は期間の定めがないものとされるので除く
          T2 = T_end,
          passage(T2),
          notice_of_renewal_refusal(Lender, Borrower,T3),
          n_month_before(T_end,X,6),
          same_day_or_before_the_day(T3,X),
          n_month_before(T_end,Y,12),
          same_day_or_before_the_day(Y,T3),
          justifiable_reason(T3).

justifiable_reason(T3) <= fact_of_justifiable_reason(Fact,T3).
exception(expiration_of_the_term_of_the_lease_contract(Lender,Borrower,T_end,T3),anti_justifiable_reason(T3)).
anti_justifiable_reason(T3) <= fact_of_anti_justifiable_reason(Fact,T3).


%%%%%% cancellation_due_to_sublease %%%%%%
cancellation_due_to_sublease(Lender,Borrower,T_cancel)<=
      agreement_of_lease_contract(Borrower,ExBorrower,Object,Price,T,Term),
      handover_based_on_the_contract(Borrower,ExBorrower,lease_contract(Borrower,ExBorrower,Object,Price,T,Term)),
      make_use_of_or_take_the_profits_of_a_leased_thing(ExBorrower),
      manifestation_of_intention_of_cancellation(Lender,Borrower,T_cancel).
exception(cancellation_due_to_sublease(Lender,Borrower,T_cancel),approval_of_sublease(Lender,Borrower,T_cancel)).
exception(cancellation_due_to_sublease(Lender,Borrower,T_cancel),nonabuse_of_confidence).


% ----------------------------------------------------
% approval_of_subleaseが成立するには、承諾がcancellationに先立つことが必要である。
% ----------------------------------------------------

approval_of_sublease(Lender,Borrower,T_cancel) <=
      date_of_approval_of_sublease(Lender,Borrower,T_accept),
      before_the_day(T_accept,T_cancel).

% ----------------------------------------------------
% 借主の転貸借に関して背信性がないことについて評価根拠事実があるときとは
% 　　借主の転貸借に関して背信性がないことについて評価根拠事実に当たる事情があるときである。
% ただし、以下の場合には背信性がないことについて評価根拠事実があるとはいえない。
% 　　借主の転貸借に関して背信性がないことについて評価障害事実に当たる事情があるときである。
% ----------------------------------------------------
nonabuse_of_confidence <= fact_of_nonabuse_of_confidence(Fact).
exception(nonabuse_of_confidence,abuse_of_confidence).

% ----------------------------------------------------
% 　借主の転貸借に関して背信性がないことについて評価障害事実に当たる事情があるときとは
%  借主の転貸借に関して背信性がないことについて評価障害事実があるときである。
% 　
% ----------------------------------------------------
abuse_of_confidence <= fact_of_abuse_of_confidence(Fact).

