
var int ALchemy_1_permanent;
var int ALchemy_2_permanent;
var int ALchemy_3_permanent;

func void Use_BookstandALCHEMY1_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Tränke magischer Kraft");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_ManaPotion1);
		Doc_PrintLine(nDocID,0,"2 Feuernesseln");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_ManaPotion2);
		Doc_PrintLine(nDocID,0,"2 Feuerkräuter");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_ManaPotion3);
		Doc_PrintLine(nDocID,0,"2 Feuerwurzeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die während des Prozesses verbraucht wird.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken der Heilung oder der Stärkung der magischen Kraft, benötigt der Anwender neben der speziellen Zutat immer eine Pflanze:");
		Doc_PrintLine(nDocID,1,"Feldknöterich");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken die permanente Veränderungen des Körpers oder Geistes bewirken, benötigt der Anwender immer eine Pflanze: ");
		Doc_PrintLines(nDocID,1,"Kronstöckl");
		Doc_Show(nDocID);
		if(ALchemy_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_1_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY2_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Tränke heilender Kraft");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_HealthPotion1);
		Doc_PrintLine(nDocID,0,"2 Heilpflanzen");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_HealthPotion2);
		Doc_PrintLine(nDocID,0,"2 Heilkräuter");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_HealthPotion3);
		Doc_PrintLine(nDocID,0,"2 Heilwurzeln");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Jegliche Arbeit am Alchemietisch  erfordert eine Laborwasserflasche, die während des Prozesses verbraucht wird.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken der Heilung oder der Stärkung der magischen Kraft, benötigt der Anwender neben der speziellen Zutat immer eine Pflanze:");
		Doc_PrintLine(nDocID,1,"Feldknöterich");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Für das Brauen von Tränken die permanente Veränderungen des Körpers oder Geistes bewirken, benötigt der Anwender immer eine Pflanze: ");
		Doc_PrintLines(nDocID,1,"Kronstöckl");
		Doc_Show(nDocID);
		if(ALchemy_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_2_permanent = TRUE;
		};
	};
};

func void Use_BookstandALCHEMY3_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Tränke permanenter Veränderungen");
		Doc_PrintLine(nDocID,0,"und ihre Zutaten");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_Dex_Permanent);
		Doc_PrintLine(nDocID,0,"1 Goblin Beere");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_Speed_Potion);
		Doc_PrintLines(nDocID,0,"1 Snapperkraut - dieser Trank benötigt keinen Kronstöckl, sondern Feldknöterich");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,NAME_Str_Permanent);
		Doc_PrintLine(nDocID,0,"1 Drachenwurzel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,NAME_HealthPermanent);
		Doc_PrintLine(nDocID,0,"1 Heilwurzel");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,NAME_ManaPermanent);
		Doc_PrintLine(nDocID,0,"1 Feuerwurzel");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Das Brauen dieser Rezepturen ist die hohe Kunst der Alchemie und erfordert gewisse Vorkenntnisse. Im Allgemeinen lässt sich sagen, erst wenn jemand den sachgerechten Umgang mit der Heil- oder Feuerwurzel beherscht, ist er kundig genug, um sich an den hohen Tränken zu probieren. Ihnen allen ist zu eigen, dass sie einen Kronstöckl als Zutat verlangen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Der Trank der Geschwindigkeit ist viel einfacher herzustellen, was auch daran liegt, das man keinen Kronstöckl benötigt. Schon einfache Alchemiekenntnisse reichen aus um die Rezeptur zu verstehen.");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(ALchemy_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			ALchemy_3_permanent = TRUE;
		};
	};
};

