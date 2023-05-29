enum player_state
{
	normal,
	swing,
}

hspd = 0;
vspd = 0;
grav = 0.4;
accel = 6;
jump_height = 12;

trail_intensity = 1; // whole number

rope_momentum_gain = 0.05;
rope_climb_speed = 4;
rope_max_length = 5;
angle_velocity = 0.99;
angle_accel = 0.2;

start_grapple_timer = false;
grapple_timer = 100;
grapple_timer_reduction_speed = 2;
grapple_bar_colour = c_white;

wind_soundcheck[0] = false;
wind_soundcheck[1] = false;
landing_soundcheck = false;

state = player_state.normal;

cursor_sprite = spr_cursor;

level = level_1;