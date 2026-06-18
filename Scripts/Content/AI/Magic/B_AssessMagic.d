
func void B_AssessMagic()
{
#if __G2A__ {
	if(Npc_GetLastHitSpellCat(self) == SPELL_BAD)
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};
} else {
	if(Npc_GetActiveSpellCat(other) == SPELL_BAD)
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};
}
#if __G2A__ {
	if((Npc_GetLastHitSpellID(self) == SPL_IceCube) || (Npc_GetLastHitSpellID(self) == SPL_IceWave))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicFreeze,0,"");
		return;
	};
} else {
	if((Npc_GetActiveSpell(other) == SPL_IceCube) || (Npc_GetActiveSpell(other) == SPL_IceWave))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MagicFreeze,0,"");
		return;
	};
}
#if __G2A__ {
	if(Npc_GetLastHitSpellID(self) == SPL_ChargeZap)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ShortZapped,0,"");
		return;
	};
} else {
	if(Npc_GetActiveSpell(other) == SPL_ChargeZap)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_ShortZapped,0,"");
		return;
	};
}
#if __G2A__ {
	if(Npc_GetLastHitSpellID(self) == SPL_Fear)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		if((self.guild < GIL_SEPERATOR_HUM) && (self.guild != GIL_KDF) && (self.guild != GIL_PAL))
		{
			AI_StartState(self,ZS_MagicFlee,0,"");
			return;
		}
		else if(self.guild > GIL_SEPERATOR_HUM)
		{
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		};
	};
} else {
	if(Npc_GetActiveSpell(other) == SPL_Fear)
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		if((self.guild < GIL_SEPERATOR_HUM) && (self.guild != GIL_KDF) && (self.guild != GIL_PAL))
		{
			AI_StartState(self,ZS_MagicFlee,0,"");
			return;
		}
		else if(self.guild > GIL_SEPERATOR_HUM)
		{
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		};
	};
}
#if __G2A__ {
	if(Npc_GetLastHitSpellID(self) == SPL_Firerain)
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MagicBurnShort,0,"");
		return;
	};
} else {
	if(Npc_GetActiveSpell(other) == SPL_Firerain)
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MagicBurnShort,0,"");
		return;
	};
}
};


const func PLAYER_PERC_ASSESSMAGIC = B_AssessMagic;
