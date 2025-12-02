
func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Mana_03) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Mana_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_02) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Mana_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Mana_01) && ((hero.attribute[ATR_MANA_MAX] - hero.attribute[ATR_MANA]) >= Mana_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Mana_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_MANA_MAX] != hero.attribute[ATR_MANA])
		{
			if(Npc_HasItems(hero,ItPo_Mana_01))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Mana_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_02))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Mana_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Mana_03))
			{
				Npc_ChangeAttribute(hero,ATR_MANA,Mana_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Mana_03);
				B_LameSchlork();
			}
			else
			{
				Print(PRINT_NO_MANA_POTIONS);
			};
		}
		else
		{
			Print(PRINT_MANA_ALREADY_MAX);
		};
	};
};

func void player_hotkey_lame_heal()
{
	if(Npc_IsInState(hero,ZS_Dead) == FALSE)
	{
		if(Npc_HasItems(hero,ItPo_Health_03) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Elixier))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
			Npc_RemoveInvItem(hero,ItPo_Health_03);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_02) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Extrakt))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
			Npc_RemoveInvItem(hero,ItPo_Health_02);
			B_LameSchlork();
		}
		else if(Npc_HasItems(hero,ItPo_Health_01) && ((hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS]) >= HP_Essenz))
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
			Npc_RemoveInvItem(hero,ItPo_Health_01);
			B_LameSchlork();
		}
		else if(hero.attribute[ATR_HITPOINTS_MAX] != hero.attribute[ATR_HITPOINTS])
		{
			if(Npc_HasItems(hero,ItPo_Health_01))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Essenz);
				Npc_RemoveInvItem(hero,ItPo_Health_01);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_02))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Extrakt);
				Npc_RemoveInvItem(hero,ItPo_Health_02);
				B_LameSchlork();
			}
			else if(Npc_HasItems(hero,ItPo_Health_03))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,HP_Elixier);
				Npc_RemoveInvItem(hero,ItPo_Health_03);
				B_LameSchlork();
			}
			else
			{
				Print(PRINT_NO_HP_POTIONS);
			};
		}
		else
		{
			Print(PRINT_HP_ALREADY_MAX);
		};
	};
};

