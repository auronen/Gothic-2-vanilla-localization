
instance MIL_321_Rangar(Npc_Default)
{
	name = "Rangar";
	guild = GIL_MIL;
	id = 321;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	CreateInvItems(self,ItKe_City_Tower_02,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Skip,BodyTex_N,ITAR_Mil_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_321;
};


func void Rtn_Start_321()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_BEER_06");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_BEER_06");
};

