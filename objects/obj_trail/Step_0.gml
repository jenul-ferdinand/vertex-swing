if (image_xscale > 0.1) 
{
	image_alpha -= 0.05;
	image_xscale -= 0.03;
	image_yscale -= 0.03;
}
else
{
	instance_destroy();
}	