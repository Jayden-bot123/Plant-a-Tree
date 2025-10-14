

// Store player’s original spawn position
spawn_x = x;
spawn_y = y;

// Respawn setup
respawn_x = x;
respawn_y = y;

// Sapling counters
global.saplings_collected = 0; // running total
global.saplings_saved = 0;     // checkpoint backup

// Sapling tracking list
if (!variable_global_exists("saplings_collected_list")) 
{
    global.saplings_collected_list = ds_list_create();
}
if (!variable_global_exists("saplings_saved_list")) 
{
    global.saplings_saved_list = ds_list_create();
}


//Custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
	} else {
		onGround = false;

	}
}

//Control setup
controlsSetup();

//Sprites
maskSpr = spr_player_idle;
idleSpr = spr_player_idle;
walkSpr = spr_player_walk;
jumpSpr = spr_player_jump;


// Moving
	face = 1;
	// moveDir = -1 will move left, moveDir = 0 not moving, moveDir = 1 moving right
	moveDir = 0;
	//actual speed we want to move at, how many pixels per frame
	moveSpd = 2;
	//left and right speed along x-axis
	xspd = 0;
	//up and down speed
	yspd = 0;

// Jumping
	grav = .275;
	termVel = 4;
	//Tells us if we are on the ground or not
	onGround = true;
	//Maximum number of jumps we can perform
	jumpMax = 2;
	//How many jumps we've actually performed
	jumpCount = 0;
	//Controlling our jump speed
	jumpHoldTimer = 0;
	//Specific amount of frames we are allowed to hold our jump
	jumpHoldFrames[0] = 18;
	//it does need to negative because in Gamemaker, going upwards is negative on the y-axis
	jspd[0] = -3.15;
	jumpHoldFrames[1] = 10;
	jspd[1] = -2.85;
	


