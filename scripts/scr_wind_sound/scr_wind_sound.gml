function scr_wind_sound() {
	var _sounds = choose(snd_wind_0, snd_wind_1, snd_wind_2)

	// Right 
	if (rope_angle_velocity > 0)
	{
		if (!wind_soundcheck[1]) 
		{
			audio_play_sound(_sounds, 11, 0); 
			wind_soundcheck[1] = true;
		}
	}
	else
	{
		wind_soundcheck[1] = false;	
	}




	// Left
	if (rope_angle_velocity < 0)
	{
		if (!wind_soundcheck[0]) 
		{
			audio_play_sound(_sounds, 11, 0); 
			wind_soundcheck[0] = true;
		}
	}
	else
	{
		wind_soundcheck[0] = false;	
	}


}
