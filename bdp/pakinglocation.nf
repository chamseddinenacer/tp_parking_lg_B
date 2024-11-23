Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(pakinglocation))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(pakinglocation))==(Machine(pakinglocation));
  Level(Machine(pakinglocation))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(pakinglocation)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(pakinglocation))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(pakinglocation))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(pakinglocation))==(?);
  List_Includes(Machine(pakinglocation))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(pakinglocation))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(pakinglocation))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(pakinglocation))==(?);
  Context_List_Variables(Machine(pakinglocation))==(?);
  Abstract_List_Variables(Machine(pakinglocation))==(?);
  Local_List_Variables(Machine(pakinglocation))==(locations,places,client_pl,clients);
  List_Variables(Machine(pakinglocation))==(locations,places,client_pl,clients);
  External_List_Variables(Machine(pakinglocation))==(locations,places,client_pl,clients)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(pakinglocation))==(?);
  Abstract_List_VisibleVariables(Machine(pakinglocation))==(?);
  External_List_VisibleVariables(Machine(pakinglocation))==(?);
  Expanded_List_VisibleVariables(Machine(pakinglocation))==(?);
  List_VisibleVariables(Machine(pakinglocation))==(?);
  Internal_List_VisibleVariables(Machine(pakinglocation))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(pakinglocation))==(btrue);
  Gluing_List_Invariant(Machine(pakinglocation))==(btrue);
  Expanded_List_Invariant(Machine(pakinglocation))==(btrue);
  Abstract_List_Invariant(Machine(pakinglocation))==(btrue);
  Context_List_Invariant(Machine(pakinglocation))==(btrue);
  List_Invariant(Machine(pakinglocation))==(clients <: CLIENTS & places <: PARKING_SPACES & locations: places --> clients & client_pl: clients --> NAT & !cl.(cl: clients => client_pl(cl)<=4))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(pakinglocation))==(btrue);
  Abstract_List_Assertions(Machine(pakinglocation))==(btrue);
  Context_List_Assertions(Machine(pakinglocation))==(btrue);
  List_Assertions(Machine(pakinglocation))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(pakinglocation))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(pakinglocation))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(pakinglocation))==(clients,places,locations,client_pl:={},{},{},{});
  Context_List_Initialisation(Machine(pakinglocation))==(skip);
  List_Initialisation(Machine(pakinglocation))==(clients,places,locations,client_pl:={},{},{},{})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(pakinglocation))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(pakinglocation))==(btrue);
  List_Constraints(Machine(pakinglocation))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(pakinglocation))==(Ajouter_Nv_Client,SupprimerClient,LouerPlace,Rest_place);
  List_Operations(Machine(pakinglocation))==(Ajouter_Nv_Client,SupprimerClient,LouerPlace,Rest_place)
END
&
THEORY ListInputX IS
  List_Input(Machine(pakinglocation),Ajouter_Nv_Client)==(cl);
  List_Input(Machine(pakinglocation),SupprimerClient)==(cl);
  List_Input(Machine(pakinglocation),LouerPlace)==(pl,cl);
  List_Input(Machine(pakinglocation),Rest_place)==(pl,cl)
END
&
THEORY ListOutputX IS
  List_Output(Machine(pakinglocation),Ajouter_Nv_Client)==(?);
  List_Output(Machine(pakinglocation),SupprimerClient)==(?);
  List_Output(Machine(pakinglocation),LouerPlace)==(?);
  List_Output(Machine(pakinglocation),Rest_place)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(pakinglocation),Ajouter_Nv_Client)==(Ajouter_Nv_Client(cl));
  List_Header(Machine(pakinglocation),SupprimerClient)==(SupprimerClient(cl));
  List_Header(Machine(pakinglocation),LouerPlace)==(LouerPlace(pl,cl));
  List_Header(Machine(pakinglocation),Rest_place)==(Rest_place(pl,cl))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(pakinglocation),Ajouter_Nv_Client)==(cl: CLIENTS-clients);
  List_Precondition(Machine(pakinglocation),SupprimerClient)==(cl: clients & client_pl(cl) = 0);
  List_Precondition(Machine(pakinglocation),LouerPlace)==(pl: places & cl: clients & pl/:dom(locations) & client_pl(cl)<4);
  List_Precondition(Machine(pakinglocation),Rest_place)==(pl: dom(locations) & cl: clients & locations(pl) = cl)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(pakinglocation),Rest_place)==(pl: dom(locations) & cl: clients & locations(pl) = cl | locations,client_pl:={pl}<<|locations,client_pl<+{cl|->client_pl(cl)-1});
  Expanded_List_Substitution(Machine(pakinglocation),LouerPlace)==(pl: places & cl: clients & pl/:dom(locations) & client_pl(cl)<4 | locations,client_pl:=locations<+{pl|->cl},client_pl<+{cl|->client_pl(cl)+1});
  Expanded_List_Substitution(Machine(pakinglocation),SupprimerClient)==(cl: clients & client_pl(cl) = 0 | clients,client_pl:=clients-{cl},{cl}<<|client_pl);
  Expanded_List_Substitution(Machine(pakinglocation),Ajouter_Nv_Client)==(cl: CLIENTS-clients | clients,client_pl:=clients\/{cl},client_pl<+{cl|->0});
  List_Substitution(Machine(pakinglocation),Ajouter_Nv_Client)==(clients:=clients\/{cl} || client_pl(cl):=0);
  List_Substitution(Machine(pakinglocation),SupprimerClient)==(clients:=clients-{cl} || client_pl:={cl}<<|client_pl);
  List_Substitution(Machine(pakinglocation),LouerPlace)==(locations(pl):=cl || client_pl(cl):=client_pl(cl)+1);
  List_Substitution(Machine(pakinglocation),Rest_place)==(locations:={pl}<<|locations || client_pl(cl):=client_pl(cl)-1)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(pakinglocation))==(?);
  Inherited_List_Constants(Machine(pakinglocation))==(?);
  List_Constants(Machine(pakinglocation))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(pakinglocation),CLIENTS)==(?);
  Context_List_Enumerated(Machine(pakinglocation))==(?);
  Context_List_Defered(Machine(pakinglocation))==(?);
  Context_List_Sets(Machine(pakinglocation))==(?);
  List_Valuable_Sets(Machine(pakinglocation))==(CLIENTS,PARKING_SPACES);
  Inherited_List_Enumerated(Machine(pakinglocation))==(?);
  Inherited_List_Defered(Machine(pakinglocation))==(?);
  Inherited_List_Sets(Machine(pakinglocation))==(?);
  List_Enumerated(Machine(pakinglocation))==(?);
  List_Defered(Machine(pakinglocation))==(CLIENTS,PARKING_SPACES);
  List_Sets(Machine(pakinglocation))==(CLIENTS,PARKING_SPACES);
  Set_Definition(Machine(pakinglocation),PARKING_SPACES)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(pakinglocation))==(?);
  Expanded_List_HiddenConstants(Machine(pakinglocation))==(?);
  List_HiddenConstants(Machine(pakinglocation))==(?);
  External_List_HiddenConstants(Machine(pakinglocation))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(pakinglocation))==(btrue);
  Context_List_Properties(Machine(pakinglocation))==(btrue);
  Inherited_List_Properties(Machine(pakinglocation))==(btrue);
  List_Properties(Machine(pakinglocation))==(CLIENTS: FIN(INTEGER) & not(CLIENTS = {}) & PARKING_SPACES: FIN(INTEGER) & not(PARKING_SPACES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(pakinglocation),Ajouter_Nv_Client)==(?);
  List_ANY_Var(Machine(pakinglocation),SupprimerClient)==(?);
  List_ANY_Var(Machine(pakinglocation),LouerPlace)==(?);
  List_ANY_Var(Machine(pakinglocation),Rest_place)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(pakinglocation)) == (CLIENTS,PARKING_SPACES | ? | locations,places,client_pl,clients | ? | Ajouter_Nv_Client,SupprimerClient,LouerPlace,Rest_place | ? | ? | ? | pakinglocation);
  List_Of_HiddenCst_Ids(Machine(pakinglocation)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(pakinglocation)) == (?);
  List_Of_VisibleVar_Ids(Machine(pakinglocation)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(pakinglocation)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(pakinglocation)) == (Type(CLIENTS) == Cst(SetOf(atype(CLIENTS,"[CLIENTS","]CLIENTS")));Type(PARKING_SPACES) == Cst(SetOf(atype(PARKING_SPACES,"[PARKING_SPACES","]PARKING_SPACES"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(pakinglocation)) == (Type(locations) == Mvl(SetOf(atype(PARKING_SPACES,?,?)*atype(CLIENTS,?,?)));Type(places) == Mvl(SetOf(atype(PARKING_SPACES,?,?)));Type(client_pl) == Mvl(SetOf(atype(CLIENTS,?,?)*btype(INTEGER,0,MAXINT)));Type(clients) == Mvl(SetOf(atype(CLIENTS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(pakinglocation)) == (Type(Rest_place) == Cst(No_type,atype(PARKING_SPACES,?,?)*atype(CLIENTS,?,?));Type(LouerPlace) == Cst(No_type,atype(PARKING_SPACES,?,?)*atype(CLIENTS,?,?));Type(SupprimerClient) == Cst(No_type,atype(CLIENTS,?,?));Type(Ajouter_Nv_Client) == Cst(No_type,atype(CLIENTS,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
