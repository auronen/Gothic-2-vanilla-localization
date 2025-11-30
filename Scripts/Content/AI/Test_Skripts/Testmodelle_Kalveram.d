
instance TA_Testmodell(Npc_Default)
{
	name = "TA_Testmodell";
	guild = GIL_NONE;
	id = 1500;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,0);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1500;
};


func void Rtn_Start_1500()
{
	TA_Cook_Cauldron(0,0,0,15,"WP_COOK_CAULDRON");
	TA_Pee(0,15,0,30,"WP_WASH");
	TA_Cook_Pan(0,30,0,45,"WP_COOK_PAN");
	TA_Pick_FP(0,45,1,0,"WP_PICK");
	TA_Pick_Ore(1,0,1,15,"WP_PICK_ORE");
	TA_Practice_Magic(1,15,1,30,"WP_STAND");
	TA_Potion_Alchemy(1,30,1,45,"WP_POTION_ALCHEMY");
	TA_Pray_Innos_FP(1,45,2,0,"WP_PRAY");
	TA_Pray_Innos(2,0,2,15,"WP_PRAY_INNOS_STATUE");
	TA_Practice_Sword(2,15,2,30,"WP_MOBSIS_ALLE");
	TA_Play_Lute(2,30,2,45,"WP_STAND");
	TA_Read_Bookstand(2,45,3,0,"WP_READ_BOOKSTAND");
	TA_Repair_Hut(3,0,3,15,"WP_REPAIR_HUT");
	TA_Roast_Scavenger(3,15,3,30,"WP_ROAST_SCAVENGER");
	TA_Sit_Campfire(3,30,3,45,"WP_STAND");
	TA_Sit_Bench(3,45,4,0,"WP_SIT_BENCH");
	TA_Smoke_Joint(4,0,4,15,"WP_STAND");
	TA_Sit_Chair(4,15,4,30,"WP_SIT_CHAIR");
	TA_Sit_Throne(4,30,4,45,"WP_SIT_THRONE");
	TA_Smalltalk(4,45,5,0,"WP_SMALLTALK");
	TA_Smith_Fire(5,0,5,15,"WP_SMITH_FIRE");
	TA_Smith_Anvil(5,15,5,30,"WP_SMITH_ANVIL");
	TA_Smith_Cool(5,30,5,45,"WP_SMITH_COOL");
	TA_Smith_Sharp(5,45,6,0,"WP_SMITH_SHARP");
	TA_Sleep(6,0,6,15,"WP_SLEEP");
	TA_Stand_ArmsCrossed(6,15,6,30,"WP_STAND");
	TA_Smoke_Waterpipe(6,30,6,45,"WP_SMOKE_WATERPIPE");
	TA_Stand_Guarding(6,45,7,0,"WP_STAND");
	TA_Stand_Eating(7,0,7,15,"WP_STAND");
	TA_Spit_Fire(7,15,7,30,"WP_STAND");
	TA_Stand_Drinking(7,30,7,45,"WP_STAND");
	TA_Stand_Sweeping(7,45,8,0,"WP_STAND");
	TA_Rake_FP(8,0,8,15,"WP_PICK");
	TA_Cook_Stove(8,15,8,30,"WP_COOK_STOVE");
	TA_Saw(8,30,8,45,"WP_SAW");
	TA_Pray_Innos(8,45,9,0,"WP_PRAY_INNOS_STATUE");
	TA_Pray_Innos_FP(9,0,9,15,"WP_PRAY");
	TA_Wash_FP(9,15,9,30,"WP_WASH");
	TA_Stomp_Herb(9,30,9,45,"WP_STOMP_HERB");
	TA_Pick_FP(9,45,10,15,"WP_PICK");
	TA_Pick_FP(10,15,24,0,"WP_PRAY");
};

func void Rtn_Guide_1500()
{
	TA_Guide_Player(6,0,18,0,"WP_GUIDE_PLAYER");
	TA_Guide_Player(18,0,6,0,"WP_GUIDE_PLAYER");
};

func void Rtn_Follow_1500()
{
	TA_Follow_Player(6,0,18,0,"WP_FOLLOW_PLAYER");
	TA_Follow_Player(18,0,6,0,"WP_FOLLOW_PLAYER");
};


instance DIA_TA_Testmodell_EXIT(C_Info)
{
	npc = TA_Testmodell;
	nr = 999;
	condition = DIA_TA_Testmodell_EXIT_Condition;
	information = DIA_TA_Testmodell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_TA_Testmodell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_TA_Testmodell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_TA_Testmodell_GuideStart(C_Info)
{
	npc = TA_Testmodell;
	nr = 997;
	condition = DIA_TA_Testmodell_GuideStart_Condition;
	information = DIA_TA_Testmodell_GuideStart_Info;
	permanent = TRUE;
	description = "Zeig mir den Guide_Player!";
};


func int DIA_TA_Testmodell_GuideStart_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(!Npc_IsInRoutine(self,ZS_Guide_Player))
	{
		return 1;
	};
};

func void DIA_TA_Testmodell_GuideStart_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};


instance Info_TA_Testmodell_GuideEnd(C_Info)
{
	npc = TA_Testmodell;
	nr = 998;
	condition = DIA_TA_Testmodell_GuideEnd_Condition;
	information = DIA_TA_Testmodell_GuideEnd_Info;
	permanent = TRUE;
	description = "Beende den Guide_Player!";
};


func int DIA_TA_Testmodell_GuideEnd_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(Npc_IsInRoutine(self,ZS_Guide_Player))
	{
		return 1;
	};
};

func void DIA_TA_Testmodell_GuideEnd_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance Info_TA_Testmodell_FollowStart(C_Info)
{
	npc = TA_Testmodell;
	nr = 995;
	condition = DIA_TA_Testmodell_FollowStart_Condition;
	information = DIA_TA_Testmodell_FollowStart_Info;
	permanent = TRUE;
	description = "Folge mir!";
};


func int DIA_TA_Testmodell_FollowStart_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(!Npc_IsInRoutine(self,ZS_Follow_Player))
	{
		return 1;
	};
};

func void DIA_TA_Testmodell_FollowStart_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance Info_TA_Testmodell_FollowEnd(C_Info)
{
	npc = TA_Testmodell;
	nr = 998;
	condition = DIA_TA_Testmodell_FollowEnd_Condition;
	information = DIA_TA_Testmodell_FollowEnd_Info;
	permanent = TRUE;
	description = "Hör auf mir zu folgen!";
};


func int DIA_TA_Testmodell_FollowEnd_Condition()
{
	var C_Npc Testmodell;
	Testmodell = Hlp_GetNpc(TA_Testmodell);
	if(Npc_IsInRoutine(self,ZS_Follow_Player))
	{
		return 1;
	};
};

func void DIA_TA_Testmodell_FollowEnd_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance TA_Smalltalkpartner(Npc_Default)
{
	name = "Smalltalkpartner";
	guild = GIL_NONE;
	id = 1501;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_OldBald_Jeremiah,BodyTex_N,0);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1501;
};


func void Rtn_Start_1501()
{
	TA_Smalltalk(11,0,23,0,"WP_SMALLTALK");
	TA_Smalltalk(23,0,11,0,"WP_SMALLTALK");
};

func void Startup_TA_Testlevel()
{
	Wld_InsertNpc(TA_Testmodell,"WP_SMALLTALK");
	Wld_InsertNpc(TA_Smalltalkpartner,"WP_SMALLTALK");
};


instance gold(C_Item)
{
	name = "Ein Beutel voll Gold!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGold;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGold()
{
	CreateInvItems(self,ItMi_Gold,1000);
	PrintScreen("1000 Gold erhalten.",-1,45,FONT_Screen,3);
	Snd_Play("Geldbeutel");
	PrintScreen("Cheater Malus: -100 EXP",-1,55,FONT_Screen,3);
	if(hero.exp >= 100)
	{
		hero.exp = hero.exp - 100;
	}
	else
	{
		hero.exp = 0;
	};
};


instance HOSH1(C_Item)
{
	name = "Unsterblich";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHosh1;
	scemeName = "MAP";
	description = "Setzt das Immortal Flag";
};


func void UseHosh1()
{
	self.flags = NPC_FLAG_IMMORTAL;
};


instance HOSH2(C_Item)
{
	name = "Sterblich";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHosh2;
	scemeName = "MAP";
	description = "Klaut das Immortal flag";
};


func void UseHosh2()
{
	self.flags = 0;
};


instance HOSH3(C_Item)
{
	name = "Sumpfdrache immortal klauen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehosh3;
	scemeName = "MAP";
	description = "Novizenchade SUCCESS";
};


func void usehosh3()
{
	SwampDragon = Hlp_GetNpc(Dragon_Rock);
	SwampDragon.senses_range = 4000;
};


instance Hosh4(C_Item)
{
	name = "Sumpfdrache immortal machen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tagebuch";
	text[0] = "Das Tagebuch von Hoshi";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseHoshiTagebuch;
};


func void UseHoshiTagebuch()
{
	SwampDragon = Hlp_GetNpc(Dragon_Swamp);
	SwampDragon.flags = NPC_FLAG_IMMORTAL;
};

