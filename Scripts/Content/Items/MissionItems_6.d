
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Äußerst seltsamer Lederbeutel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[0] = "";
	text[1] = "In dem Beutel scheinen";
	text[2] = "ein harter Gegenstand ";
	text[3] = "und ein Schriftstück zu sein.";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	concatText = ConcatStrings("2",PRINT_ItemsErhalten);
	Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = "Xardas´ Ermahnungsbrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = name;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Mein junger Schützling, du hast mich bitter enttäuscht. Wie konntest nur mit dem Schiff aufbrechen, ohne das Auge Innos in deinem Gepäck?");
	Doc_PrintLines(nDocID,0,"Ich kann nur hoffen, dass deine Nachlässigkeit Grenzen hat. Sonst wirst du niemals die Welt von dem Übel dieser Welt befreien und ich werde dich persönlich töten müssen für deine Dummheit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Xardas");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = "alter Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = name;
	text[3] = "mit zittriger Schrift geschrieben";
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich habe versagt. Meine Bemühungen Inubis auf den Pfad der Rechtschaffenen zurück zu bringen waren vergebens ");
	Doc_PrintLines(nDocID,0,"Erst dachte ich, ich sei tot. Doch es steckt noch Kraft in den alten Knochen Ivans. ");
	Doc_PrintLines(nDocID,0,"Inubis ist wiederauferstanden von den Toten. Verbannt vom alten Orden der Paladine sinnt er nur noch nach Rache für seinen Fluch.");
	Doc_PrintLines(nDocID,0,"Viele seiner Anhänger sind ihm gefolgt. Ich weiß nicht, wie es passieren konnte, dass ein Feldherr wie Inubis so dem Bösen verfällt. ");
	Doc_PrintLines(nDocID,0,"In dieser Krypta habe ich sein Grab gefunden. Doch ob ich jemals einem Menschen davon berichten kann, ist nicht gewiss. Darum schreibe ich diese Zeilen in der Hoffnung, dass sie gefunden werden.");
	Doc_PrintLines(nDocID,0,"Seid gewarnt. Ein mächtiger Feind streckt seine Klauen nach den Seelen der Rechtschaffenen. Inubis wird nicht der letzte sein.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Möge Innos eure Seelen beschützen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                 Ivan");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name = "Schlüssel des Orkischen Obersts";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item)
{
	name = "Schlüssel des Archol";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name = "Schlüssel des Schlüsselmeisters";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Kammerschlüssel des Schwarzmagiers";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = "Schriftrolle des Schwarzmagiers";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = name;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Das Auge der Macht erleuchte deinen Weg");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,TOPIC_HallenVonIrdorath_2);
};


instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name = "Truhenschlüssel des Schwarzmagiers";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Key_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "Rezept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = name;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich habe eine sehr alte Kunst ins Leben zurück rufen können. Ich fürchte, dass Feodaron von meinen Ergebnissen nicht sehr erbaut wäre.");
	Doc_PrintLines(nDocID,0,"Es hieße schlicht und ergreifend, dass ich seine gesammte Brut in meinem Labor zu einem Trank verarbeiten müsste. Wenn er nicht ständig auf seinen Eiern sitzen würde, wie ein Huhn, hätte ich es schon längst ausprobiert. Aber vor seinem Odem habe ich doch noch ein wenig Respekt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Embarla Firgasto:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"10 Dracheneier, Eine zerriebene schwarze Perle und eine Prise Schwefel.");
	Doc_PrintLines(nDocID,0,"Die Emulsion wird zum kochen gebracht und anschließend unter ständigem Rühren durch den Destillator getrieben.");
	Doc_PrintLines(nDocID,0,"Das Elixier ist mit vorsicht zu verwenden. Es hat schwere Nebenwikungen. Der gesamte Manahaushalt wird durcheinander geraten.");
	Doc_Show(nDocID);
	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};


instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Tagebuch";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich warte jetzt schon geschlagene 36 Tage auf meine Einberufung. Ich glaube schon nicht mehr daran, dass sie mich aufnehmen werden. Ich habe doch schon alles getan, was sie mir aufgetragen haben. Alles habe ich ihnen hinterher getragen.");
	Doc_PrintLines(nDocID,0,"Der Schlüsselmeister hat mich angewiesen, die Gitter zu versiegeln. Ich bin bis heute noch nicht dazu gekommen. Wenn das so weiter geht, wird es noch jemand schaffen, einfach so durch das Tor zu marschieren.");
	Doc_PrintLines(nDocID,0,"Nur zu blöde, dass ich mir die Kombinationen nicht merken kann. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ich wäre schon längst einmal heimlich in der großen Halle gewesen. Ich kann es kaum erwarten, den Meister zu sehen. Ob sie mich zu ihm lassen, wenn ich erst einmal zu ihnen gehöre?");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Habe gestern mein Glück versucht. Bin aber schon an den zwei Hebelkammern gescheitert, bevor ich die drei Schalter des Westflügels in der richtigen Reihenfolge drücken konnte. Der Hund hat die Kammern abgeschlossen. Morgen werde ich versuchen, ihm den Schlüssel abzunehmen...");
	Doc_Show(nDocID);
	B_LogEntry(TOPIC_HallenVonIrdorath,TOPIC_HallenVonIrdorath_2);
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = "alter Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = name;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"   Letzte Warnung!");
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Es ist mir völlig egal, ob ihr die Brücke von der anderen Seite überqueren könnt, oder nicht. Wenn es nach mir ginge, würdet ihr sowieso alle in der Hölle schmoren.");
	Doc_PrintLines(nDocID,0,"Ich werde die Brücke eingezogen lassen, solange ich mich in meiner Residenz befinde. Wenn ich nochmal jemanden dabei erwische, dass er mit Pfeil und Bogen auf die Schalter schießt um herüber zu kommen, dann werde ich den Schützen eigenhändig am nächten Baum aufhängen.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                      Archol");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Auge der Macht";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

