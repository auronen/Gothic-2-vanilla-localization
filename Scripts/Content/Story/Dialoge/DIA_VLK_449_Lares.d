
instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


instance DIA_Lares_HALLO(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Ich werd verrückt, was machst du denn hier?
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Bist du bis hierher GESCHWOMMEN?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(lacht) Das ist auch ein Weg, an den Stadttorwachen vorbeizukommen.
		B_GivePlayerXP(500);
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Sind wir uns schon mal begegnet?",DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO,"Hey, Lares alter Gauner...",DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Sind wir uns schon mal begegnet?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Mann, du kannst dich nicht mehr an mich erinnern?! Ich hab mich im Neuen Lager rumgetrieben.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Die Liste für die Mine ... Mann, wir hatten echt 'ne Menge Spaß. Erinnerst du dich denn noch an Lee?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Natürlich kenne ich Lee noch!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hey, Lares, alter Gauner, wie bist du hier her gekommen?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Ich konnte gerade noch rechtzeitig aus dem Minental fliehen, zusammen mit Lee und ein paar anderen Jungs.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Du kannst dich doch noch an Lee erinnern, oder?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Natürlich kenne ich Lee noch!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Lee...?",DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Ich bin damals mit ihm aus der Kolonie abgehauen. Kurz nachdem die Barriere zerstört wurde.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Er ist jetzt mit seinen Jungs auf dem Hof von Onar, dem Großbauern.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Er hat einen Deal mit dem Bauern gemacht. Er und seine Jungs verteidigen den Hof und Onar füttert sie dafür durch.
};

func void DIA_Lares_HALLO_LEE()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Natürlich kenne ich Lee noch!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee ...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Du hast wohl 'ne Menge mitgemacht, was? Lee war der Anführer der Söldner im Neuen Lager.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_LARES_WHYINCITY(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = dia_lares_whyincity_condition;
	information = dia_lares_whyincity_info;
	permanent = FALSE;
	description = "Warum bist DU nicht bei Lee und seinen Söldnern?";
};


func int dia_lares_whyincity_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lares_whyincity_info()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//Warum bist DU nicht bei Lee und seinen Söldnern?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Bin ich doch! Nur eben nicht auf dem Hof.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Ich bin sozusagen unser Vorposten in der Stadt. Wir wollen ja schließlich nicht, dass das Schiff ohne uns abfährt.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//Warum bist DU in die Stadt gekommen?
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = "Ich muss unbedingt mit den Paladinen reden!";
};


func int DIA_Lares_Paladine_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Ich muss unbedingt mit den Paladinen reden!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Was willst du denn von DENEN?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Sie haben ein mächtiges Amulett, das Auge Innos'. Ich muss es haben.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//Und du denkst, sie werden es dir geben? Du kommst ja nicht mal ins obere Viertel.
	AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Ich werde schon einen Weg finden.
	AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Klar, wenn du dich bei den Bürgern einschmeicheln oder Laufbursche für die Miliz spielen willst ...
};


instance DIA_LARES_ALTERNATIVE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = dia_lares_alternative_condition;
	information = dia_lares_alternative_info;
	permanent = FALSE;
	description = "Hab' ich eine Alternative?";
};


func int dia_lares_alternative_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lares_Paladine))
	{
		return TRUE;
	};
};

func void dia_lares_alternative_info()
{
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//Hab' ich eine Alternative?
	AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//Wenn ich du wäre, würde ich zu Onars Hof gehen und mit Lee reden.
	AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};


instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = FALSE;
	description = "Erzähl mir mehr über die Söldner.";
};


func int DIA_Lares_AboutSld_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Erzähl mir mehr über die Söldner.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Also wenn du noch so 'n harter Junge bist wie damals, solltest du mit ihnen keine Probleme haben.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Die meisten von ihnen sind Raufbolde und wer sich nicht durchsetzen kann, kommt auch nicht weit.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(lacht) Wenn du zart besaitet bist, hast du keine Chance, bei ihnen zu landen ...
};


instance DIA_LARES_SCHIFF(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = dia_lares_schiff_condition;
	information = dia_lares_schiff_info;
	permanent = FALSE;
	description = "Von welchem Schiff hast du geredet?";
};


func int dia_lares_schiff_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity) && (Schiffswache_213.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_schiff_info()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//Von welchem Schiff hast du geredet?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Es liegt am Hochseehafen, hinter den Felsen. Lee und ein paar von seinen Leuten wollen unbedingt hier weg.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Aber das kann noch dauern ...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Warum?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Das fragst du am besten Lee, wenn du ihn triffst ... Er hat Pläne...
};


instance DIA_LARES_WEGZUMHOF(C_Info)
{
	npc = VLK_449_Lares;
	nr = 7;
	condition = dia_lares_wegzumhof_condition;
	information = dia_lares_wegzumhof_info;
	permanent = FALSE;
	description = "Wie komme ich zum Hof des Großbauern?";
};


func int dia_lares_wegzumhof_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_wegzumhof_info()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Wie komme ich zum Hof des Großbauern?
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//Hier im Hafen gibt es zwar für gewöhnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht schöpft ...
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 8;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = "Weißt du, warum die Paladine hier sind?";
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Weißt du, warum die Paladine hier sind?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Das weiß keiner so genau ... Viele denken, es wäre wegen der Orks, aber ich denke, es gibt einen anderen Grund.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Hat wahrscheinlich was mit der alten Strafkolonie zu tun.
};


instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Weißt du etwas über eine Diebesgilde in der Stadt?";
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Weißt du etwas über eine Diebesgilde in der Stadt?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Du kannst Fragen stellen ...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Natürlich gibt es eine Diebesgilde hier. Wie in jeder größeren Stadt.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//Und jeder kleine Taschendieb oder Hehler hängt wahrscheinlich irgendwie mit drin.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = "Weißt du, wo ich die Diebesgilde finden kann? ";
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GuildOfThieves) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Weißt du, wo ich die Diebesgilde finden kann?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(lacht) Nichts gegen dich, aber wenn ich es wüsste, würde ich es dir nicht sagen.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Diese Leute reagieren für gewöhnlich SEHR empfindlich auf so was.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Wenn du dich mit ihnen einlassen willst, wäre ich sehr vorsichtig.
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = "Ich habe hier diesen vom Meersalz zerfressenen Schlüssel ...";
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_WhereGuildOfThieves) && Npc_HasItems(other,ItKe_ThiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Ich habe hier diesen vom Meersalz zerfressenen Schlüssel ...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//Und?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Ich denke, er wird mich zum Versteck der Diebesgilde führen ...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Tja, es könnte der Schlüssel zur Kanalisation sein.
};


instance DIA_Lares_Kanalisation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Kanalisation_Info;
	permanent = FALSE;
	description = "Wo finde ich die Kanalisation?";
};


func int DIA_Lares_Kanalisation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GotKey) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Wo finde ich die Kanalisation?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Was weiß ich ... sie endet für gewöhnlich im Meer.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Du bist jetzt bei der Miliz!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(lacht) Ich lach' mich tot - ein ehemaliger Sträfling bei der Miliz ...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Du bist jetzt also ein Paladin des Königs!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(verschmitzt) So was kannst auch nur du bringen ...
		if(Npc_KnowsInfo(other,dia_lares_whyincity))
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(besorgt) Du wirst doch nicht verpfeifen, dass ich für Lee arbeite, oder?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Du kennst mich doch ...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Ich fasse es nicht. Du bist ins Kloster gegangen. Wie ist es da?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Anders.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Kann ich mir denken.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//Ich hab gehört, du bist aufgenommen worden.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratuliere.
	};
};


instance DIA_Lares_GoNow(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = FALSE;
	description = "Okay, lass uns gehen.";
};


func int DIA_Lares_GoNow_Condition()
{
	if(Npc_KnowsInfo(other,dia_lares_wegzumhof) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Okay, lass uns gehen.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Dann wollen wir mal ... Folge mir.
	AI_StopProcessInfos(self);
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	if(Npc_KnowsInfo(other,DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};


instance DIA_Lares_GUIDE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GoNow) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_04"))
	{
		self.flags = 0;
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if(Lares_Guide > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//So, wir sind da.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Kommst du auch noch? Ich dachte schon, du hättest dich von den Wölfen fressen lassen.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//So, den Rest des Weges wirst du alleine zurücklegen. Ich muss zurück in die Stadt, hab noch ein paar Sachen zu erledigen ...
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Folge einfach dem Weg hier, und denk daran - setz dich durch und lass dir nichts gefallen, dann läuft schon alles glatt.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Lares_DEX(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = "Kannst du mir was beibringen?";
};


func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_Lares_DEX_09_01");	//Klar. Wenn du willst, helfe ich dir, geschickter zu werden.
	Lares_TeachDEX = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_4);
};


var int Lares_MerkeDEX;

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = "Ich will geschickter werden!";
};


func int DIA_Lares_TEACH_Condition()
{
	if(Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self,"DIA_Lares_TEACH_15_00");	//Ich will geschickter werden!
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Du hast schon etwas an Geschicklichkeit gewonnen.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,30);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,30);
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
};


instance DIA_Lares_Kap2_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap2_EXIT_Condition;
	information = DIA_Lares_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap3_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap3_EXIT_Condition;
	information = DIA_Lares_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_AnyNews(C_Info)
{
	npc = VLK_449_Lares;
	nr = 39;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = "Gibt's was Neues?";
};


func int DIA_Lares_AnyNews_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Gibt's was Neues?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Für die besten Nachrichten bist du ja selbst verantwortlich. Bennet haben sie wieder laufen lassen, er ist schon wieder auf dem Hof.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Geh mal hin, ich denke, er will sich auch noch selbst bei dir bedanken.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Das kann mal wohl sagen. Die Paladine haben Bennet, unseren Schmied, verhaftet.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Ich habe bereits davon gehört, schlimme Sache.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Das kannst du wohl laut sagen.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Wie ist das passiert?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet war in der Stadt, um Vorräte einzukaufen. Na ja, er ist nicht zurückgekommen.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Wenn du Genaueres erfahren willst, frag am besten Hodges, er war mit Bennet in der Stadt.
			MIS_RescueBennet = LOG_Running;
		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 38;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = "Hast du was von Bennet gehört?";
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Hast du was von Bennet gehört?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Sie haben ihn anscheinend in die Kaserne gebracht und dort in den Kerker geschmissen.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Wie können wir ihn da rausholen?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Ich habe noch keine Idee, ich komme nicht bis zu seiner Zelle, um mit ihm zu reden.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Ich kann eigentlich nur die Ohren offen halten, aber hier erfährt man nichts.
};


instance DIA_Lares_Kap4_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap4_EXIT_Condition;
	information = DIA_Lares_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 49;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
	permanent = TRUE;
	description = "Wieso bist du nicht auf der Drachenjagd? ";
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Wieso bist du nicht auf der Drachenjagd?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//Das ist nichts für mich, das überlasse ich lieber den anderen.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nee, nee. Frische Seeluft - das ist es, was ich jetzt brauche.
};


instance DIA_Lares_Kap5_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap5_EXIT_Condition;
	information = DIA_Lares_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Hast du Lust, diese Insel zu verlassen?";
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lares_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Hast du Lust, diese Insel zu verlassen?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Nichts lieber als das, was hast du vor?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Ich habe herausgefunden, wo der Anführer der Drachen sich aufhält. Er ist auf einer Insel, nicht weit von hier.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Ich habe vor, ihm endgültig den Garaus zu machen.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Klingt nach 'nem Heidenspaß, wenn du mich brauchen kannst, bin ich dabei.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Brauchst du auf deiner Reise noch einen Lehrer für Geschicklichkeit oder Kampf mit der Einhandwaffe?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Das Schiff ist zwar schon voll, aber wenn sich was ergibt, komme ich wieder.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Ich kann dich nicht gebrauchen.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Ich wusste, dass ich mich auf dich verlassen kann.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Ich wusste, dass ich mich auf dich verlassen kann.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Wir treffen uns alle am Schiff.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Ein Mann der Taten, so hab ich es gern. Wir sehen uns.
	Lares_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Ich weiß dein Angebot zu schätzen, aber ich kann dich nicht gebrauchen.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Du musst wissen, was du willst. Wenn du noch mal darüber reden willst, du weißt ja, wo du mich finden kannst.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Es ist besser, wenn du nicht mitkommst.";
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Es ist besser, wenn du nicht mitkommst.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Wie du meinst, aber denk in Zukunft besser vorher nach, wem du welche Zusagen gibst.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 51;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = "Hast du noch Interesse an der Überfahrt?";
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Hast du noch Interesse an der Überfahrt?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Normalerweise lass ich mich ja nicht so behandeln, aber weil du zu uns gehörst, werde ich noch mal ein Auge zudrücken.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Wir sehen uns am Schiff.
		Lares_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Nimm's nicht persönlich, aber ich glaube, du hattest Recht.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Es ist wohl besser, wenn ich hier bleibe.
		AI_StopProcessInfos(self);
	};
};

