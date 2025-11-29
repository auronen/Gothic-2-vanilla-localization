
instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kardif_PICKPOCKET(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 900;
	condition = DIA_Kardif_PICKPOCKET_Condition;
	information = DIA_Kardif_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Kardif_PICKPOCKET_Condition()
{
	return C_Beklauen(55,85);
};

func void DIA_Kardif_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,Dialog_Back,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kardif_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};


instance DIA_Kardif_Hi(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = "Wie sieht's aus?";
};


func int DIA_Kardif_Hi_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Wenn du was trinken willst, dann bestell dir was.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,TOPIC_CityTrader_4);
};


instance DIA_Kardif_Hallo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = "Du kriegst doch bestimmt 'ne Menge mit ...";
};


func int DIA_Kardif_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi) && (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Du kriegst doch bestimmt 'ne Menge mit ...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//Und, was geht dich das an?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Ich habe immer ein offenes Ohr für Neuigkeiten.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//Hast du auch einen offenen Geldbeutel?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Jede Information, die ich dir gebe, kostet dich 10 Goldstücke.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,TOPIC_CityTrader_5);
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Ich gebe dir höchstens 5 für deine Infos. ",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo,"Vergiss es - ich hole mir meine Infos woanders.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo,"Okay, einverstanden.",DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Okay, einverstanden.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Du hast ein gutes Geschäft gemacht (grinst). Ich stehe dir jederzeit zur Verfügung.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Ich gebe dir höchstens 5 für deine Informationen.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Was, 5 Goldstücke? Willst du mich ruinieren? (überlegt kurz) - sagen wir 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Nein, so läuft das nicht. Sagen wir 6! ",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo,"Okay, 7 Goldstücke klingt gut.",DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Vergiss es - ich hole mir meine Informationen woanders.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Okay, okay ... ich gehe runter auf 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Okay, 7 Goldstücke klingt gut.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo,"Nein, ich bin nicht auf deine Informationen angewiesen. ",DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Okay, 7 Goldstücke klingt gut.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(grinst) Eine gute Entscheidung. Also, wenn du was wissen willst, frage mich.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Nein, ich bin nicht auf deine Informationen angewiesen.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hey, warte ... Seufz - okay, 5 Goldstücke. Aber das ist mein letztes Angebot!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Warum nicht gleich so? ",DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//Warum nicht gleich so?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ach, ich bin einfach nicht mehr in Form. Aber was soll's ... der Handel gilt.
	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Nein, so läuft das nicht. Sagen wir 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Du bist ein Schlitzohr, weißt du das? Na, meinethalben, sagen wir 6 Goldstücke für jede Information.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Gib mir was zu trinken.";
};


func int DIA_Kardif_TRADE_Condition()
{
	if(Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Gib mir was zu trinken.
};


instance DIA_Kardif_TradeInfo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = "Ich brauche Informationen.";
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if((Kardif_OneQuestion == FALSE) && (Kardif_Deal > 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Ich brauche Informationen.
	Kardif_OneQuestion = TRUE;
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Komm wieder, wenn du genug Gold hast.
};


instance DIA_Kardif_Buerger(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Buerger_Condition;
	information = DIA_Kardif_Buerger_Info;
	permanent = TRUE;
	description = "Wer zählt zu den einflussreichen Bürgern der Stadt?";
};


var int DIA_Kardif_Buerger_permanent;

func int DIA_Kardif_Buerger_Condition()
{
	if((DIA_Kardif_Buerger_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Buerger_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Wer zählt zu den einflussreichen Bürgern der Stadt?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Hier unten am Hafen wirst du niemanden finden. Der einzige mächtige Mann hier, ist Lehmar.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Der Geldverleiher wird zwar nicht gerne gesehen, aber er hat Gold und andere einflussreiche Bürger haben Schulden bei ihm.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Die Händler und Handwerker haben auch viel Einfluss - zuviel für meinen Geschmack.
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lehmar(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lehmar_Condition;
	information = DIA_Kardif_Lehmar_Info;
	permanent = TRUE;
	description = "Wer hat alles Schulden bei Lehmar?";
};


var int DIA_Kardif_Lehmar_permanent;

func int DIA_Kardif_Lehmar_Condition()
{
	if((DIA_Kardif_Lehmar_permanent == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Buerger_permanent == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Wer hat alles Schulden bei Lehmar?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(lacht) Wenn du das wissen willst, wirfst du am besten mal ein Blick in sein Schuldenbuch.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Dürfte nur ziemlich schwierig sein, da ranzukommen ohne das er's merkt.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Soviel ich weiß, trägt er's nämlich immer bei sich...
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Arbeit(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Arbeit_Condition;
	information = DIA_Kardif_Arbeit_Info;
	permanent = TRUE;
	description = "Wo kann ich Arbeit finden?";
};


var int DIA_Kardif_Arbeit_permanent;

func int DIA_Kardif_Arbeit_Condition()
{
	if((DIA_Kardif_Arbeit_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Wo kann ich Arbeit finden?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Hier im Hafenviertel wird dir kaum jemand Arbeit geben. Da musst du schon in die Unterstadt zu den Handwerkern gehen.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Aber wenn du 'ne gute Waffe schwingst, dann kannst du ja Alrik herausfordern. Er kämpft für Gold, hinter dem Lagerhaus.
		DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Lernen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Lernen_Condition;
	information = DIA_Kardif_Lernen_Info;
	permanent = TRUE;
	description = "Bei wem kann ich hier was lernen?";
};


var int DIA_Kardif_Lernen_permanent;

func int DIA_Kardif_Lernen_Condition()
{
	if((DIA_Kardif_Lernen_permanent == FALSE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lernen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Bei wem kann ich hier was lernen?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Hier im Hafenviertel gibt's ein paar fähige Leute.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Carl der Schmied, ist ein kräftiger Bursche. Er kann dir bestimmt zeigen, wie du stärker wirst.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Alrik versteht sich aufs Kämpfen. Und Lares ist ein geschickter Gauner. Er ist auch gelegentlich hier im Hafenviertel.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//Und wenn du verrückt genug bist, den alten Ignaz aufzusuchen, der kennt sich mit Aleche ... Almich ... tränken aus.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Wo finde ich all diese Leute?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(stöhnt) Junge, bis ich dir das erklärt habe, hat der König den Krieg gegen die Orks gewonnen!
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Schau dich einfach im Hafenviertel um, dann wirst du sie schon finden. Und wenn du keine Ahnung hast, dann kauf dir doch 'ne Karte bei Brahim.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//DEN findest du leicht. Er hat seine Hütte direkt neben meiner Kneipe. (murmelt) Dafür hätte ich eigentlich das Doppelte nehmen sollen.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_3);
		B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_4);
		B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_5);
		B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_6);
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,TOPIC_CityTrader_6);
		DIA_Kardif_Lernen_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk_Condition;
	information = DIA_Kardif_Diebeswerk_Info;
	permanent = TRUE;
	description = "Gibt es hier auch 'spezielle' Arbeit,... ?";
};


var int DIA_Kardif_Diebeswerk_permanent;

func int DIA_Kardif_Diebeswerk_Condition()
{
	if((DIA_Kardif_Diebeswerk_permanent == FALSE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Gibt es hier auch 'spezielle' Arbeit, bei der ich schnell was verdienen kann?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Was 'spezielles' also. Hmmm ...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//... sprich mal mit Nagur. Vielleicht kann er dir weiterhelfen.
		DIA_Kardif_Diebeswerk_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Diebeswerk2(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Diebeswerk2_Condition;
	information = DIA_Kardif_Diebeswerk2_Info;
	permanent = TRUE;
	description = "Hast du noch was spezielles für mich?";
};


var int DIA_Kardif_Diebeswerk2_permanent;

func int DIA_Kardif_Diebeswerk2_Condition()
{
	if((DIA_Kardif_Diebeswerk2_permanent == FALSE) && (DIA_Kardif_Diebeswerk_permanent == TRUE) && (DIA_Kardif_Arbeit_permanent == TRUE) && (Kardif_OneQuestion == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Hast du noch was Spezielles für mich?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Ich hätte da schon was - ist allerdings nur interessant, wenn du ein Mann mit vielseitigen Talenten bist.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Was hast du für mich?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Nun Zuris, der Trankhändler am Marktplatz, beherbergt zurzeit den Feuermagier Daron als Gast.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//Und?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//Er hat extra für ihn eine neue Truhe bei Thorben, dem Tischler, anfertigen lassen.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Angeblich hat dieser Daron eine ganze Menge wertvollen Kram mitgebracht. Aber von mir hast du das nicht gehört, klar?
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_Zurueck(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_Zurueck_Condition;
	information = DIA_Kardif_Zurueck_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int DIA_Kardif_Zurueck_Condition()
{
	if(Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zurueck_Info()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices(DIA_Kardif_Zurueck);
};


instance DIA_Kardif_DOPE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 5;
	condition = DIA_Kardif_DOPE_Condition;
	information = DIA_Kardif_DOPE_Info;
	permanent = TRUE;
	description = "Wo kann ich hier Kraut kaufen?";
};


var int DIA_Kardif_DOPE_perm;

func int DIA_Kardif_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DOPE_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Wo kann ich hier Kraut kaufen?
	if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Bei mir nicht - ich habe mit so was nichts zu tun!
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Bei mir nicht.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Okay, bei wem dann?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//An deiner Stelle würde ich mal mit Meldor sprechen, der raucht schließlich den ganzen Tag.
		DIA_Kardif_DOPE_perm = TRUE;
	};
};


instance DIA_Kardif_Paket(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 3;
	condition = DIA_Kardif_Paket_Condition;
	information = DIA_Kardif_Paket_Info;
	permanent = TRUE;
	description = "Was weißt du über ein Paket voller Sumpfkraut?";
};


var int DIA_Kardif_Paket_perm;

func int DIA_Kardif_Paket_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_Running) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Paket_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Paket_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Was weißt du über ein Paket voller Sumpfkraut?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Wer ein solches Paket besitzt, ist ein reicher Mann. Und wahrscheinlich ziemlich entspannt!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Verarsch mich nicht. Du weißt doch was darüber. Also spuck's aus!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Okay, okay ... letztens war ein Kerl in meiner Kneipe. Das war einer von den Söldnern.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Er meinte, er hätte ein Paket Sumpfkraut am Hafen verkauft, aber er war ja völlig zugedröhnt. Mehr weiß ich nicht.
		DIA_Kardif_Paket_perm = TRUE;
		B_LogEntry(TOPIC_Warehouse,TOPIC_Warehouse_2);
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_SENDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || ((Diebesgilde_Okay >= 3) && Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hey du, komm mal rüber. Ich hab da was für dich.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Hier war so ein Kerl, der unbedingt mit dir quatschen wollte.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Aber da du nicht da warst, hat er mir gesagt, ich soll dir was ausrichten.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Er will sich mit dir treffen. Hinter Halvors Fischladen.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Diese Information ist umsonst - aber das ist nur 'ne Ausnahme, klar? Für alles weitere musst du zahlen!
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Wie sah der Kerl aus?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//Das könnte ich dir schon sagen - aber dafür musst du zahlen, mein Freund. (grinst)
	if(Kardif_Deal == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Jede Information, die ich dir gebe, kostet dich 10 Goldstücke.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_Kardif_Kerl(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Kerl_Condition;
	information = DIA_Kardif_Kerl_Info;
	permanent = TRUE;
	description = "Wie sah der Kerl aus?";
};


var int DIA_Kardif_Kerl_permanent;

func int DIA_Kardif_Kerl_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA) && (Attila.aivar[AIV_TalkedToPlayer] == FALSE) && (Kardif_OneQuestion == TRUE) && (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Wie sah der Kerl aus?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Nun, ziemlich groß, dunkelhäutig und kräftig - aber keine Uniform. Irgendwie ... bedrohlich.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//Und sein Gesicht?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Sein Gesicht? Als er mich angesehen hat, war ich froh, dass er nicht wegen mir gekommen ist.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//Es lag etwas Unheimliches in seinen Augen - na ja, ich denke, du solltest ihn aufsuchen. Wird bestimmt interessant.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Ja ... fragt sich nur, für wen ...
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = "Der Kerl wollte mich umbringen!";
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Der Kerl wollte mich umbringen!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hey, was hab ich jetzt damit zu tun? Ich hab nur Informationen weitergegeben.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Wenn dir irgendwer auf die Füße treten will, dann wird er wohl seinen Grund haben.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
	B_KillNpc(Attila);
	Npc_RemoveInvItem(Attila,ItMi_OldCoin);
};


instance DIA_Kardif_Zeichen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent = FALSE;
	description = "(Diebeszeichen zeigen)";
};


func int DIA_Kardif_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Hm, du mischst bei der Bande mit. Na gut. Dann habe ich etwas für dich.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(leise) Wenn du mal Dietriche brauchst, dann komm zu mir. Ich habe noch ein paar auf Lager. Frag mich einfach nach was zu trinken.
	CreateInvItems(self,ItKE_lockpick,20);
};


instance DIA_Kardif_Crew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = "Ich brauche noch ein paar Seeleute.";
};


func int DIA_Kardif_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Ich brauche noch ein paar Seeleute.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Schlechte Zeiten, mein Freund. Du wirst auf ganz Khorinis nicht genug Seeleute finden, die meisten haben die Stadt verlassen.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Aber mit einem guten Kapitän sollte es nicht allzu schwierig sein, aus ein paar intelligenten Kerlen in kurzer Zeit eine brauchbare Mannschaft zusammenzustellen.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Wo finde ich einen Kapitän?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Du fragst den Falschen. Ich bin hier nur der Wirt.
	if(Npc_IsDead(Jack) == FALSE)
	{
		if(SCGotCaptain == FALSE)
		{
			Log_CreateTopic(Topic_Captain,LOG_MISSION);
			Log_SetTopicStatus(Topic_Captain,LOG_Running);
			B_LogEntry(Topic_Captain,Topic_Captain_3);
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Rede mal mit dem Alten Jack. Er ist hier im Hafen, schon so lange ich denken kann. Er weiß Bescheid, wenn es um die Seefahrt geht.
	};
};

