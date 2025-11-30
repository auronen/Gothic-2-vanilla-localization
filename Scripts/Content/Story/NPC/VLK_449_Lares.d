
instance VLK_449_Lares(Npc_Default)
{
	name = "Lares";
	guild = GIL_NONE;
	id = 449;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	CreateInvItems(self,ItMi_Gold,100);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItPo_Health_02,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
	daily_routine = Rtn_PreStart_449;
};


func void Rtn_PreStart_449()
{
	TA_Stand_Guarding(8,0,20,0,"NW_CITY_HABOUR_02_B");
	TA_Stand_Guarding(20,0,8,0,"NW_CITY_HABOUR_02_B");
};

func void Rtn_Start_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Guide_449()
{
	TA_Guide_Player(8,0,20,0,"NW_TAVERNE_04");
	TA_Guide_Player(20,0,8,0,"NW_TAVERNE_04");
};

func void Rtn_WaitForShip_449()
{
	TA_Smalltalk(8,0,20,0,"NW_WAITFOR_SHIP_05");
	TA_Smalltalk(20,0,8,0,"NW_WAITFOR_SHIP_05");
};

func void Rtn_ShipOff_449()
{
	TA_Stand_Guarding(4,35,20,5,"NW_CITY_HABOUR_02_B");
	TA_Sit_Chair(20,5,4,35,"NW_CITY_HABOUR_TAVERN01_08");
};

func void Rtn_Ship_449()
{
	TA_Smalltalk(8,0,23,0,"SHIP_CREW_05");
	TA_Smalltalk(23,0,8,0,"SHIP_CREW_05");
};

