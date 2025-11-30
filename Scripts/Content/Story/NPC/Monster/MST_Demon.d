
prototype Mst_Default_Demon(C_Npc)
{
	name = "Dämon";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON;
	level = 60;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void B_SetVisuals_Demon()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Demon(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Summoned_Demon(Mst_Default_Demon)
{
	name = "Beschworener Dämon";
	guild = gil_summoned_demon;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_Demon1(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_Demon2(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_Demon3(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_Demon4(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

instance Xardas_DT_Demon5(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};

