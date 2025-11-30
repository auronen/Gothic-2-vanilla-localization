
prototype Mst_Default_FireWaran(C_Npc)
{
	name = "Feuerwaran";
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_FIREWARAN;
	level = 21;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 210;
	attribute[ATR_HITPOINTS] = 210;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_Setvisuals_FireWaran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_ApplyOverlayMds(self,"Firewaran.mds");
	Mdl_SetVisualBody(self,"War_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance FireWaran(Mst_Default_FireWaran)
{
	B_Setvisuals_FireWaran();
	Npc_SetToFistMode(self);
};

