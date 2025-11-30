
prototype Mst_Default_UndeadOrcWarrior(C_Npc)
{
	name = "Untoter Ork";
	guild = GIL_UNDEADORC;
	aivar[AIV_MM_REAL_ID] = ID_UNDEADORCWARRIOR;
	level = 30;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 60;
	HitChance[NPC_TALENT_1H] = 80;
	HitChance[NPC_TALENT_2H] = 80;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_UndeadOrcWarrior()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"UOW_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance UndeadOrcWarrior(Mst_Default_UndeadOrcWarrior)
{
	B_SetVisuals_UndeadOrcWarrior();
	EquipItem(self,ItMw_2H_OrcAxe_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

