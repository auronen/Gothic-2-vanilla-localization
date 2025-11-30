
instance BDT_1064_Bandit_L(Npc_Default)
{
	name = NAME_Bandit;
	guild = GIL_BDT;
	id = 1064;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Normal_Orik,BodyTex_B,ITAR_Leather_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_1064;
};


func void Rtn_Start_1064()
{
	TA_Sit_Campfire(0,0,12,0,"NW_CASTLEMINE_TOWER_BEYOND");
	TA_Sit_Campfire(12,0,0,0,"NW_CASTLEMINE_TOWER_BEYOND");
};

