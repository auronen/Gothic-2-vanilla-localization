
var int Vatras_SchickeLeuteWeg;

instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		Vatras_SchickeLeuteWeg = FALSE;
	};
};


instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos sei mit dir.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Wer bist du?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Ich bin Vatras, ein Diener des Adanos, des Behüters des göttlichen und weltlichen Gleichgewichts.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Was kann ich für dich tun?
};


instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = "Ich bitte um deinen Segen.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Ich bitte um deinen Segen.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Für was soll ich dir meinen Segen geben, Fremder?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Ich will als Lehrling bei einem der Meister in der Unterstadt anfangen.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Was willst du wissen?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Nun, du könntest mit erzählen, wo du herkommst und warum du in die Stadt gekommen bist.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Ich komme mit einer wichtigen Botschaft für den Anführer der Paladine.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Was ist das für eine Botschaft?
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Es sind Drachen gekommen...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Es werden bald schreckliche Dinge passieren.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Während wir reden, sammelt sich eine große Armee unter der Führung von Drachen, um das Land zu erobern.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Wenn das tatsächlich wahr ist, wird das Gleichgewicht der Erde gestört. Wer hat dir das erzählt?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(überlegt) Drachen? Du sprichst von Wesen, die bisher nur in Sagen Erwähnung finden. Woher weißt du das?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Das habe ich irgendwo aufgeschnappt...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Xardas, der Magier hat es mir erzählt...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Es werden bald schreckliche Dinge passieren.
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(verärgert) Aha. Und wer hat dir das erzählt?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Schreckliche Dinge also, hm ... woher weißt du das?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Das habe ich irgendwo aufgeschnappt...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Xardas, der Magier hat es mir erzählt...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Xardas, der Magier, hat es mir erzählt. Er hat mich geschickt, die Paladine zu warnen.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Ich kenne diesen Mann als mächtigen und weisen Meister der Magie. Und wo kommst du her?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Der Dämonenbeschwörer ... Er lebt also ... (überlegt) und er hat dich losgeschickt? Wer bist du eigentlich?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ich bin nur ein Abenteurer aus dem Süden... ",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ich bin ein ehemaliger Gefangener... ",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Das habe ich irgendwo aufgeschnappt...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(ärgerlich) Weißt du wenigstens noch, wo du herkommst?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. Und deshalb hast du dich auf den Weg gemacht. Wer bist du eigentlich?
	};
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ich bin ein Abenteurer aus dem Süden...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ich bin ein ehemaliger Gefangener...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Ich bin ein ehemaliger Gefangener der Strafkolonie von Khorinis.
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Und, gibst du mir jetzt deinen Segen?",dia_vatras_influence_repeat);
	Vatras_Third = TRUE;
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Ich bin ein Abenteurer aus dem Süden ...
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Und, gibst du mir jetzt deinen Segen?",dia_vatras_influence_repeat);
	Vatras_Third = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Und, gibst du mir jetzt deinen Segen?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Gut, fassen wir mal zusammen:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Du bist ein ehemaliger Gefangener, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Du bist also ein Abenteurer aus dem Süden ...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... der von Xardas, dem Dämonenbeschwörer, erzählt bekommen hat, ...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... der irgendwo aufgeschnappt hat ...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... dass Drachen gekommen sind, um das Land zu erobern.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... dass bald schreckliche Dinge geschehen werden.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//Und du bist gekommen, um den Paladinen davon zu berichten ...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Das hört sich alles sehr abenteuerlich an, aber ich kann nicht erkennen, dass du mich anlügst.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Daher muss ich annehmen, dass deine Beweggründe ehrlich sind.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Gehe mit dem Segen Adanos, mein Sohn!
		Snd_Play("LevelUp");
		B_GivePlayerXP(XP_VatrasTruth);
		Vatras_Segen = TRUE;
		B_LogEntry(TOPIC_Thorben,TOPIC_Thorben_1);
	}
	else if(Vatras_Chance == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Ich glaube du verschweigst mir etwas.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Falls du Sorge haben solltest, daß ich das, was du mir erzählst weitergebe, so kann ich dich beruhigen.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Ich habe geschworen, alle Geheimnisse, die mir anvertraut wurden, für mich zu behalten.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//Und was ist mit den ganzen Leuten hier?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Sie verstehen nur die Hälfte von dem, was ich ihnen PREDIGE. Mach dir also keine Sorgen.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Fangen wir also noch einmal von vorne an. Was ist das für eine Botschaft?
		Vatras_Chance = TRUE;
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Es sind Drachen gekommen... ",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Es werden bald schreckliche Dinge passieren.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	}
	else if(Vatras_Chance == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
	};
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Wo finde ich einen Geweihten Innos'?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((Vatras_Segen == TRUE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Wo finde ich einen Geweihten Innos'?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Am besten schaust du mal am Marktplatz vorbei. Dort wirst du einen Abgesandten des Klosters finden.
};


instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Ich will Adanos etwas spenden!";
};


func int DIA_Vatras_Spende_Condition()
{
	return TRUE;
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Ich will Adanos etwas spenden!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Eine Spende an die Kirche Adanos würde einen Teil der Sünden, die du bis jetzt auf dich geladen haben magst, mindern, mein Sohn.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Wie viel kannst du geben?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Ich habe zur Zeit nichts übrig...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Ich habe 50 Goldstücke.",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Ich habe 100 Goldstücke.",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Ich habe zurzeit nichts übrig ...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Das ist nicht schlimm, du kannst deinen guten Willen auch später noch in die Tat umsetzen, mein Sohn.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Ich habe 50 Goldstücke ...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Ich danke dir im Namen Adanos, mein Sohn. Dein Gold wird unter den Bedürftigen verteilt werden.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Ich habe 100 Goldstücke ...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Ich segne dich im Namen Adanos für diese großzügige Tat!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Möge der Weg, den du einschlägst, unter dem Segen Adanos stehen!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Segen = TRUE;
	Info_ClearChoices(DIA_Vatras_Spende);
	if(MIS_Thorben_GetBlessings == LOG_Running)
	{
		B_LogEntry(TOPIC_Thorben,TOPIC_Thorben_1);
	};
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Kannst du mir etwas über die Magie beibringen?";
};


func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Kannst du mir etwas über die Magie beibringen?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Nur den Erwählten Innos und den Erwählten Adanos ist es gestattet, Runenmagie zu wirken.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Aber auch gewöhnliche Sterbliche können Magie mit Hilfe von Spruchrollen wirken.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Ich kann dir zeigen, wie du deine magischen Kräfte kanalisieren und erweitern kannst.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,TOPIC_CityTeacher_19);
};


instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Ich will meine magischen Kräfte steigern.";
};


func int DIA_Vatras_Teach_Condition()
{
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Ich will meine magischen Kräfte steigern.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Deine magische Kraft ist über mein Lehrverständnis hinausgewachsen.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,50);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,50);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};


instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Erzähl mir über die Götter";
};


func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Erzähl mir über die Götter.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Was genau möchtest du wissen?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Erzähl mir über Innos.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Also gut. (predigt) Innos ist der erste und oberste Gott. Er schuf die Sonne und die Welt.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Er gebietet über Licht und Feuer, die seine Geschenke an die Menschen sind. Er ist Gesetz und Gerichtsbarkeit.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Seine Priester sind die Magier des Feuers, die Paladine seine Streiter.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Erzähl mir über Adanos.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos ist der Gott der Mitte. Er ist die Waagschale der Gerechtigkeit, der Hüter des Gleichgewichts zwischen Innos und Beliar.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Er gebietet über die Kraft der Veränderung, sein Geschenk ist das Wasser in allen Meeren, Flüssen und Seen.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Seine Priester sind die Magier des Wassers, so wie auch ich ein Diener und Priester von Adanos bin.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Erzähl mir über Beliar.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar ist der finstere Gott des Todes, der Zerstörung und alles Widernatürlichen.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Er liegt im ewigen Kampf mit Innos, doch Adanos bewahrt das Gleichgewicht zwischen den beiden.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Nur wenige Menschen folgen Beliars Ruf - doch denen, die es tun, verleiht er große Stärke.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Kannst du mich heilen?";
};


func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Kannst du mich heilen?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(andächtig) Adanos segne diesen Körper. Befreie ihn von seinen Wunden und stärke ihn mit neuem Leben.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Du bedarfst zurzeit nicht der heilenden Magie.
	};
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Gut. Dann mache dich nun auf den Weg zu Meister Isgaroth.
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Ich habe eine Botschaft für Meister Isgaroth. Er ist der Wächter des Schreins vor dem Kloster.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Wenn du diesen Weg für mich gehst, kannst du deine Belohnung selber wählen.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Such dir einen anderen Laufburschen, alter Mann!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Ich mach's. ",DIA_Vatras_MISSION_YES);
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Ich mach's.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Gut, dann nimm die Botschaft und wähle eine dieser Spruchrollen.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Wenn du die Botschaft überbracht hast, werde ich dich angemessen entlohnen.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,TOPIC_Botschaft_1);
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Ich nehme den Lichtzauber",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Ich wähle die Heilung",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Gib mir den Eispfeil",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//Such dir einen anderen Laufburschen, alter Mann!
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Ich wähle die Heilung.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Gib mir den Eispfeil.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Ich nehme den Lichtzauber.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Ich habe die Botschaft überbracht";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Ich habe die Botschaft überbracht.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Sei bedankt dafür. Dann wähle nun deinen Lohn.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 Pflanze Kronstöckl",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Ring der Gewandtheit",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"1 Erzbrocken",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Hört zu, Leute! Ich werde woanders gebraucht.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Es wird nicht lange dauern. Sobald ich zurückkehre, werde ich euch die Geschichte weitererzählen.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Ich weiß nicht, ob ich zurückkommen werde. Wenn ihr wissen wollt, wie die Geschichte ausgeht, lest es in den alten Schriften nach.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Möge Adanos mit euch sein!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE;
};


instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 32;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Das Auge Innos ist zerbrochen.";
};


func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Pyrokar schickt mich.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Xardas schickt mich.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Das Auge Innos' ist zerbrochen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Ich weiß. Ich habe es schon von einigen aufgebrachten Novizen erfahren.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Die Suchenden haben den Sonnenkreis der Feuermagier dazu benutzt, um das Auge Innos zu zerstören.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Einen gelungenen Schachzug des Gegners würde ich das nennen.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Nachrichten verbreiten sich schnell in dieser Stadt.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Warum hat mich Pyrokar gerade zu dir geschickt?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Was soll nun mit dem Auge geschehen?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Was soll nun mit dem Auge geschehen?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Wir müssen es wieder zusammenfügen. Aber das ist keine leichte Aufgabe, fürchte ich.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Die Fassung ist in zwei Teile zerbrochen. Dies vermag ein geschickter Schmied wieder zu richten.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Aber das ist eigentlich nicht die Schwierigkeit dabei. Vielmehr macht mir der eingelassene Edelstein Sorgen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Er ist matt und kraftlos. Der Feind scheint genau gewusst zu haben, wie man ihn schwächt.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Wo finde ich einen Schmied, der die Fassung reparieren kann?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Wie erhält der Edelstein seine Kraft zurück?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Wie erhält der Edelstein seine Kraft zurück?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Ich sehe nur einen Weg. Eine Vereinigung der drei herrschenden Gottheiten sollte den gewünschten Effekt erzielen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Ein gut vorbereites Umkehrritual an dem Ort seiner Zerstörung wird dem Edelstein wieder Feuer geben.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Das Problem dabei ist allerdings, dass du jeweils einen irdischen Vertreter von jedem der drei Götter zu diesem Ort bringen musst.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Des weiteren bräuchte man eine Menge Sumpfkraut für dieses Ritual. Ich schätze, 3 Krautpflanzen müssten es schon sein.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Wer könnten diese drei irdischen Vertreter der Götter sein?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Wo würde ich dieses Sumpfkraut finden?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Wo würde ich dieses Sumpfkraut finden?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Ich habe da etwas von einer alten Giftmischerin namens Sagitta in den Wäldern gehört. Sie soll angeblich solches Kraut verkaufen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Du könntest dein Glück aber auch unten am Hafen versuchen.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Wer könnten diese drei irdischen Vertreter der Götter sein?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Für den Gott Adanos werde ich mich zur Verfügung stellen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, der oberste Feuermagier, wäre der Richtige, um den Gott Innos zu vertreten.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Aber für Beliar fällt mir kein geeigneter Bewerber ein. Es müsste jemand sein, der die schwarze Magie beherrscht.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Schwarze Magie? Was ist mit Xardas?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Schwarze Magie? Was ist mit Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Das ist es. Das könnte funktionieren.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Doch frage ich mich, wie du uns alle drei zusammenbringen willst.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Ich sehe doch jetzt schon Pyrokars Gesicht, wenn er hört, dass er mit Xardas an einem Strang ziehen soll.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Ich muß los.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Wo finde ich einen Schmied, der die Fassung des Auges reparieren kann?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Frage in den umliegenden Gebieten nach einem, der sich auf das Reparieren von Kleinoden versteht.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Warum hat mich Pyrokar gerade zu dir geschickt?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Ich habe geahnt, dass so etwas früher oder später geschehen würde.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar fühlt sich immer so unverletzbar und erhaben, dass es schon fast an Leichtsinn grenzt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Daher waren seine Vorsichtsmaßnahmen, das Auge zu schützen, auch so nachlässig.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Ich denke einfach, dass er sich unterbewusst auf meine Fähigkeiten verlässt, die mir Adanos Macht verleiht.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Gar nicht auszudenken, was passieren würde, wenn ich jetzt nicht zur Stelle wäre.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Nachrichten verbreiten sich schnell in dieser Stadt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Das ist auch gut so. Der Feind wird genauso wenig schlafen.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Ich muss los.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Ich werde ebenfalls aufbrechen und am Sonnenkreis die Zeremonie vorbereiten.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Schicke Xardas und Pyrokar dorthin. Und vergiss nicht, das Sumpfkraut mitzubringen. Ich verlass mich auf dich.
	B_LogEntry(TOPIC_INNOSEYE,TOPIC_INNOSEYE_3);
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	B_Vatras_GeheWeg(kurz);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};


instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Wie steht's ums Auge Innos'?";
};


func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Wie steht's ums Auge Innos'?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Denke daran: Nur ein Umkehrritual am Sonnenkreis zusammen mit Xardas und Pyrokar wird das Auge wieder heilen.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//Und vergiss nicht, das Auge mit der reparierten Fassung mitzubringen.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Ich habe alles erledigt, was du mir aufgetragen hast.";
};


func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Ich habe alles erledigt, was du mir aufgetragen hast. Hier hast du das reparierte Auge.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Tatsächlich fehlt nun nichts mehr, um das Umkehrritual zu vollziehen.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//Was ist mit dem Sumpfkraut?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ach ja. Hast du denn 3 Sumpfkrautpflanzen dabei?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ähm. Ja. Hier hast du die 3 Pflanzen.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Großartig.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Nein. Leider nicht.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Na schön. Dann muss es eben ohne gehen.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Das hast du gut gemacht, doch trete nun beiseite, damit wir mit der Zeremonie beginnen können. Möge sich unser Geist vereinen.
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};


func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Es ist vollbracht. Es ist uns gelungen, den Plan des Feindes zu vereiteln und das Auge wieder zu heilen.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Lass dir den Umgang mit seiner Macht von Pyrokar erklären.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Ich hoffe, ich werde dich wiedersehen, wenn du deine Aufgabe erledigt hast. Leb wohl.
	B_LogEntry(TOPIC_INNOSEYE,TOPIC_INNOSEYE_4);
	AI_StopProcessInfos(self);
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
	B_StartOtherRoutine(VLK_421_Valentino,"START");
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Danke für deine Hilfe, das Auge Innos' zu heilen. ";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Danke für deine Hilfe, das Auge Innos' zu heilen.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Sei nicht so verschwenderisch mit deinem Dank. Deine größte Aufgabe liegt noch vor dir.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Sprich mit Pyrokar, er wird dir alles Weitere erklären.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Ich hoffe, ich sehe dich heil wieder, mein Sohn.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Lobarts Frau Hilda ist krank.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobarts Frau Hilda ist krank.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Was denn? Schon wieder? Die gute Frau sollte ein bisschen mehr Acht auf sich geben.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Ein harter Winter und sie weilt nicht mehr bei uns. Na schön, ich werde ihr ein fiebersenkendes Mittel geben.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Ach, weißt du, da du gerade schon einmal da bist, kannst du es ihr auch vorbeibringen.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Ich trage so ein beklemmendes Gefühl in mir.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Ich trage so ein beklemmendes Gefühl in mir.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Du siehst auch nicht gesund aus. Du bist dem schwarzen Blick der Suchenden zu lange ausgesetzt gewesen.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Ich bin kann nur dein Fleisch heilen, doch deine Seele kann dir nur das Kloster reinigen. Sprich mit Pyrokar. Er wird dir helfen.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Die Drachen werden keinen Schaden mehr anrichten.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Die Drachen werden keinen Schaden mehr anrichten.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Ich wusste, dass du heil zurückkehren würdest. Doch die größte Hürde wirst du noch nehmen müssen.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Ich weiß.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Dann rüste dich gut und komm zu mir, wenn du Hilfe brauchst. Trage das Auge Innos immer bei dir, hörst du? Adanos segne dich.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Ich kenne den Standort unseres Feindes.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Ich kenne den Standort unseres Feindes.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Dann lass uns keine Zeit verlieren und ihn aufsuchen, bevor er zu uns kommt.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Du willst mich begleiten?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Ich habe lange darüber nachgedacht und bin mir meiner Sache noch nie so sicher gewesen, mein Freund.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,Topic_Crew_8);
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Ich habe schon zu viel auf meiner Liste. Ich fürchte, ich habe keinen Platz mehr für dich.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Dann schaffe Platz. Du wirst mich brauchen.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Ich werde mir das noch mal überlegen.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Es ist mir eine Ehre, dich an meiner Seite zu wissen.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Es ist mir eine Ehre, dich an meiner Seite zu wissen. Wir werden uns im Hafen treffen.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Lass dir nicht zuviel Zeit. Der Feind schläft nicht, mein Freund.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Ich werde mir das noch mal überlegen.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Wie du willst. Komm zu mir zurück, wenn dein Sinn sich wandelt.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Du bleibst besser hier. Die Stadt braucht dich.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Du bleibst besser hier. Die Stadt braucht dich.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Vielleicht hast du Recht. Und trotzdem ich werde dich begleiten, wenn du es wünschst. Das weißt du.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Begleite mich zur Insel des Feindes.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Begleite mich zur Insel des Feindes.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Eine weise Entscheidung. Ich hoffe, es bleibt jetzt dabei.
	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(lang);
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

