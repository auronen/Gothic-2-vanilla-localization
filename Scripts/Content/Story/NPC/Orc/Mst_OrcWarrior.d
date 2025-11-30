
prototype Mst_Default_OrcWarrior(C_Npc)
{
	name = "Ork Krieger";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCWARRIOR;
	voice = 18;
	level = 25;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	HitChance[NPC_TALENT_1H] = 60;
	HitChance[NPC_TALENT_2H] = 60;
	HitChance[NPC_TALENT_BOW] = 60;
	HitChance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_OrcWarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcWarrior_Roam(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance OrcWarrior_Rest(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Harad(Mst_Default_OrcWarrior)
{
	name = "Ork Späher";
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart1(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart2(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart3(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart4(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart5(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance OrcWarrior_Lobart6(Mst_Default_OrcWarrior)
{
	B_SetVisuals_OrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_03);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

