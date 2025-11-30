
instance J1(C_Item)
{
	name = "MIS_ReadyForChapter3 ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseJOLY_Storyhelpletter;
	scemeName = "MAP";
	description = "JOLY_Storyhelpletter";
};


func void UseJOLY_Storyhelpletter()
{
	IntroduceChapter(KapWechsel_1,KapWechsel_1_Text,"Hum_head_144_C0.tga","nosound.wav",6000);
	Wld_InsertItem(ItMi_InnosEye_Broken_Mis,"FP_TROLLAREA_RITUAL_ITEM");
};


instance J3(C_Item)
{
	name = "chapter1";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseJ3;
	scemeName = "MAP";
	description = "chapter2";
};


func void UseJ3()
{
	PrintScreen("CreateInvItems (self, Holyhammer_mis, 1);",-1,10,FONT_ScreenSmall,20);
	IntroduceChapter(KapWechsel_1,KapWechsel_1_Text,"chapter6.tga","chapter_01.wav",6000);
};


instance DJG_inserten(C_Item)
{
	name = "JOLY_Storyhelpletter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseDJG_inserten;
	scemeName = "MAP";
	description = "JOLY_Storyhelpletter";
};


func void UseDJG_inserten()
{
	B_Kapitelwechsel(4,OldWorld_Zen);
	B_InitNpcGlobals();
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	CreateInvItems(hero,ItMi_Gold,1000);
	Wld_InsertNpc(DJG_701_Bullco,"OC1");
	Wld_InsertNpc(DJG_702_Rod,"OC1");
	Wld_InsertNpc(DJG_703_Cipher,"OC1");
	Wld_InsertNpc(PC_Fighter_DJG,"OC1");
};


instance J2(C_Item)
{
	name = "TEXT_Innoseye_Setting_Repaired";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej2oly_storyhelpletter;
	scemeName = "MAP";
	description = "J2OLY_Storyhelpletter";
};


func void usej2oly_storyhelpletter()
{
	Wld_InsertItem(ItMi_InnosEye_Broken_Mis,"FP_TROLLAREA_RITUAL_ITEM");
};


instance J4(C_Item)
{
	name = "B_Kapitelwechsel(5, OLDWORLD_ZEN )";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usej4oly_storyhelpletter;
	scemeName = "MAP";
	description = name;
};


func void usej4oly_storyhelpletter()
{
	B_Kapitelwechsel(3,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(Vatras,"RitualInnosEye");
	B_StartOtherRoutine(Xardas,"RitualInnosEye");
	B_StartOtherRoutine(Pyrokar,"RitualInnosEye");
	Npc_SetRefuseTalk(Vatras,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance SH_Oldworld(Npc_Default)
{
	name = "Storyhelper Oldworld";
	guild = GIL_NONE;
	id = 9998;
	voice = 15;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,1);
	B_GiveNpcTalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_9998;
};


func void Rtn_Start_9998()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};


instance SH_Oldworld_Exit(C_Info)
{
	npc = SH_Oldworld;
	nr = 999;
	condition = SH_Oldworld_Exit_Condition;
	information = SH_Oldworld_Exit_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int SH_Oldworld_Exit_Condition()
{
	return 1;
};

func void SH_Oldworld_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO1(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO1_Condition;
	information = SH_Oldworld_INFO1_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 1";
};


func int SH_Oldworld_INFO1_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO1_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO1);
	Info_AddChoice(SH_Oldworld_INFO1,Dialog_Back,SH_Oldworld_BACK1);
	Info_AddChoice(SH_Oldworld_INFO1,"KAPITELANFANG",SH_Oldworld_KAPITEL1ANFANG);
};

func void SH_Oldworld_BACK1()
{
	Info_ClearChoices(SH_Oldworld_INFO1);
};

func void SH_Oldworld_KAPITEL1ANFANG()
{
	B_Kapitelwechsel(1,OldWorld_Zen);
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO2(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO2_Condition;
	information = SH_Oldworld_INFO2_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 2";
};


func int SH_Oldworld_INFO2_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO2_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO2);
	Info_AddChoice(SH_Oldworld_INFO2,Dialog_Back,SH_Oldworld_BACK2);
	Info_AddChoice(SH_Oldworld_INFO2,"KAPITELANFANG",SH_Oldworld_KAPITEL2ANFANG);
};

func void SH_Oldworld_BACK2()
{
	Info_ClearChoices(SH_Oldworld_INFO2);
};

func void SH_Oldworld_KAPITEL2ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	B_Kapitelwechsel(2,OldWorld_Zen);
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO3(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO3_Condition;
	information = SH_Oldworld_INFO3_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 3";
};


func int SH_Oldworld_INFO3_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO3_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO3);
	Info_AddChoice(SH_Oldworld_INFO3,Dialog_Back,SH_Oldworld_BACK3);
	Info_AddChoice(SH_Oldworld_INFO3,"KAPITELANFANG",SH_Oldworld_KAPITEL3ANFANG);
};

func void SH_Oldworld_BACK3()
{
	Info_ClearChoices(SH_Oldworld_INFO3);
};

func void SH_Oldworld_KAPITEL3ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
	B_Kapitelwechsel(3,OldWorld_Zen);
	Info_ClearChoices(SH_Oldworld_INFO3);
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO4(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO4_Condition;
	information = SH_Oldworld_INFO4_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 4";
};


func int SH_Oldworld_INFO4_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO4_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO4);
	Info_AddChoice(SH_Oldworld_INFO4,Dialog_Back,SH_Oldworld_BACK4);
	Info_AddChoice(SH_Oldworld_INFO4,"KAPITELANFANG",SH_Oldworld_KAPITEL4ANFANG);
};

func void SH_Oldworld_BACK4()
{
	Info_ClearChoices(SH_Oldworld_INFO4);
};

func void SH_Oldworld_KAPITEL4ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
	B_Kapitelwechsel(3,OldWorld_Zen);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
	B_Kapitelwechsel(4,OldWorld_Zen);
	Info_ClearChoices(SH_Oldworld_INFO4);
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO5(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO5_Condition;
	information = SH_Oldworld_INFO5_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 5";
};


func int SH_Oldworld_INFO5_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO5_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO5);
	Info_AddChoice(SH_Oldworld_INFO5,Dialog_Back,SH_Oldworld_BACK5);
	Info_AddChoice(SH_Oldworld_INFO5,"KAPITELANFANG",SH_Oldworld_KAPITEL5ANFANG);
};

func void SH_Oldworld_BACK5()
{
	Info_ClearChoices(SH_Oldworld_INFO5);
};

func void SH_Oldworld_KAPITEL5ANFANG()
{
	MIS_OLDWORLD = LOG_Running;
	CreateInvItems(hero,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;
	MIS_ScoutMine = LOG_SUCCESS;
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
	B_Kapitelwechsel(3,OldWorld_Zen);
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	CreateInvItems(hero,ItMi_InnosEye_MIS,1);
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
	B_Kapitelwechsel(4,OldWorld_Zen);
	CreateInvItems(hero,ItAt_IcedragonHeart,1);
	MIS_AllDragonsDead = TRUE;
	EnterNW_Kapitel5 = TRUE;
	B_Kapitelwechsel(5,OldWorld_Zen);
	Info_ClearChoices(SH_Oldworld_INFO5);
	AI_StopProcessInfos(self);
};


instance SH_Oldworld_INFO6(C_Info)
{
	npc = SH_Oldworld;
	condition = SH_Oldworld_INFO6_Condition;
	information = SH_Oldworld_INFO6_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 6";
};


func int SH_Oldworld_INFO6_Condition()
{
	return TRUE;
};

func void SH_Oldworld_INFO6_Info()
{
	Info_ClearChoices(SH_Oldworld_INFO6);
	Info_AddChoice(SH_Oldworld_INFO6,Dialog_Back,SH_Oldworld_BACK6);
	Info_AddChoice(SH_Oldworld_INFO6,"KAPITELANFANG",SH_Oldworld_KAPITEL6ANFANG);
};

func void SH_Oldworld_BACK6()
{
	Info_ClearChoices(SH_Oldworld_INFO6);
};

func void SH_Oldworld_KAPITEL6ANFANG()
{
	B_Kapitelwechsel(6,OldWorld_Zen);
	Info_ClearChoices(SH_Oldworld_INFO6);
	AI_StopProcessInfos(self);
};


instance Dragon_Testmodell(Mst_Default_Dragon_Fire)
{
	B_SetVisuals_Dragon_Fire();
	Npc_SetToFistMode(self);
};

instance DIA_Dragon_Testmodell_Exit(C_Info)
{
	npc = Dragon_Testmodell;
	nr = 999;
	condition = DIA_Dragon_Testmodell_Exit_Condition;
	information = DIA_Dragon_Testmodell_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Testmodell_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Testmodell_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_Dragon_Testmodell_Hello(C_Info)
{
	npc = Dragon_Testmodell;
	nr = 1;
	condition = DIA_Dragon_Testmodell_Hello_Condition;
	information = DIA_Dragon_Testmodell_Hello_Info;
	permanent = TRUE;
	description = "Quatsch mich voll";
};


func int DIA_Dragon_Testmodell_Hello_Condition()
{
	return 1;
};

func void DIA_Dragon_Testmodell_Hello_Info()
{
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(self,other,"DIA_Dragon_Testmodell_Hello_20_00");	//Du bist weit gekommen, kleiner Mensch, aber diese Halle wirst du nicht mehr lebend verlassen.
	AI_Output(other,self,"DIA_Dragon_Testmodell_Hello_15_00");	//Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

