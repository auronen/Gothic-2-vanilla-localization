
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hey, ich dachte, du wärst tot.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Ja ... war ich auch.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Jetzt bin ich wieder hier und suche nach Beweisen für die Ankunft der Drachen.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Für wen machst du das?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Ich arbeite für Lord Hagen. Mit Hilfe der Paladine können die Drachen aufgehalten werden.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Die Paladine? Jetzt sage ich dir mal was. Nachdem ich von hier fliehen konnte, war ich in Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Ich wollte die Paladine vor den Drachen warnen. Weiß der Henker, warum ich das überhaupt versucht habe.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Denn dieser aufgeblasene Lothar hat mir nicht mal zugehört - geschweige denn, mich zu Lord Hagen vorgelassen.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Stattdessen haben sie mich mit der Expedition wieder her geschickt. Also erzähle mir nichts von den Paladinen ...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Mit wessen Hilfe auch immer, wichtig ist nur, dass wir die Drachen aufhalten - solange wir noch Zeit dafür haben.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Aufhalten? Wir sollten unsere Ärsche aus dem Tal schaffen, solange wir noch Zeit DAFÜR haben.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Hör zu, ich brauche diese Beweise.
	if(Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Na schön, wenn das deine Mission ist - sprich mal mit Kommandant Garond.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Wenn jemand was über die Drachenangriffe weiß, dann sind es die Jungs in der Burg.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Okay, wenn ich dir helfen kann, werde ich das tun. Aber ich werde meinen Kopf für niemanden in die Schlinge legen.
	};
};


instance DIA_DIEGOOW_GAROND(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "Ich bin im Auftrag von Garond unterwegs.";
};


func int dia_diegoow_garond_condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_garond_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Ich bin im Auftrag von Garond unterwegs. Er muss wissen, wie viel Erz bisher geschürft wurde.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//Und dann gibt er dir die Beweise, die du haben willst?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//So sieht's aus. Also - kannst du mir was darüber erzählen?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//Na klar, was willst du wissen?
};


instance DIA_DIEGOOW_SILVESTRO(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = dia_diegoow_silvestro_condition;
	information = dia_diegoow_silvestro_info;
	permanent = FALSE;
	description = "Was weißt du von Silvestros Erz?";
};


func int dia_diegoow_silvestro_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_garond) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_silvestro_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//Was weißt du von Silvestros Erz?
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Hier hinten in der Höhle sind die VIER Kisten Erz, die Silvestros Männer geschürft haben.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Die kann sich Garond gerne abholen - aber dann werde ich nicht mehr da sein.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Sag mal - wie bist du eigentlich über den Pass gekommen? Ich denke, da sitzen die Orks rum.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Es gibt einen Weg durch die verlassene Mine, der nicht von Orks besetzt ist.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Gut zu wissen. Dann werde ich mich wohl bald nach Khorinis aufmachen - hab da noch ein paar alte Rechnungen zu begleichen.
	Silvestro_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,TOPIC_ScoutMine_5);
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "Wie bist du an das Erz gekommen?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_silvestro) && (Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//Wie bist du an das Erz gekommen?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Ich war bei Silvestros Truppe. Wir schürfen da also schon ein paar Tage, da wird Silvestro auf einmal unruhig.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Er meinte, wir müssen das Erz unbedingt an einen sicheren Ort bringen.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Na ja, da ich eh vor hatte, mich abzusetzen, habe ich dann die Sicherstellung des Erzes übernommen.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//Und das war mein Glück. Denn die Schürfer sind auf einige Minecrawler gestoßen. Und das hat keiner überlebt.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "Was ist mit den beiden toten Rittern...";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if((Kapitel == 2) && ((Npc_HasItems(PAL_Leiche4,ItMi_OldCoin) == 0) || (Npc_HasItems(PAL_Leiche5,ItMi_OldCoin) == 0)))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//Was ist mit den beiden toten Rittern vor deinem Versteck?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Der Kampf gegen eine Gruppe von Snappern wurde ihnen zum Verhängnis.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Das Minental hat halt seine eigenen Regeln. Ich hab's ihnen gesagt. Aber sie wollten nicht auf mich höhren.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = TRUE;
	description = "Was muss ich über das Tal wissen? ";
};


func int DIA_DiegoOw_Perm_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_DiegoOw_Ritter))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Was muss ich über das Tal wissen?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Mit dem Fall der Barriere hat sich hier einiges verändert. Die Orks haben hier das Sagen.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//Wir Menschen sind nur noch Futter für die wahren Herrscher des Tals: die Drachen.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Weiche allem aus, was stärker ist als du - und halte dich von allem fern, was nach Drache aussieht.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 9;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Ich will Gorn freikaufen...";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if((Kapitel == 2) && (MIS_RescueGorn == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Ich will Gorn freikaufen, aber Garond verlangt 1000 Goldstücke.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Ein schöner Batzen Gold. Ich habe 300 Goldstücke dabei, die kannst du mitnehmen. Der Rest liegt an dir.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,TOPIC_RescueGorn_7);
};


instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = FALSE;
	description = "Kannst du mir was beibringen?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//Dafür haben wir keine Zeit. Ich habe echt Wichtigeres zu tun.
};


instance DIA_ThiefOW_PICKPOCKET(C_Info)
{
	npc = PC_ThiefOW;
	nr = 900;
	condition = DIA_ThiefOW_PICKPOCKET_Condition;
	information = DIA_ThiefOW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,Dialog_Back,DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

