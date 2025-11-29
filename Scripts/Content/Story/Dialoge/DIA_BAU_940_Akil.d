
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Ich muss gehen.
	if(Akil_Sauer == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Lass dich nicht aufhalten.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Mach's gut. Ich wünschte wirklich, ich hätte mehr für dich tun können.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo(C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hallo_Info;
	permanent = FALSE;
	description = "Gibt's Schwierigkeiten?";
};


func int DIA_Akil_Hallo_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Gibt's Schwierigkeiten?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(schwitzt) ... äh ... nein nein ... es ist alles in Ordnung. (nervös) Es ... ist besser, wenn du jetzt gehst.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Bist du sicher?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//äh ... ja, ja ... es ist alles in Ordnung. Du ... äh ... ich ... Ich kann jetzt nicht mit dir reden.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,TOPIC_AkilsSLDStillthere_1);
	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Nichtjetzt(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Nichtjetzt_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_Nichtjetzt_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_KnowsInfo(other,DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Äh ... nicht jetzt, ich kann jetzt nicht mit dir reden ...
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_NachKampf_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_NachKampf_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Innos sei Dank. Ich dachte schon, meine letzte Stunde hätte geschlagen.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Mein Name ist Akil. Ich bin der Bauer dieses bescheidenen Stück Landes hier.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Was waren das für Kerle?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Du solltest sie eigentlich kennen. Das waren Söldner von Onars Hof. Wie du.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//Das waren Söldner von Onars Hof. Was Anderes als plündern und morden kennen diese Bastarde nicht.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Ich hatte schon das Schlimmste befürchtet ...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(atmet durch)... nun ich danke Innos, dass es nicht soweit gekommen ist. Sag mir, was ich für dich tun kann.
	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf,"Nichts. Hauptsache, ihr habt die Sache gut überstanden.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf,"Wie wär's mit ein paar Goldstücken?",DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(Kati) && !Npc_IsDead(Kati))
	{
		Npc_ExchangeRoutine(Kati,"Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0;
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		Npc_ExchangeRoutine(Randolph,"Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Nichts. Hauptsache, ihr habt die Sache gut überstanden.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Du bist ein außergewöhnlicher Kerl. Möge Innos dich auf deinem Weg schützen.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Wie wär's mit ein paar Goldstücken?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Da muss ich dich leider enttäuschen - wir sind arme Bauern. Es reicht gerade zum Überleben.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Alles, was ich dir anbieten kann, ist eine Mahlzeit. Geh zu Kati und lass dich von ihr versorgen.
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};


instance DIA_Akil_Soeldner(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = "Was wollten die Söldner von dir? ";
};


func int DIA_Akil_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Was wollten die Söldner von dir?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Willst du mich verarschen. Die Söldner wollten die Pacht eintreiben.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Weißt du das nicht? Onar, der Großbauer, hat sie angeworben. Sie bewachen seinen Hof und treiben für ihn die Pacht ein.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//Das heißt, sie ziehen von Hof zu Hof und nehmen sich, was sie wollen. Und wer nicht zahlen kann, der kriegt ihren Stahl zu spüren.
	};
};


instance DIA_Akil_Lieferung(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Lieferung_Condition;
	information = DIA_Akil_Lieferung_Info;
	permanent = FALSE;
	description = "Ich komme von Baltram...";
};


func int DIA_Akil_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (MIS_Baltram_ScoutAkil == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Ich komme von Baltram. Ich soll hier eine Lieferung für ihn abholen.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Dann bist du sein neuer Bote. Okay, ich habe das Paket schon fertig gemacht.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	B_LogEntry(TOPIC_Baltram,TOPIC_Baltram_1);
	B_LogEntry(TOPIC_Nagur,TOPIC_Nagur_3);
};


instance DIA_Akil_Gegend(C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Gegend_Condition;
	information = DIA_Akil_Gegend_Info;
	permanent = FALSE;
	description = "Du kennst dich doch hier in der Gegend aus...";
};


func int DIA_Akil_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Knows_Taverne;

func void DIA_Akil_Gegend_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Du kennst dich doch hier in der Gegend aus...
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Klar, was willst du wissen?
};


instance DIA_Akil_Hof(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = "Wo finde ich den Hof von Onar? ";
};


func int DIA_Akil_Hof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Wo finde ich den Hof von Onar?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Geh einfach wieder die Steinstufen runter und folge dem Weg weiter nach Osten.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Irgendwann kommt eine Taverne. Da gehst du weiter nach Osten bis du zu den großen Feldern kommst. Da lungern dann schon die Söldner rum.
	Knows_Taverne = TRUE;
};


instance DIA_Akil_Taverne(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = "Was ist das für eine Taverne im Osten?";
};


func int DIA_Akil_Taverne_Condition()
{
	if(Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Was ist das für eine Taverne im Osten?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Frag mal Randolph. Er weiß mehr darüber als ich. Er war schon ein paar mal dort.
};


instance DIA_Akil_Wald(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = "Was finde ich in dem Wald hinter deinem Hof?";
};


func int DIA_Akil_Wald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Was finde ich in dem Wald hinter deinem Hof?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Da gibt's nur jede Menge Monster - wobei die Wölfe noch die ungefährlichsten sind.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Angeblich sollen da auch ein paar Banditen ihre Höhle haben. Na - meinen Hof haben sie bis jetzt in Ruhe gelassen.
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = "Sonst noch irgendwas passiert?";
};


func int DIA_Akil_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Sonst noch irgendwas passiert?
	if(Kapitel == 3)
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Nein. Ich hoffe, die Schafe bleiben jetzt da, wo sie sind.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Meine Schafe verschwinden ständig, bald kann ich uns nicht mehr ernähren.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Die Orks sind überall gesehen worden. Sie haben auch ein Hauptquartier, hat man mir erzählt. Frag mal den Bauern Lobart danach.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Es sollen hier in der Gegend viele Echsenmenschen gesehen worden sein. Ich würde an deiner Stelle nicht in die Höhlen gehen.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Die schwarzen Kapuzenmänner suchen dich.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//Ach. Das ist ja ganz was Neues.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Schon gut. Ich dachte, ich erwähne es mal.
		};
	};
};


instance DIA_Akil_KAP3_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP3_EXIT_Condition;
	information = DIA_Akil_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_SCHAFDIEB(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = "Gibt's sonst noch Neuigkeiten?";
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Gibt's sonst noch Neuigkeiten?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//In letzter Zeit werden mir ständig Schafe gestohlen. Ich hab schon einige Nächte nicht mehr vernünftig schlafen können.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Nicht mein Problem.",DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Wieviele Schafe fehlen dir?",DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Wer kann das getan haben?",DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe,TOPIC_AkilSchafDiebe_1);
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Wer kann das getan haben?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Ich habe da so einen Verdacht.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//In der Höhle drüben im Wald haben sich recht üble Gesellen nieder gelassen.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Ich glaube kaum, dass sie sich nur von Waldbeeren ernähren. Ich bin fast sicher, dass sich meine Schafe dorthin verflüchtigen.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Wie viele Schafe fehlen dir?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Es sind jetzt schon mindestens drei, die verschwunden sind.
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//Nicht mein Problem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Schon klar. Du hast sicher andere Sorgen.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = "Ich habe die Schafdiebe gefunden.";
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe == LOG_Running) && Npc_IsDead(BDT_1025_Bandit_H) && Npc_IsDead(BDT_1026_Bandit_H) && Npc_IsDead(BDT_1027_Bandit_H))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Ich habe die Schafdiebe gefunden.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Du hattest Recht. Es waren die Kerle in der Waldhöhle. Sie werden dir keine Schafe mehr stehlen.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Ich danke dir, edler Diener Innos'.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Danke. Die Miliz kümmert sich also doch um uns kleine Bauern.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Danke. Du bist schon ein seltsamer Söldner. Ganz anders als die, die ich sonst kenne.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Nimm dies als kleine Anerkennung von mir, für deinen selbstlosen Gefallen, den du mir erwiesen hast.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instance DIA_Akil_AkilsSchaf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	description = "(Akils Schaf zurückgeben)";
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000) && (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Sehr gut. Hier hast du einige Goldmünzen. Ich hoffe, es ist genug.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;
	B_GivePlayerXP(XP_AkilsSchaf);
};


instance DIA_Akil_KAP4_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP4_EXIT_Condition;
	information = DIA_Akil_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP5_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP5_EXIT_Condition;
	information = DIA_Akil_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP6_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP6_EXIT_Condition;
	information = DIA_Akil_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_PICKPOCKET(C_Info)
{
	npc = BAU_940_Akil;
	nr = 900;
	condition = DIA_Akil_PICKPOCKET_Condition;
	information = DIA_Akil_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Akil_PICKPOCKET_Condition()
{
	return C_Beklauen(37,30);
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET,Dialog_Back,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

