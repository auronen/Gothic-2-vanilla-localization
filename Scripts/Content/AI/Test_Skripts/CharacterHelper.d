
instance MobsiBrief(C_Item)
{
	name = "MobsiBrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseMobsiBrief;
	scemeName = "MAP";
	description = "MobsiBrief";
};


func void UseMobsiBrief()
{
	var int nDocID;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"StandardBrief");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jetzt wird alles wieder gut");
	Doc_PrintLines(nDocID,0,"PLAYER_MOBSI_PRODUCTION	=	MOBSI_NONE;");
	Doc_PrintLines(nDocID,0,"self.aivar[AIV_INVINCIBLE]=FALSE;");
	Doc_Show(nDocID);
};


instance CH(Npc_Default)
{
	name = "Characterhelper";
	guild = GIL_NONE;
	id = 0;
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
	daily_routine = Rtn_Start_0;
};


func void Rtn_Start_0()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"XXX");
	TA_Stand_ArmsCrossed(23,0,8,0,"XXX");
};

func void B_SetHeroExp()
{
	var string Attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + (10 * hero.level);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Attributes = "Level Up!  Lernpunkte:";
	Attributes = ConcatStrings(Attributes,IntToString(hero.lp));
	Attributes = ConcatStrings(Attributes,"  Hitpoints:");
	Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(Attributes,-1,-1,FONT_Screen,3);
	Snd_Play("LEVELUP");
};


instance CH_Exit(C_Info)
{
	npc = ch;
	nr = 999;
	condition = CH_Exit_Condition;
	information = CH_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int CH_Exit_Condition()
{
	return TRUE;
};

func void CH_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance CH_RESET(C_Info)
{
	npc = ch;
	nr = 990;
	condition = CH_RESET_Condition;
	information = CH_RESET_Info;
	description = "Totaler Reset";
};


func int CH_RESET_Condition()
{
	return TRUE;
};

func void CH_RESET_Info()
{
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	hero.lp = 0;
	hero.level = 0;
	hero.exp = 0;
	hero.attribute[ATR_STRENGTH] = 10;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.attribute[ATR_MANA_MAX] = 5;
	hero.attribute[ATR_MANA] = 5;
	hero.attribute[ATR_HITPOINTS] = 40;
	hero.attribute[ATR_HITPOINTS_MAX] = 40;
	Npc_SetTalentSkill(hero,NPC_TALENT_SMITH,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_BOW,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_CROSSBOW,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_1H,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_2H,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	AI_UnequipArmor(hero);
	PrintScreen("PC_Hero wieder hergestellt",-1,-1,FONT_Screen,2);
};


instance CH_VLIPPER(C_Info)
{
	npc = ch;
	nr = 990;
	condition = ch_vlipper_condition;
	information = ch_vlipper_info;
	description = "Hoshi's LP Vlipperei";
};


func int ch_vlipper_condition()
{
	if(!(hero.level > 0))
	{
		return TRUE;
	};
};

func void ch_vlipper_info()
{
	hero.lp = hero.lp + 5000;
	PrintScreen("LP + 5000",-1,-1,FONT_Screen,2);
};

func void B_SetPaladinEquipment()
{
	CreateInvItems(hero,ItRu_PalLight,1);
	CreateInvItems(hero,ItRu_PalLightHeal,1);
	CreateInvItems(hero,ItRu_PalHolyBolt,1);
	CreateInvItems(hero,ItRu_PalMediumHeal,1);
	CreateInvItems(hero,ItRu_PalRepelEvil,1);
	CreateInvItems(hero,ItRu_PalFullHeal,1);
	CreateInvItems(hero,ItRu_PalDestroyEvil,1);
	CreateInvItems(hero,ItRu_PalTeleportSecret,1);
};


instance CH_Guild(C_Info)
{
	npc = ch;
	condition = CH_Guild_Condition;
	information = CH_Guild_Info;
	important = 0;
	permanent = 1;
	description = "Gildenwahl";
};


func int CH_Guild_Condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void CH_Guild_Info()
{
	Info_ClearChoices(CH_Guild);
	Info_AddChoice(CH_Guild,"BACK",CH_Guild_BACK);
	Info_AddChoice(CH_Guild,"Novize",ch_nov);
	Info_AddChoice(CH_Guild,"KDF",ch_kdf);
	Info_AddChoice(CH_Guild,"Söldner",ch_sld);
	Info_AddChoice(CH_Guild,"Drachenjäger",ch_djg);
	Info_AddChoice(CH_Guild,"Miliz",ch_mil);
	Info_AddChoice(CH_Guild,"Paladin",ch_pal);
	Info_AddChoice(CH_Guild,"None",ch_none);
};

func void CH_Guild_BACK()
{
	Info_ClearChoices(CH_Guild);
};

func void ch_nov()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	CreateInvItem(hero,ItAr_NOV_L);
	AI_EquipArmor(hero,ItAr_NOV_L);
};

func void ch_kdf()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	CreateInvItem(hero,ItAr_KDF_L);
	AI_EquipArmor(hero,ItAr_KDF_L);
};

func void ch_sld()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_SLD;
	Npc_SetTrueGuild(other,GIL_SLD);
	CreateInvItem(hero,itar_sld_M);
	AI_EquipArmor(hero,itar_sld_M);
};

func void ch_djg()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_DJG;
	Npc_SetTrueGuild(other,GIL_DJG);
	CreateInvItem(hero,itar_djg_m);
	AI_EquipArmor(hero,itar_djg_m);
};

func void ch_mil()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_MIL;
	Npc_SetTrueGuild(other,GIL_MIL);
	CreateInvItem(hero,ITAR_Mil_L);
	AI_EquipArmor(hero,ITAR_Mil_L);
};

func void ch_pal()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	CreateInvItem(hero,ItAr_PAL_M);
	AI_EquipArmor(hero,ItAr_PAL_M);
	B_SetPaladinEquipment();
};

func void ch_none()
{
	Info_ClearChoices(CH_Guild);
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	AI_UnequipArmor(hero);
};

func void B_SetHeroWeapon()
{
	if(hero.level <= 6)
	{
		CreateInvItems(hero,ItRw_Crossbow_L_01,1);
	}
	else if(hero.level <= 12)
	{
		CreateInvItems(hero,ItRw_Bow_L_04,1);
		CreateInvItems(hero,ItRw_Crossbow_L_02,1);
	}
	else if(hero.level <= 18)
	{
		CreateInvItems(hero,ItRw_Bow_M_02,1);
		CreateInvItems(hero,ItRw_Crossbow_M_02,1);
	}
	else if(hero.level <= 24)
	{
		CreateInvItems(hero,ItRw_Bow_M_04,1);
		CreateInvItems(hero,ItRw_Crossbow_H_01,1);
	}
	else if(hero.level <= 30)
	{
		CreateInvItems(hero,ItRw_Bow_H_02,1);
		CreateInvItems(hero,ItRw_Crossbow_H_02,1);
	}
	else if(hero.level <= 36)
	{
		CreateInvItems(hero,ItRw_Bow_H_04,1);
		CreateInvItems(hero,ItRw_Bow_L_04,1);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
};

func void B_SetHeroEquipment()
{
	CreateInvItems(hero,ItRw_Arrow,100);
	CreateInvItems(hero,ItRw_Bolt,100);
	CreateInvItems(hero,ItLsTorch,30);
	CreateInvItems(hero,ItMi_Gold,500);
	CreateInvItems(hero,ItPo_Health_03,5);
	CreateInvItems(hero,ItPo_Mana_03,5);
	CreateInvItems(hero,ItKE_lockpick,30);
};

func void B_SetKDFRunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		CreateInvItems(hero,ItRu_Light,1);
		CreateInvItems(hero,ItRu_FireBolt,1);
		CreateInvItems(hero,ItRu_LightHeal,1);
		CreateInvItems(hero,ItRu_SumGobSkel,1);
		CreateInvItems(hero,ItRu_Zap,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		CreateInvItems(hero,ItRu_InstantFireball,1);
		CreateInvItems(hero,ItRu_Icebolt,1);
		CreateInvItems(hero,ItRu_SumWolf,1);
		CreateInvItems(hero,ItRu_Windfist,1);
		CreateInvItems(hero,ItRu_Sleep,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		CreateInvItems(hero,ItRu_MediumHeal,1);
		CreateInvItems(hero,ItRu_Firestorm,1);
		CreateInvItems(hero,ItRu_ThunderBall,1);
		CreateInvItems(hero,ItRu_SumSkel,1);
		CreateInvItems(hero,ItRu_Fear,1);
		CreateInvItems(hero,ItRu_IceCube,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		CreateInvItems(hero,ItRu_SumGol,1);
		CreateInvItems(hero,ItRu_HarmUndead,1);
		CreateInvItems(hero,ItRu_LightningFlash,1);
		CreateInvItems(hero,ItRu_ChargeFireball,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		CreateInvItems(hero,ItRu_Pyrokinesis,1);
		CreateInvItems(hero,ItRu_IceWave,1);
		CreateInvItems(hero,ItRu_SumDemon,1);
		CreateInvItems(hero,ItRu_FullHeal,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		CreateInvItems(hero,ItRu_Firerain,1);
		CreateInvItems(hero,ItRu_BreathOfDeath,1);
		CreateInvItems(hero,ItRu_MassDeath,1);
		CreateInvItems(hero,ItRu_ArmyOfDarkness,1);
		CreateInvItems(hero,ItRu_Shrink,1);
	};
};


instance CH_LEVEL(C_Info)
{
	npc = ch;
	condition = ch_level_condition;
	information = ch_level_info;
	description = "Level Wahl";
	permanent = TRUE;
};


func int ch_level_condition()
{
	if(!Npc_KnowsInfo(hero,ch_vlipper) && (hero.level == 0))
	{
		return TRUE;
	};
};

func void ch_level_info()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level  1 -  5",CH_Level1);
	Info_AddChoice(ch_level,"Level  6 - 10",CH_Level6);
	Info_AddChoice(ch_level,"Level 11 - 15",CH_Level11);
	Info_AddChoice(ch_level,"Level 16 - 20",CH_Level16);
	Info_AddChoice(ch_level,"Level 21 - 25",CH_Level21);
	Info_AddChoice(ch_level,"Level 26 - 30",CH_Level26);
};

func void CH_Level26()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level 26",CH_Level_26);
	Info_AddChoice(ch_level,"Level 27",CH_Level_27);
	Info_AddChoice(ch_level,"Level 28",CH_Level_28);
	Info_AddChoice(ch_level,"Level 29",CH_Level_29);
	Info_AddChoice(ch_level,"Level 30",CH_Level_30);
};

func void CH_Level21()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level 21",CH_Level_21);
	Info_AddChoice(ch_level,"Level 22",CH_Level_22);
	Info_AddChoice(ch_level,"Level 23",CH_Level_23);
	Info_AddChoice(ch_level,"Level 24",CH_Level_24);
	Info_AddChoice(ch_level,"Level 25",CH_Level_25);
};

func void CH_Level16()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level 16",CH_Level_16);
	Info_AddChoice(ch_level,"Level 17",CH_Level_17);
	Info_AddChoice(ch_level,"Level 18",CH_Level_18);
	Info_AddChoice(ch_level,"Level 19",CH_Level_19);
	Info_AddChoice(ch_level,"Level 20",CH_Level_20);
};

func void CH_Level11()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level 11",CH_Level_11);
	Info_AddChoice(ch_level,"Level 12",CH_Level_12);
	Info_AddChoice(ch_level,"Level 13",CH_Level_13);
	Info_AddChoice(ch_level,"Level 14",CH_Level_14);
	Info_AddChoice(ch_level,"Level 15",CH_Level_15);
};

func void CH_Level6()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level  6",CH_Level_6);
	Info_AddChoice(ch_level,"Level  7",CH_Level_7);
	Info_AddChoice(ch_level,"Level  8",CH_Level_8);
	Info_AddChoice(ch_level,"Level  9",CH_Level_9);
	Info_AddChoice(ch_level,"Level 10",CH_Level_10);
};

func void CH_Level1()
{
	Info_ClearChoices(ch_level);
	Info_AddChoice(ch_level,"BACK",ch_level_back);
	Info_AddChoice(ch_level,"Level 1",CH_Level_1);
	Info_AddChoice(ch_level,"Level 2",CH_Level_2);
	Info_AddChoice(ch_level,"Level 3",CH_Level_3);
	Info_AddChoice(ch_level,"Level 4",CH_Level_4);
	Info_AddChoice(ch_level,"Level 5",CH_Level_5);
};

func void ch_level_back()
{
	Info_ClearChoices(ch_level);
};

func void CH_Level_1()
{
	Info_ClearChoices(ch_level);
	hero.level = 1;
	hero.attribute[ATR_HITPOINTS_MAX] = 52;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_2()
{
	Info_ClearChoices(ch_level);
	hero.level = 2;
	hero.attribute[ATR_HITPOINTS_MAX] = 64;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_3()
{
	Info_ClearChoices(ch_level);
	hero.level = 3;
	hero.attribute[ATR_HITPOINTS_MAX] = 76;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_4()
{
	Info_ClearChoices(ch_level);
	hero.level = 4;
	hero.attribute[ATR_HITPOINTS_MAX] = 88;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_5()
{
	Info_ClearChoices(ch_level);
	hero.level = 5;
	hero.attribute[ATR_HITPOINTS_MAX] = 100;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_6()
{
	Info_ClearChoices(ch_level);
	hero.level = 6;
	hero.attribute[ATR_HITPOINTS_MAX] = 112;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_7()
{
	Info_ClearChoices(ch_level);
	hero.level = 7;
	hero.attribute[ATR_HITPOINTS_MAX] = 124;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_8()
{
	Info_ClearChoices(ch_level);
	hero.level = 8;
	hero.attribute[ATR_HITPOINTS_MAX] = 136;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_9()
{
	Info_ClearChoices(ch_level);
	hero.level = 9;
	hero.attribute[ATR_HITPOINTS_MAX] = 148;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_10()
{
	Info_ClearChoices(ch_level);
	hero.level = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 160;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_11()
{
	Info_ClearChoices(ch_level);
	hero.level = 11;
	hero.attribute[ATR_HITPOINTS_MAX] = 172;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_12()
{
	Info_ClearChoices(ch_level);
	hero.level = 12;
	hero.attribute[ATR_HITPOINTS_MAX] = 184;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_13()
{
	Info_ClearChoices(ch_level);
	hero.level = 13;
	hero.attribute[ATR_HITPOINTS_MAX] = 196;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_14()
{
	Info_ClearChoices(ch_level);
	hero.level = 14;
	hero.attribute[ATR_HITPOINTS_MAX] = 208;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_15()
{
	Info_ClearChoices(ch_level);
	hero.level = 15;
	hero.attribute[ATR_HITPOINTS_MAX] = 220;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_16()
{
	Info_ClearChoices(ch_level);
	hero.level = 16;
	hero.attribute[ATR_HITPOINTS_MAX] = 232;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_17()
{
	Info_ClearChoices(ch_level);
	hero.level = 17;
	hero.attribute[ATR_HITPOINTS_MAX] = 244;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_18()
{
	Info_ClearChoices(ch_level);
	hero.level = 18;
	hero.attribute[ATR_HITPOINTS_MAX] = 256;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_19()
{
	Info_ClearChoices(ch_level);
	hero.level = 19;
	hero.attribute[ATR_HITPOINTS_MAX] = 268;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_20()
{
	Info_ClearChoices(ch_level);
	hero.level = 20;
	hero.attribute[ATR_HITPOINTS_MAX] = 280;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_21()
{
	Info_ClearChoices(ch_level);
	hero.level = 21;
	hero.attribute[ATR_HITPOINTS_MAX] = 292;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_22()
{
	Info_ClearChoices(ch_level);
	hero.level = 22;
	hero.attribute[ATR_HITPOINTS_MAX] = 304;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_23()
{
	Info_ClearChoices(ch_level);
	hero.level = 23;
	hero.attribute[ATR_HITPOINTS_MAX] = 316;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_24()
{
	Info_ClearChoices(ch_level);
	hero.level = 24;
	hero.attribute[ATR_HITPOINTS_MAX] = 328;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_25()
{
	Info_ClearChoices(ch_level);
	hero.level = 25;
	hero.attribute[ATR_HITPOINTS_MAX] = 340;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_26()
{
	Info_ClearChoices(ch_level);
	hero.level = 26;
	hero.attribute[ATR_HITPOINTS_MAX] = 352;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_27()
{
	Info_ClearChoices(ch_level);
	hero.level = 27;
	hero.attribute[ATR_HITPOINTS_MAX] = 364;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_28()
{
	Info_ClearChoices(ch_level);
	hero.level = 28;
	hero.attribute[ATR_HITPOINTS_MAX] = 376;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_29()
{
	Info_ClearChoices(ch_level);
	hero.level = 29;
	hero.attribute[ATR_HITPOINTS_MAX] = 388;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};

func void CH_Level_30()
{
	Info_ClearChoices(ch_level);
	hero.level = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 400;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
	B_SetHeroEquipment();
};


instance DIA_CH_ATTRIBUTE(C_Info)
{
	npc = ch;
	nr = 1;
	condition = dia_ch_attribute_condition;
	information = dia_ch_attribute_info;
	permanent = TRUE;
	description = "Attribute steigern";
};


func int dia_ch_attribute_condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void dia_ch_attribute_info()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,"Stärke steigern",dia_ch_attribute_str);
	Info_AddChoice(dia_ch_attribute,"Geschicklichkeit steigern",dia_ch_attribute_dex);
	Info_AddChoice(dia_ch_attribute,"Mana steigern",dia_ch_attribute_mana);
};

func void dia_ch_attribute_back()
{
	Info_ClearChoices(dia_ch_attribute);
};

func void dia_ch_attribute_str()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_attribute_dex()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_attribute_mana()
{
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_strength_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_10()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_strength_str_20()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 1",B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_ch_strength_str_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 5",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_ch_strength_str_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 10",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 10),dia_ch_strength_str_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Stärke + 20",B_GetLearnCostAttribute(other,ATR_STRENGTH) * 20),dia_ch_strength_str_20);
};

func void dia_ch_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_10()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_dex_20()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 1",B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_ch_dex_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 5",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_ch_dex_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 10",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 10),dia_ch_dex_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Geschick + 20",B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 20),dia_ch_dex_20);
};

func void dia_ch_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_10()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,10,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};

func void dia_ch_mana_20()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,20,100);
	Info_ClearChoices(dia_ch_attribute);
	Info_AddChoice(dia_ch_attribute,Dialog_Back,dia_ch_attribute_back);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 1",B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_ch_mana_1);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 5",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_ch_mana_5);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 10",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 10),dia_ch_mana_10);
	Info_AddChoice(dia_ch_attribute,B_BuildLearnString("Mana + 20",B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 20),dia_ch_mana_20);
};


instance CH_TRAINING_TALENTE(C_Info)
{
	npc = ch;
	condition = ch_training_talente_condition;
	information = ch_training_talente_info;
	important = 0;
	permanent = 1;
	description = "Talente lernen";
};


func int ch_training_talente_condition()
{
	if((hero.level > 0) || Npc_KnowsInfo(hero,ch_vlipper))
	{
		return TRUE;
	};
};

func void ch_training_talente_info()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,"Alles Kampf",ch_training_talente_fight);
	Info_AddChoice(ch_training_talente,"Magische Kreise",ch_training_talente_circles);
	Info_AddChoice(ch_training_talente,"Diebesfähigkeiten",ch_training_talente_thief);
	Info_AddChoice(ch_training_talente,"Schmieden - Glut und Stahl",ch_training_talente_smith);
	Info_AddChoice(ch_training_talente,"Alchimie - Die Kunst der Tränke",ch_training_talente_alchimie);
	Info_AddChoice(ch_training_talente,"Runen basteln (Workshop)",ch_training_talente_runes);
	Info_AddChoice(ch_training_talente,"Animal Trophys ",ch_training_talente_trophy);
};

func void ch_training_talente_back()
{
	Info_ClearChoices(ch_training_talente);
};

func void ch_training_talente_fight()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H)),CH_Training_Combat_1H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 20),CH_Training_Combat_1H_20);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H)),CH_Training_Combat_2H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 20),CH_Training_Combat_2H_20);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW)),CH_Training_Combat_BOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 20),CH_Training_Combat_BOW_20);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW)),CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 20),CH_Training_Combat_CROSSBOW_20);
};

func void ch_training_talente_circles()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("1. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("2. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("3. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("4. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("5. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("6. Kreis der Magie",B_GetLearnCostTalent(other,NPC_TALENT_MAGE)),ch_training_mage_circle_6);
	};
};

func void ch_training_talente_thief()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Schlösser knacken",B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK)),CH_Training_Thief_Picklock);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Taschendiebstahl",B_GetLearnCostTalent(other,NPC_TALENT_PICKPOCKET)),CH_Training_Thief_Pickpocket);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Schleichen		",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK)),CH_Training_Thief_Sneak);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Akrobatik		",B_GetLearnCostTalent(other,NPC_TALENT_ACROBAT)),ch_training_thief_acrobat);
	};
};

func void ch_training_talente_smith()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Common lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("1hSpecial1 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_1hSpecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("2hSpecial1 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_2hSpecial1);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("1hSpecial2 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_1hSpecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("2hSpecial2 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_2hSpecial2);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("1hSpecial3 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_1hSpecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("2hSpecial3 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_2hSpecial3);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("1hSpecial4 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_1hSpecial4);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("2hSpecial4 lernen ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH)),CH_Training_Smith_2hSpecial4);
	};
};

func void ch_training_talente_alchimie()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Heiltrank 1",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Health_01);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Heiltrank 2",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Health_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Heiltrank 3",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Manatrank 1",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Mana_01);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Manatrank 2",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Mana_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Manatrank 3",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Speed ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("STR",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Perm_STR);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("DEX",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Perm_DEX);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Perm_Mana",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Perm_Mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Perm_Health",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_POTION_Perm_Health);
	};
	if(PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Auge aufladen",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY)),CH_Training_Alchemy_Charge_InnosEye);
	};
};

func void ch_training_talente_runes()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,"Paladin-Runen",ch_training_runen_paladin);
	Info_AddChoice(ch_training_talente," Erster Kreis",ch_training_runen_circle_1);
	Info_AddChoice(ch_training_talente," Zweiter Kreis",ch_training_runen_circle_2);
	Info_AddChoice(ch_training_talente," Dritter Kreis",ch_training_runen_circle_3);
	Info_AddChoice(ch_training_talente," Vierter Kreis",ch_training_runen_circle_4);
	Info_AddChoice(ch_training_talente," Fünfter Kreis",ch_training_runen_circle_5);
	Info_AddChoice(ch_training_talente," Sechster Kreis",ch_training_runen_circle_6);
};

func void ch_training_talente_trophy()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Zähne reissen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Klauen hacken",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Fell abziehen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_Fur);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Herzen nehmen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_Heart);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Horn des Schattenläufers",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_ShadowHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Feuerzunge",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_FireTongue);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Blutfliegenstachel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_BFSting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Blutfliegenflügel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_BFWing);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Crawlerplatten nehmen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_CrawlerPlate);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Zangen rausschneiden",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_Mandibles);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Drachensnapperhorn",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_DrgSnapperHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Drachenschuppen ziehen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_DragonScale);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString("Drachenblut zapfen",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY)),CH_Training_TROPHYS_DragonBlood);
	};
};

func void CH_Training_Combat_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H)),CH_Training_Combat_1H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 20),CH_Training_Combat_1H_20);
};

func void CH_Training_Combat_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H)),CH_Training_Combat_1H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 20),CH_Training_Combat_1H_20);
};

func void CH_Training_Combat_1H_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,10,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H)),CH_Training_Combat_1H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 20),CH_Training_Combat_1H_20);
};

func void CH_Training_Combat_1H_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,20,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_1H)),CH_Training_Combat_1H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 5),CH_Training_Combat_1H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 10),CH_Training_Combat_1H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Einhand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_1H) * 20),CH_Training_Combat_1H_20);
};

func void CH_Training_Combat_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H)),CH_Training_Combat_2H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 20),CH_Training_Combat_2H_20);
};

func void CH_Training_Combat_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H)),CH_Training_Combat_2H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 20),CH_Training_Combat_2H_20);
};

func void CH_Training_Combat_2H_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,10,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H)),CH_Training_Combat_2H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 20),CH_Training_Combat_2H_20);
};

func void CH_Training_Combat_2H_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,20,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 1",B_GetLearnCostTalent(other,NPC_TALENT_2H)),CH_Training_Combat_2H_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 5",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 5),CH_Training_Combat_2H_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 10",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 10),CH_Training_Combat_2H_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Zweihand-Waffen + 20",B_GetLearnCostTalent(other,NPC_TALENT_2H) * 20),CH_Training_Combat_2H_20);
};

func void CH_Training_Combat_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW)),CH_Training_Combat_BOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 20),CH_Training_Combat_BOW_20);
};

func void CH_Training_Combat_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW)),CH_Training_Combat_BOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 20),CH_Training_Combat_BOW_20);
};

func void CH_Training_Combat_BOW_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,10,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW)),CH_Training_Combat_BOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 20),CH_Training_Combat_BOW_20);
};

func void CH_Training_Combat_BOW_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,20,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 1",B_GetLearnCostTalent(other,NPC_TALENT_BOW)),CH_Training_Combat_BOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 5",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 5),CH_Training_Combat_BOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 10",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 10),CH_Training_Combat_BOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Bogen + 20",B_GetLearnCostTalent(other,NPC_TALENT_BOW) * 20),CH_Training_Combat_BOW_20);
};

func void CH_Training_Combat_CROSSBOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW)),CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 20),CH_Training_Combat_CROSSBOW_20);
};

func void CH_Training_Combat_CROSSBOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW)),CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 20),CH_Training_Combat_CROSSBOW_20);
};

func void CH_Training_Combat_CROSSBOW_10()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,10,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW)),CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 20),CH_Training_Combat_CROSSBOW_20);
};

func void CH_Training_Combat_CROSSBOW_20()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,20,99);
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 1",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW)),CH_Training_Combat_CROSSBOW_1);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 5",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 5),CH_Training_Combat_CROSSBOW_5);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 10",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 10),CH_Training_Combat_CROSSBOW_10);
	Info_AddChoice(ch_training_talente,B_BuildLearnString("Armbrust + 20",B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW) * 20),CH_Training_Combat_CROSSBOW_20);
};

func void ch_training_mage_circle_1()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,1);
	B_SetKDFRunes();
};

func void ch_training_mage_circle_2()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,2);
	B_SetKDFRunes();
};

func void ch_training_mage_circle_3()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,3);
	B_SetKDFRunes();
};

func void ch_training_mage_circle_4()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,4);
	B_SetKDFRunes();
};

func void ch_training_mage_circle_5()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,5);
	B_SetKDFRunes();
};

func void ch_training_mage_circle_6()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachMagicCircle(self,other,6);
	B_SetKDFRunes();
};

func void CH_Training_Thief_Picklock()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK);
};

func void CH_Training_Thief_Pickpocket()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET);
};

func void CH_Training_Thief_Sneak()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK);
};

func void ch_training_thief_acrobat()
{
	Info_ClearChoices(ch_training_talente);
	B_TeachThiefTalent(self,other,NPC_TALENT_ACROBAT);
};

func void CH_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void CH_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void CH_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void CH_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void CH_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void CH_Training_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void CH_Training_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void CH_Training_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void CH_Training_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};

func void CH_Training_Alchemy_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void CH_Training_Alchemy_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void CH_Training_Alchemy_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void CH_Training_Alchemy_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void CH_Training_Alchemy_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void CH_Training_Alchemy_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void CH_Training_Alchemy_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void CH_Training_Alchemy_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void CH_Training_Alchemy_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void CH_Training_Alchemy_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void CH_Training_Alchemy_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void CH_Training_Alchemy_Charge_InnosEye()
{
	B_TeachPlayerTalentAlchemy(self,other,CHARGE_Innoseye);
};

func void ch_training_runen_paladin()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_PalLight] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalLight,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalLight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalLightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalLightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalHolyBolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalHolyBolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalMediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalMediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalRepelEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalRepelEvil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalFullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalFullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_PalDestroyEvil,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Paladin_SPL_PalDestroyEvil);
	};
};

func void CH_Training_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLight);
};

func void CH_Training_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalLightHeal);
};

func void CH_Training_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalHolyBolt);
};

func void CH_Training_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalMediumHeal);
};

func void CH_Training_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalRepelEvil);
};

func void CH_Training_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalFullHeal);
};

func void CH_Training_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_PalDestroyEvil);
};

func void ch_training_runen_circle_1()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_1_SPL_LIGHT);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_1_SPL_Firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_2_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_1_SPL_LightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
};

func void CH_Training_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void CH_Training_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firebolt);
};

func void ch_training_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void CH_Training_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void CH_Training_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void ch_training_runen_circle_2()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_2_SPL_InstantFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),ch_training_runen_circle_1_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_2_SPL_SummonWolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_2_SPL_WINDFIST);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_2_SPL_Sleep);
	};
};

func void CH_Training_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void ch_training_runen_circle_2_spl_zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void CH_Training_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void CH_Training_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void CH_Training_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void ch_training_runen_circle_3()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_MediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_4_SPL_ThunderBall);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_5_SPL_Firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_Fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_IceCube);
	};
};

func void CH_Training_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void CH_Training_Runen_Circle_3_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void CH_Training_Runen_Circle_3_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void CH_Training_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void CH_Training_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void CH_Training_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void ch_training_runen_circle_4()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_3_SPL_ChargeFireball);
	};
};

func void CH_Training_Runen_Circle_4_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void CH_Training_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void CH_Training_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void CH_Training_Runen_Circle_4_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void ch_training_runen_circle_5()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_4_SPL_Pyrokinesis);
	};
};

func void CH_Training_Runen_Circle_5_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void CH_Training_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void CH_Training_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void CH_Training_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void ch_training_runen_circle_6()
{
	Info_ClearChoices(ch_training_talente);
	Info_AddChoice(ch_training_talente,Dialog_Back,ch_training_talente_back);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(ch_training_talente,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES)),CH_Training_Runen_Circle_6_SPL_Shrink);
	};
};

func void CH_Training_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void CH_Training_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void CH_Training_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void CH_Training_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void CH_Training_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

func void ch_training_trophys_back()
{
	Info_ClearChoices(ch_training_talente);
};

func void CH_Training_TROPHYS_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void CH_Training_TROPHYS_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void CH_Training_TROPHYS_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};

func void CH_Training_TROPHYS_Heart()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart);
};

func void CH_Training_TROPHYS_ShadowHorn()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn);
};

func void CH_Training_TROPHYS_FireTongue()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue);
};

func void CH_Training_TROPHYS_BFSting()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing);
};

func void CH_Training_TROPHYS_BFWing()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting);
};

func void CH_Training_TROPHYS_CrawlerPlate()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles);
};

func void CH_Training_TROPHYS_Mandibles()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate);
};

func void CH_Training_TROPHYS_DrgSnapperHorn()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn);
};

func void CH_Training_TROPHYS_DragonScale()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale);
};

func void CH_Training_TROPHYS_DragonBlood()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood);
};

