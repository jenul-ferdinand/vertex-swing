grounded = place_meeting(x, y + 1, obj_wall);
image_speed = 0;
image_index = 0;

var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));
var jump_key = keyboard_check(vk_space);

if (jump_key) or (down_key) or (up_key) or (left_key) or (right_key) or (!grounded)
{
	for (var i = 0; i < trail_intensity; i++)
	{
		var trail = instance_create_layer(x, y, "Instances", obj_trail);
		trail.sprite_index = sprite_index;
		trail.image_speed = 0;
		trail.image_index = 1;
	}
}

switch (state)
{
	case (player_state.normal):
		wind_soundcheck[0] = false;
		wind_soundcheck[1] = false;
		
		// Movement And Gravity
		var dir = right_key - left_key;
		hspd = dir * accel;
		vspd += grav;
		
		// Jumping
		if (grounded) 
		{
			if (jump_key)
			{
				vspd = -jump_height;
				
				audio_play_sound(snd_jump, 10, 0);
			}
			
			if (!landing_soundcheck) 
			{
				audio_play_sound(snd_landing, 0, 0);
				landing_soundcheck = true;
			}
		}
		else
		{
			landing_soundcheck = false;	
		}
		
		// Grapple Transition
		if (start_grapple_timer) { grapple_timer -= grapple_timer_reduction_speed; }
		else { grapple_timer = 0; }
		if (grapple_timer <= 0)
		{
			if (position_meeting(mouse_x, mouse_y, obj_wall_mouse_collision))
			{
				if (mouse_check_button_pressed(mb_left))
				{
					start_grapple_timer = true;
					grapple_timer = 100;
					grapple_x = mouse_x;
					grapple_y = mouse_y;
					rope_x = x;
					rope_y = y;
					rope_angle_velocity = 0;
					rope_angle = point_direction(grapple_x, grapple_y, x, y);
					rope_length = point_distance(grapple_x, grapple_y, x, y);
					state = player_state.swing;
					
				}
			
				cursor_sprite = spr_cursor_pink;
				grapple_bar_colour = make_colour_rgb(237, 0, 138);
			}
			else
			{
				cursor_sprite = spr_cursor;	
				grapple_bar_colour = c_white;
			}
		}
		break;
		
	case player_state.swing:
		var rope_angle_accel = -angle_accel * dcos(rope_angle);
		rope_angle_accel += (right_key - left_key) * rope_momentum_gain;
		rope_length += (down_key - up_key) * rope_climb_speed;
		rope_length = max(rope_length, rope_max_length);
		
		rope_angle_velocity += rope_angle_accel;
		rope_angle += rope_angle_velocity;
		rope_angle_velocity *= angle_velocity;
		
		rope_x = grapple_x + lengthdir_x(rope_length, rope_angle);
		rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);
		
		hspd = rope_x - x;
		vspd = rope_y - y;
		
		// Wind Sound
		scr_wind_sound();
		
		if (jump_key)
		{
			state = player_state.normal;
			vspd = -jump_height;
		}
		break;
}

// Move & Collide
if (place_meeting(x + hspd, y, obj_wall))
{
	while (!place_meeting(x + sign(hspd), y, obj_wall))
	{
		x += sign(hspd);	
	}
	hspd = 0;
			
	if (state == player_state.swing)
	{
		rope_angle = point_direction(grapple_x, grapple_y, x, y);
		rope_angle_velocity = 0;
	}
}	
x += hspd;
		
if (place_meeting(x, y + vspd, obj_wall))
{
	while(!place_meeting(x, y + sign(vspd), obj_wall))
	{
		y += sign(vspd);
	}
	vspd = 0;
			
	if (state == player_state.swing)
	{
		rope_angle = point_direction(grapple_x, grapple_y, x, y);
		rope_angle_velocity = 0;
	}
}
y += vspd;














