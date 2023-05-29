if (instance_place(x, y, obj_player))
{
	audio_play_sound(snd_complete, 5, 0);
	room_goto_next();	
}