:- discontiguous (<=)/2.

demo:-rightexists(infringement(transfer(companyA_Ireland,personal_data(personalData),thirdCountry))).
demob:-block(infringement(transfer(companyA_Ireland,personal_data(personalData),thirdCountry))).

% Article-44 General principle for transfers
% Any transfer of personal data which are undergoing processing or are
% intended for processing after transfer to a third country or to an
% international organisation shall take place only if, subject to the
% other provisions of this Regulation, the conditions laid down in
% this Chapter are complied with by the controller and processor,
% including for onward transfers of personal data from the third
% country or an international organisation to another third country or
% to another international organisation. All provisions in this
% Chapter shall be applied in order to ensure that the level of
% protection of natural persons guaranteed by this Regulation is not
% undermined.


infringement(transfer(ControllerOrProcessor,personal_data(DataSubject),CountryOrOrganisation))<=
    transfer(ControllerOrProcessor,personal_data(DataSubject),CountryOrOrganisation),
    personal_data(DataSubject),
    undergoing_processing_or_intended_for_processing_after_transfer(personal_data(DataSubject),ControllerOrProcessor),
    third_country_or_international_organisation(CountryOrOrganisation).
% personal data
% under processing
 undergoing_processing_or_intended_for_processing_after_transfer(personal_data(DataSubject),ControllerOrProcessor)<=
     process(ControllerOrProcessor,personal_data(DataSubject)).
% intend for processing after transfer
undergoing_processing_or_intended_for_processing_after_transfer(personal_data(DataSubject),ControllerOrProcessor)<=
     intend_for_processing_after_transfer(ControllerOrProcessor,personal_data(DataSubject)).
     
% a third country = not EAA country
third_country_or_international_organisation(Country)<=
     third_country(Country).
third_country(Country)<=
     not_EEA_country(Country).
% an international organisation = Article-4(26)
third_country_or_international_organisation(Organisation)<=
     international_organisation(Organisation).

% Article-46
% 1. In the absence of a decision pursuant to Article 45(3), a
% controller or processor may transfer personal data to a third
% country or an international organisation only if the controller or
% processor has provided appropriate safeguards, and on condition that
% enforceable data subject rights and effective legal remedies for
% data subjects are available.
    
exception(infringement(transfer(ControllerOrProcessor,personal_data(DataSubject),CountryOrOrganisation)),subject_to_appropriate_safeguards(ControllerOrProcessor)).
subject_to_appropriate_safeguards(ControllerOrProcessor)<=
    has_provided(ControllerOrProcessor,appropriate_safeguards(Matter)),
    appropriate_safeguards(Matter),
    on_condition_that_enforceble_data_subject_right_and_effective_legal_remedies_for_data_subjects_are_available.

% Article-46
% 2. The appropriate safeguards referred to in paragraph 1 may be
% provided for, without requiring any specific authorisation from a
% supervisory authority, by:

% (a) a legally binding and enforceable instrument between public authorities or bodies;
appropriate_safeguards(a_legally_binding_and_enforceble_instrument)<=
    a_legally_binding_and_enforceble_instrument_between_public_authorities_or_bodies.

% (b) binding corporate rules in accordance with Article 47;
appropriate_safeguards('BCR')<=
    binding_corporate_rules_in_accordance_with_Article_47.

% (c) standard data protection clauses adopted by the Commission in
% accordance with the examination procedure referred to in Article
% 93(2);
appropriate_safeguards('SCC')<=
    standard_data_protection_clauses,
    'adopted_by_the_Commission_in_accodance_with_the_examination_procedure_referred_to_in_Article_93_2'.

% (d) standard data protection clauses adopted by a supervisory
% authority and approved by the Commission pursuant to the examination
% procedure referred to in Article 93(2);
appropriate_safeguards('SCC')<=
    standard_data_protection_clauses,
    adopted_by_a_supervisory_authority,
    'approved_by_the_Commission_pursuant_to_the_examination_procedure_referred_to_in_Article_93_2'.

% (e) an approved code of conduct pursuant to Article 40 together with
% binding and enforceable commitments of the controller or processor
% in the third country to apply the appropriate safeguards, including
% as regards data subjects’ rights; or
appropriate_safeguards(code_or_conduct)<=
    approved_code_or_conduct_pursuant_to_Article_40,
    together_with_binding_and_enforceable_commitments_of_the_controller_or_processor_in_the_third_country_to_apply_the_appropriate_safeguards,
    "including_as_regards_data_subjects'_rights".

% (f) an approved certification mechanism pursuant to Article 42
% together with binding and enforceable commitments of the controller
% or processor in the third country to apply the appropriate
% safeguards, including as regards data subjects’ rights.
appropriate_safeguards(certification_mechanism)<=
    an_approved_certification_mechanism_pursuant_to_Article_42,
    together_with_binding_and_enforceable_commitments_of_the_controller_or_processor_in_the_third_country_to_apply_the_appropriate_safeguards,
    "including_as_regards_data_subjects'_rights".

% In the example of RULEML paper    
% triple(bp_transfer,action,transfer)
% triple(bp_transfer,resource,personalData)
% triple(bp_transfer,responsibleParty,controller)
% triple(bp_transfer,organisationType,internationalOrganisation)
% triple(bp_transfer,sender,companyA_Ireland)
% triple(bp_transfer,recipient,companyA_US)
% triple(bp_transfer,recipientLocation,thirdCountry)
% triple(bp_transfer,purpose,personalRecommendations)
% triple(bp_transfer,legalBasis,consent)
% triple(bp_transfer,dataSubjectProvisions,enforceableDataSubjectRights)
% triple(bp_transfer,dataSubjectProvisions,effectiveLegalRemedies)
%  triple(bp_transfer,appropriateSafeguards,bindingCorporateRules)

% PROLEG FACTS
% Article 44 related fact
fact(transfer(companyA_Ireland,personal_data(personalData),thirdCountry)).
fact(personal_data(personalData)).
fact(not_EEA_country(thirdCountry)).
fact(process(companyA_Ireland,personal_data(personalData))).
fact(intend_for_processing_after_transfer(companyA_Ireland,personal_data(personalData))).

% Article 46(1) related fact
fact(has_provided(companyA_Ireland,appropriate_safeguards('BCR'))).
fact(on_condition_that_enforceble_data_subject_right_and_effective_legal_remedies_for_data_subjects_are_available).

% Article 46(2) related fact    
% (b)
fact(binding_corporate_rules_in_accordance_with_Article_47).
