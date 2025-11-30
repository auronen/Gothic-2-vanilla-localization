
instance BAU_970_Orlan(Npc_Default)
{
	name = "Orlan";
	guild = GIL_OUT;
	id = 970;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fatbald",Face_B_Normal_Sharky,BodyTex_B,ITAR_Bau_M);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_970;
};


func void Rtn_Start_970()
{
	TA_Stand_WP(8,0,22,0,"NW_TAVERNE_IN_04");
	TA_Stand_WP(22,0,8,0,"NW_TAVERNE_IN_04");
};

func void Rtn_Wettkampf_970()
{
	TA_Stand_WP(8,0,22,0,"NW_TAVERNE");
	TA_Stand_WP(22,0,8,0,"NW_TAVERNE");
};

