/// @desc
enum BATTLE_UT {
	INIT,				//prevents battle from starting right away
	CHANGE,				//prevents button pressing from overlapping
	PRE_FIGHT_DIO,		//enemy speaks, waits for input
	BOARD_TRANS,		//changes textbox
	BATTLE_START,		//bullet hell starts
	BATTLE_END,			//finish up the turn, set back to button_sel
	BUTTON_SEL,			//select main buttons
	FIGHT_SEL,			//pick which enemy
	FIGHT_CONFIRM,		//start the fight minigame
	ACT_SEL,			//pick which act
	ACT_CONFIRM,		//run the action
	ITEM_SEL,			//pick from inventory
	ITEM_CONFIRM,		//use item
	MERCY_SEL,			//pick mercy list (flee - spare)
	MERCY_CONFIRM,		//run mercy
	WIN,				//yay u won
	LOSE				//oop. you got gameover.
}
state = BATTLE_UT.INIT; //state machine variable

enum BATTLE_TEXT{					//what text is being shown?
	NARRATION,
	ENEMY_SEL,
	FIGHT_BAR
}
state_text = BATTLE_TEXT.NARRATION;

pre_fight = false;		//pre-battle cutscene?
pre_fight_frames = 1;	//frames to start the fight

event_user(0);			//init
event_user(1);			//bg
event_user(2);			//battles
event_user(3);			//enemy
event_user(4);			//text

if !pre_fight call_later(	pre_fight_frames,
							time_source_units_frames,
							function(){state = BATTLE_UT.BUTTON_SEL});

debug = true;

num = 0;