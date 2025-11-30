
instance BAU_961_Gaan(Npc_Default)
{
	name = "Gaan";
	guild = GIL_OUT;
	id = 961;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Bau_Mace);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal02,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,25);
	daily_routine = Rtn_PreStart_961;
};


func void Rtn_PreStart_961()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM3_PATH_LEVELCHANGE_02");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM3_PATH_LEVELCHANGE_02");
};

func void Rtn_Start_961()
{
	TA_Stand_ArmsCrossed(8,0,22,0,"NW_FARM3_GAAN");
	TA_Stand_ArmsCrossed(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

