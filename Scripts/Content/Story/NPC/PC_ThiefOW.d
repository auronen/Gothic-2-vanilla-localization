
instance PC_ThiefOW(Npc_Default)
{
	name = "Diego";
	guild = GIL_NONE;
	id = 1;
	voice = 11;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_1;
};


func void Rtn_Start_1()
{
	TA_Sit_Bench(8,0,23,0,"LOCATION_02_05");
	TA_Sit_Bench(23,0,8,0,"LOCATION_02_05");
};

func void Rtn_Tot_1()
{
	TA_Sit_Bench(8,0,23,0,"TOT");
	TA_Sit_Bench(23,0,8,0,"TOT");
};

