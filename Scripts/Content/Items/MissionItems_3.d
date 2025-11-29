
instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Auge Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[0] = "Das Auge pulsiert voller Energie";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_TProtEdge;
	self.protection[PROT_BLUNT] += AM_TProtEdge;
	self.protection[PROT_POINT] += Am_TProtPoint;
	self.protection[PROT_FIRE] += Am_TProtFire;
	self.protection[PROT_MAGIC] += Am_TProtMage;
	PrintScreen("",-1,-1,FONT_Screen,0);
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_EDGE] -= AM_TProtEdge;
	self.protection[PROT_BLUNT] -= AM_TProtEdge;
	self.protection[PROT_POINT] -= Am_TProtPoint;
	self.protection[PROT_FIRE] -= Am_TProtFire;
	self.protection[PROT_MAGIC] -= Am_TProtMage;
};


instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Auge Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	text[0] = "Das Auge ist matt und ohne Glanz";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = "Auge Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[0] = TEXT_Innoseye_Setting;
	text[1] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = "Ermächtigungsschreiben";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = "Ermächtigungsschreiben für Pyrokar";
};


func void Use_PermissionToWearInnosEye()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dem Überbringer dieses Schreiben ist Einlass in die heiligen Hallen des Klosters zu gewähren.");
	Doc_PrintLines(nDocID,0,"Seinen Wünschen, hinsichtlich der Inbesitznahme des Auges Innos ist unverzüglich nachzukommen");
	Doc_PrintLines(nDocID,0,"Diese Anweisungen sind durch Kraft meines Amtes, als Generalbevollmächtigter der Insel und des Königs, sowie durch den Beschluss über die Zweiteilung der Kirche Innos, aus dem Jahre 2 des Feuers, als berechtigt zur Kenntnis zu nehmen.");
	Doc_PrintLines(nDocID,0,"Ich werde hierzu keine weiteren Erklärungen abgeben und erwarte, dass meinen Anordnungen Folge geleistet wird.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Innos schütze den König");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Lord Hagen");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
{
	name = "Die Hallen von Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasBookForPyrokar;
};


func void Use_XardasBookForPyrokar()
{
	Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name = "Xardas Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "für die Truhe auf Sekobs Bauernhof";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = "Tagebuch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tagebuch";
	text[0] = "Das Tagebuch von Cornelius";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;
	Cornelius_IsLiar = TRUE;
	B_LogEntry(TOPIC_RescueBennet,TOPIC_RescueBennet_4);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wenn Larius so weitermacht, werde ich mich nach einer anderen Stelle umsehen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Heute Nacht ist mir etwas seltsames passiert. Einer dieser Männer in den schwarzen Kapuzenmänteln, von denen man immer hört, hat mich in meinem Haus aufgesucht. Ich war gar nicht aufgeregt, obwohl man sich nur Schreckliches von ihnen erzählt. Die Macht, die diese Männer ausstrahlen war fast körperlich zu spüren. Die Stimme dagegen, war sehr ruhig und vertrauenserweckend.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Er hat mir 20000 Goldstücke geboten, wenn ich dafür sorge, dass einer der Söldner verurteilt wird. Ich würde schon merken, wenn es soweit ist.");
	Doc_PrintLines(nDocID,1,"Ich habe natürlich sofort zugestimmt, die Söldner haben es eh verdient. Wenn sie nicht gekommen wären, würde hier alles zu meiner Zufriedenheit verlaufen. Die Goldstücke werden mir einen ruhigen Lebensabend garantieren.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Es ist soweit, sie haben einer dieser Söldner geschnappt. Es sollte ein Kinderspiel sein, mein Wort zu halten.");
	Doc_Show(nDocID);
	PrintScreen("",-1,-1,FONT_Screen,0);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = "Almanach der Bessenen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DementorObsessionBook;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_BookHeadline);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLines(nDocID,0,"edef Kon dirandorix");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"in Sparady bell ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"el utoy");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0," Kho ray xaondron");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"em piratoram endro");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_BookHeadline);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		if(Kapitel >= 3)
		{
			Doc_PrintLine(nDocID,1,"					      VINO");
			Doc_PrintLine(nDocID,1,"FERNANDO");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"		MALAK");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"BROMOR");
		};
		if(Kapitel >= 4)
		{
			Doc_PrintLine(nDocID,1,"				       ENGROM");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"		RANDOLPH");
			Doc_PrintLine(nDocID,1,"");
		};
		if(Kapitel >= 5)
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"						SEKOB");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"			BRUTUS");
			Doc_PrintLine(nDocID,1,"");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = "Pyrokars magischer Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = name;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Die Besessenen");
	Doc_SetFont(nDocID,0,FONT_Book);
	if(Kapitel >= 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"FERNANDO");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"VINO");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"MALAK");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"BROMOR");
	};
	if(Kapitel >= 4)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"ENGROM");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"RANDOLPH");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"SEKOB");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"BRUTUS");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	description = "Heilung des schwarzen Fiebers";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Gehstock";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "An seinem Kopfende";
	text[1] = "ist der Buchstabe `M` eingeschnitzt";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = "Ein Beutel voll Gold!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MalethsBanditGold()
{
	CreateInvItems(hero,ItMi_Gold,300);
	Print(PRINT_MalethBanditsGold);
	Snd_Play("Geldbeutel");
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = "Moleratfett";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = "Brief an Babo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = "Brief an Babo.";
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Lieber Babo!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Du wunderst dich bestimmt, wie wir dazu kommen dir diesen Brief zu schreiben. Wir haben alles Geld zusammengelegt und den Meister Marlas gebeten diese Zeilen hier zu schreiben. Also wir wünschen dir viel Glück auf deinem weiteren Weg und hoffen, dass du deine Freunde nicht vergisst. Als Abschiedsgeschenk haben wir die noch ein Bild eingepackt, damit du immer an uns denkst und dir die Nächte im Kloster nicht zu lang werden.");
	Doc_PrintLines(nDocID,0,"Viel Erfolg im Kloster und viel Spass mit dem Bild.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Feht und Bonka.");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Frauenzeichnung";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = "Ein Bild von einer nackten Frau";
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = "Ein Bündel Papiere";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Mehrere zusammengerollte";
	text[3] = "Dokumente";
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};


instance ItKe_IgarazChest_Mis(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Der Schlüssel für";
	text[3] = "die Truhe von Igaraz";
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = "Die göttliche Kraft der Gestirne";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
};


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;
	if(Astronomy_once == FALSE)
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 2;
		Print(Print_ReadAstronomy);
		Astronomy_once = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...wenn nun aber die Kraft des Ochsen sich vereinigt mit den Prinzipien des Kriegers, so seien alle gewarnt vor den Ereignissen, die da kommen mögen.");
	Doc_PrintLines(nDocID,0,"Die unbändige Kraft des Ochsen und die Zielstrebigkeit des Kriegers ist in der Lage das Uralte Gleichgewicht der Mächte zu erschüttern. Die kosmische Grenze zwischen den Dimension wird schwächer, so schwach, dass die Schattenkreaturen Beliars auf ein leichtes in unsere Welt überwechseln können. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Was so etwas bedeutet, zeigen uns die Kriege der vorderen Zeit, als das Band zwischen den Welten noch stärker war. Die Schergen des Bösen brachten Tod und Zerstörung über die Welt und nur mit der Hilfe Innos und seines Erwählten war es den Menschen möglich das Unheil zu besiegen. ");
	Doc_PrintLines(nDocID,1,"Wenn es jemals wieder soweit kommen mag, dann mag Innos uns schützen, denn einen Erwählten Innos hat es schon seit über hundert Jehren nicht mehr gegeben.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	description = "Heilung der Besessenheit";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	B_ClearSCObsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = "Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = "Ein Lederbeutel";
	text[0] = "";
	text[1] = "";
	text[2] = "Der Beutel ist voller Münzen";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name = "sehr alte Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_ShatteredGolem_Mis()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = "Brief von Diego";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "Diegos Brief an Gerbrandt.";
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Gerbrandt, ");
	Doc_PrintLines(nDocID,0,"du hättest mich lieber töten sollen. ");
	Doc_PrintLines(nDocID,0,"Ich bin wieder in der Stadt und auf dem Weg zu dir. Wenn ich dich finde, werde ich dir deinen fetten Wanst aufschneiden. Du kennst mich lange genug um zu wissen, dass ich mich nicht ungestraft reinlegen lasse.");
	Doc_PrintLines(nDocID,0,"Als du mich damals hast in die Barriere werfen lassen, hast du sicherlich geglaubt mich für immer los zu sein. Du hast dich geirrt. ");
	Doc_PrintLines(nDocID,0,"Ich bin bekommen mir das zu holen, was mir zusteht. ");
	Doc_PrintLines(nDocID,0,"Deine einzige Chance am leben zu bleiben ist, dich aus deinem Haus zu verpissen und mir deine Geschäfte zu überlassen. Dann sind wir quitt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Diego");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = "Prallgefüllter Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = "Diegos alter Lederbeutel";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	CreateInvItems(self,ItMi_Gold,DiegosTreasure);
	Print(Print_DiegosTreasure);
	Snd_Play("Geldbeutel");
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = "Ulthars heiliges Wasser";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


var int ItWr_MinenAnteil_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = "Erzminenanteil Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Erzminenanteil");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dem Eigentümer dieses Schreibens ist es, gemäss des königlichen Erlassess zur Gewinnung von Vermögen aus Reichsgrund, erlaubt, sich als Prospektor auf königlichem Grund und Boden zu verdingen.");
	Doc_PrintLines(nDocID,0,"Seine Schürftätigkeiten haben sich auf das Gebiet einer königlichen Reichskleinparzelle zu beschränken.");
	Doc_PrintLines(nDocID,0,"Reichskleinparzellen sind durch den Erlass zur Größe von Schürfgrund auf eine Fläche von 16 Rechtschritt, in der flächigen, und nicht mehr als 3 Schritt in der steigenden Ausdehnung definiert.");
	Doc_PrintLines(nDocID,0,"Der Reichsprospektor ist von allen Pflichten bezüglich des freien Zugangs und des Schutzes der Schürfparzellen befreit.");
	Doc_PrintLines(nDocID,0,"Ist es dem Pächter nicht möglich die fälligen Abgaben fristengerecht zu entgelten, fallen alle Rechte an Grund und Boden zurück an das Reich.");
	Doc_PrintLine(nDocID,0,"		 gezeichnet");
	Doc_PrintLine(nDocID,0,"      königlicher Prospektor");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                Salandril");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile,TOPIC_MinenAnteile_1);
		if(Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile,TOPIC_MinenAnteile_2);
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = "Seelenruf-Amulett";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[2] = "";
	text[3] = "Schützt vor dem Schwarzen Blick";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Gestein aus gesegneter Erde";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name = "Auftrag des Richters";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = name;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	SCKnowsRichterKomproBrief = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Morgahard, du Nichtsnutz! Führe meinen Befehl endlich aus, sonst werde ich andere Seiten aufziehen und ihr werdet allesamt verhaftet.");
	Doc_PrintLines(nDocID,0,"Die Sache steigt morgen Nacht. Larius wird schon misstrauisch. ");
	Doc_PrintLines(nDocID,0,"Wenn wir ihm das Geld nicht jetzt aus der Tasche ziehen, gibt es vielleicht nicht noch eine Gelegenheit dazu. Ich werde dafür sorgen, dass ihr ihn heute abend auf dem Marktplatz antreffen werdet. ");
	Doc_PrintLines(nDocID,0,"Macht aber kein Aufsehen, sonst wird euch die Miliz niederprügeln, bevor ihr noch wisst, was los ist.");
	Doc_PrintLines(nDocID,0,"Nur so nebenbei: Wenn er dabei umkommen sollte, habe ich auch nichts dagegen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"          Oberster Richter und ");
	Doc_PrintLine(nDocID,0,"          königlicher Sekretär");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich bin schon mal vorraus gegangen. Ich hoffe, wir werden uns alle in etwas ruhigeren Zeiten wieder sehen.");
	Doc_PrintLines(nDocID,0,"Keine Bange, Jungs. Wenn alle Stricke reißen, werde ich Onar bitten, die Sache für uns zu erledigen.");
	Doc_PrintLines(nDocID,0,"Es wird schon alles gut gehen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			               M.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Map_Shrine_MIS(C_Item)
{
	name = "Karte der heiligen Schreine";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = "Der Geist des Weines";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_VinosKellergeister_Mis;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Kraft der Traube");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...ich habe schon eine Menge ausprobiert, doch diese Frucht, die mir letzte Woche von Übersee geliefert wurde, übertrifft meine kühnsten Erwartungen...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...der Saft dieser Traube ist so früchtig, wie keine andere, die man in diesem Teil des Landes finden kann...");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...so weit so gut. Ich kann aber immer noch nicht den Gedanken verdrängen, hier in meiner geheimen Schnapsbrennerei erwischt zu werden. Keine Ahnung, was die mit mir machen, wenn die Miliz mich hier entdeckt, ich fürchte, dann werde ich höchstwahrscheilich in die Barriere geworfen...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...sie haben Verdacht geschöpft. Ich werde hier erst mal alles stehen und liegen lassen, bis sich die Wogen geglättet haben und werde meine Arbeit erst wieder aufnehmen, wenn ich mir sicher sein kann, dass sie mir nicht mehr folgen...");
	Doc_Show(nDocID);
};

