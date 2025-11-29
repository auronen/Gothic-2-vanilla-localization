
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = None_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && (Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Ich hoffe, dass hier in absehbarer Zeit ein Schiff reinkommt, auf dem ich anheuern kann.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Das Rumgehï¿½nge geht mir ganz schï¿½n auf die Nerven.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = None_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Ich hab gehört, du suchst Leute für dein Schiff?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//Und?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Ich bin dabei!
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,Topic_Crew_6);
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Warum sollte ich dich mitnehmen?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Warum sollte ich dich mitnehmen?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Ganz einfach, weil du mich brauchst.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Ich bin ... ich war Leutnant bei der Königlichen Kriegsmarine.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Ich habe als Seesoldat auf der König Rhobar und auf der Myrtanas Stolz gedient.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//In der Schlacht um das Östliche Archipel habe ich eigenhändig zwei Dutzend Orks zurück in Beliars Reich geschickt.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Leider waren wir zu wenige, nachdem unser Flaggschiff versenkt worden ist, mussten wir uns zurückziehen.
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = None_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "Wieso bist du dann hier? ";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Wieso bist du dann hier?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Die Flotte ist geschlagen und die Soldkassen sind leer.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//Nach meiner Entlassung bin ich dann hier in diesem Nest gestrandet und suche eine neue Heuer.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = None_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Was kannst du?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Was kannst du?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Ich bin ausgebildet für den Enterkrieg und im Nahkampf, ferner bin ich ein ganz brauchbarer Schütze mit der Schiffskanone.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Ich wette, es gibt die eine oder andere Sache, die ich dir auf der Reise beibringen kann.
	B_LogEntry(Topic_Crew,Topic_Crew_7);
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = None_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "Was verlangst du?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Was verlangst du?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Was kann ich denn verlangen? Ich bin froh, wenn ich von hier wegkomme.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Hand gegen Koje. Ich helfe dir und dafür nimmst du mich mit.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = None_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Die Reise kann gefährlich werden.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Die Reise kann gefährlich werden.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Ich bin Gefahr gewohnt. Wenn du da draußen bist, ist jeder Tag gefährlich.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Der nächste Sturm kann dein Tod sein und die Ungeheuer aus den Tiefen können dein ganzes Schiff am Stück verschlingen.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//Die Orkischen Galeeren muss ich wohl nicht extra erwähnen oder? Glaub mir, es gibt nichts, wovor ich Angst habe. Ein Seemann, der Angst hat, ist schon tot
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "Ich kann dich nicht gebrauchen.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Ich kann dich nicht gebrauchen.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Ich bin der beste Seeman, den du hier finden wirst.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Wie du aussiehst, hast du keine Ahnung von der Seefahrt.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Also überleg dir sehr gut, wem du vertraust.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = None_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Gute Leute kann ich immer brauchen.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Gute Leute kann ich immer brauchen.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Alles klar, wir sehen uns dann am Schiff.
	B_GivePlayerXP(XP_Crewmember_Success);
	Mario_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Ich kann dich doch nicht gebrauchen!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Ich kann dich doch nicht gebrauchen!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Wie du meinst, du weißt ja, wo du mich findest!
	Mario_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = None_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ich kann dich doch gebrauchen!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if(((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Ich kann dich doch gebrauchen!
	if(Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Ich hab's doch gewusst. Wir sehen uns am Schiff!
		Mario_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		AI_StopProcessInfos(self);
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//So kannst du nicht mit mir umspringen. Ich werde dich aufschlitzen!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = None_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

