switch (side)
{
	case false:
		x -= spd;
		break;
		
	case true:
		x += spd;
		break;
}

if (instance_place(x, y, obj_wall))
{
	side = !side;
}

if (instance_place(x, y, obj_player))
{
	scr_die();
}	