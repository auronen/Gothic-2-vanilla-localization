
instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Wenn du ein Problem mit den Wölfen oder Feldräubern hast, dann frag einen der jüngeren Söldner.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//Zu mir kannst du kommen, wenn hier die Paladine anrücken.
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Was?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Jedes Mal, wenn einer von euch Bauern zu mir kommt, geht's darum, harmlose Tiere abzumetzeln.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Ich bin keiner der Bauern.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Ach? Was willst du dann?
	};
};


var int Cord_SchonmalGefragt;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Ich will Söldner werden!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Solange du nicht vernünftig mit einer Waffe umgehen kannst, bist du hier falsch!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Ich will Söldner werden!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Du siehst mir eher wie ein Kandidat für die Feldarbeit aus, Junge.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Kannst du denn mit einer Waffe umgehen?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Bist du mittlerweile besser geworden?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Wie sieht's mit Einhandwaffen aus?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Damit bin ich schon ganz gut.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Na ja ...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//Und wie steht's mit Zweihändern?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Damit kann ich umgehen.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//Ich werde bestimmt besser!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//Du bist jedenfalls kein blutiger Anfänger mehr. Gut. Ich werde für dich stimmen.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Was dir noch an Wissen fehlt, kannst du von mir lernen.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,TOPIC_SLDRespekt_1);
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,Topic_SoldierTeacher_3);
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Das heißt mit anderen Worten: Du bist ein blutiger Anfänger!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Jeder Söldner muss sich auf seine Kameraden verlassen können. Unser aller Leben hängt davon ab.
		B_Cord_BeBetter();
		Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
		B_LogEntry(TOPIC_CordProve,TOPIC_CordProve_1);
	};
};


instance DIA_Cord_ExplainSkills(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent = FALSE;
	description = "Was soll ich eher lernen, einhändigen oder zweihändigen Kampf?";
};


func int DIA_Cord_ExplainSkills_Condition()
{
	if(Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Was soll ich eher lernen, einhändigen oder zweihändigen Kampf?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Die beiden Waffengattungen sind recht ähnlich.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Sobald du die nächste Stufe bei einer Waffengattung erreicht hast, lernst du automatisch die andere mit.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Wenn du zum Beispiel ein guter Kämpfer mit der Einhandwaffe bist, aber noch ein Anfänger mit der Zweihandwaffe ...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... wirst du bei allem, was du an Training in Einhandwaffen investierst, auch mit Zweihandwaffen besser werden.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Wenn du immer nur eine Waffengattung trainierst, wird das Training für dich anstrengender.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Trainierst du immer beide, kommst du mit weniger Einsatz genauso weit.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//Im Endeffekt kommt es aufs selbe raus - es ist deine Wahl.
};


instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Wo liegt der Vorteil von Einhand- oder Zweihandwaffen?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if(Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Wo liegt der Vorteil von Einhand- oder Zweihandwaffen?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Eine gute Frage. Ich sehe, du hast dich schon mit dem Thema auseinandergesetzt.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Einhänder sind schneller, aber etwas schwächer.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Zweihänder richten mehr Schaden an, aber du kannst nicht so schnell zuschlagen.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Außerdem ist mehr Stärke erforderlich, um einen Zweihänder zu führen. Das bedeutet zusätzliches Training.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Nur, wenn du bereit bist, viel zu investieren, hast du eine Chance, richtig gut zu werden.
};


var int Cord_Merke_1h;
var int Cord_Merke_2h;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Bring mir bei, wie man kämpft!";
};


func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Ich verschwende meine Zeit nicht mit Anfängern.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Bring mir bei, wie man kämpft!
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Ich kann dich an jeder Waffe ausbilden - womit wollen wir anfangen.
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Ich kann dich im Umgang mit Einhandwaffen trainieren. Aber für Zweihänder bist du noch zu schlecht.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Also mit Einhandwaffen bist du noch ein blutiger Anfänger! Aber du kannst schon ganz passabel mit einem Zweihänder umgehen.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Wenn du Erfahrung mit Einhandwaffen brauchst, such dir einen anderen Lehrer.
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter();
		};
		if(Cord_Approved == TRUE)
		{
			Info_ClearChoices(DIA_Cord_Teach);
			Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
			if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
			};
			if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
				Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
			};
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Ich trainiere nur Söldner oder würdige Anwärter!
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Du bist schon besser geworden - weiter so!
	};
	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),DIA_Cord_Teach_2H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),DIA_Cord_Teach_1H_5);
	};
};


instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

