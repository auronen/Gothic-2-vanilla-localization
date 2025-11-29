
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_SPERRE(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = dia_baltram_sperre_condition;
	information = dia_baltram_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baltram_sperre_condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_baltram_sperre_info()
{
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos(self);
};


instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Willkommen Fremder, mein Name ist Baltram. Bist du gekommen, um dich mit Nahrung einzudecken?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Da muss ich dich leider enttäuschen. Ich habe momentan nicht viel auf Lager.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Aber bald bekomme ich eine weitere Lieferung.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Wenn du gekommen bist, um Nahrungsmittel bei mir zu kaufen, kannst du gleich wieder verschwinden.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Ich halte nicht viel von euch Söldnern! Ihr macht mir nur Ärger.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,TOPIC_CityTrader_11);
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "Hast du einen Job für mich?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Hast du einen Job für mich?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Nein, ich habe schon einen Boten. Probier's doch mal bei den anderen Händlern.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Hast du Interesse an einem Job?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Klar, worum geht's?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Mein Bote ist nicht zurückgekehrt, und ich warte auf eine Lieferung vom Bauer Akil.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//Und wie viel ist dir die Sache wert?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Ich gebe dir 50 Goldstücke.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Gut, ich bin dabei.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Okay, sag Akil einfach, dass du von mir kommst, er wird dir dann ein Paket geben. Das bringst du zu mir.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,TOPIC_Nagur_4);
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,TOPIC_Baltram_2);
};


instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Zeig mir deine Ware";
};


func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Zeig mir deine Ware.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Man hätte es gar nicht so weit kommen lassen sollen. Jetzt hat doch einer der Söldner tatsächlich einen der Paladine ermordet.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Irgendwann musste ja etwas passieren!
	};
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Typen wie du kriegen bei mir nichts.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Wieso?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Erst die Bauern aufwiegeln und dann so tun, als wäre nichts gewesen.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Jetzt verschwinde, du vertreibst mir die Kundschaft.
		MIS_BaltramTrade = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "Wo finde ich Akils Hof?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Wo finde ich Akils Hof?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Geh einfach hier vorne durch das Osttor raus und folge dem Weg nach Südosten.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Nach kurzer Zeit kommst du an eine Steintreppe. Die gehst du rauf und von da kannst du Akils Hof schon sehen.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "Ich habe die Lieferung von Akil.";
};


func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Ich habe die Lieferung von Akil.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Ausgezeichnet. Endlich kann ich wieder frische Waren anbieten. Hier sind deine 50 Goldstücke.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};


instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "Können wir nicht doch ins Geschäft kommen?";
};


func int DIA_Baltram_LetUsTrade_Condition()
{
	if(MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Können wir nicht doch ins Geschäft kommen?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Pass auf, wenn du mir 10 Schinken und 10 Flaschen Wein besorgst, dann werde ich wieder mir dir handeln.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Ich werde sehen, was ich tun kann.
	MIS_BaltramTrade = LOG_Running;
};


var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "Ich habe deine Ware.";
};


func int DIA_Baltram_HaveYourWarez_Condition()
{
	if((MIS_BaltramTrade == LOG_Running) && (MIS_BaltramTrade != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Ich habe deine Ware.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Zeig her.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Wir hatten doch 10 Schinken ausgemacht. Komm wieder, wenn du genug zusammen hast.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//Und was ist mit den 10 Flaschen Wein? Hast du die etwa vergessen?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmm, ist zwar nicht die beste Qualität, aber in diesen Zeiten sollte man nicht zu wählerisch sein.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Jetzt sollte unseren zukünftigen Geschäften nichts mehr im Wege stehen.
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

