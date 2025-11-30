
prototype Mst_Default_Draconian(C_Npc)
{
	name = "Echsenmensch";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 45;
	protection[PROT_EDGE] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 45;
	protection[PROT_MAGIC] = 15;
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

func void B_SetVisuals_Draconian()
{
	Mdl_SetVisual(self,"Draconian.mds");
	Mdl_SetVisualBody(self,"Draconian_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Draconian(Mst_Default_Draconian)
{
	B_SetVisuals_Draconian();
	EquipItem(self,ItMw_2H_OrcSword_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

