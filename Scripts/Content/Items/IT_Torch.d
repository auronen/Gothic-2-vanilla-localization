
const int Value_Fackel = 2;

instance ItLsTorch(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
#if __G2A__ {
	flags = ITEM_TORCH | ITEM_MULTI;
} else {
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
}
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[3] = "Eine Fackel";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = "Brennende Fackel";
	mainflag = ITEM_KAT_NONE;
#if __G2A__ {
	flags = ITEM_TORCH;
} else {
	flags = ITEM_BURN | ITEM_TORCH;
}
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[3] = "Eine Fackel";
};

instance ItLsTorchburned(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
#if __G2A__ {
	flags = ITEM_TORCH | ITEM_MULTI;
} else {
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
}
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	text[3] = "Eine ausgebrannte Fackel";
	description = name;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
#if __G2A__ {
	flags = ITEM_TORCH;
} else {
	flags = ITEM_BURN | ITEM_TORCH;
}
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

