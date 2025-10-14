// Get inputs
getControls();


if (!global.paused) 
{
	//X movement
		//Direction
		moveDir = rightKey - leftKey;
	
		//Get my face
		if moveDir != 0 {face = moveDir;};
	
		// Get xspd
		xspd = moveDir * moveSpd;

		//X collision
		var _subPixel = .5;
		if place_meeting(x + xspd, y, obj_wall)
		{
			//First check if there is a slope to go up
			if !place_meeting(x + xspd, y - abs(xspd)-1, obj_wall )
			{
				while place_meeting(x + xspd, y, obj_wall) { y -= _subPixel; };
			}
			//Next, check for ceiling slopes, otherwise, do a regular collision
			else 
			{
				//Ceiling Slopes
				if !place_meeting(x + xspd, y + abs(xspd)+1, obj_wall)
				{
					while place_meeting(x + xspd, y, obj_wall) { y += _subPixel; };	
				}
				//Normal Collision
				else
				{
					//Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(xspd);
					while !place_meeting(x + _pixelCheck, y, obj_wall)
					{
						x += _pixelCheck;	
					}
	
					//Set xspd to 0 to "collide"
					xspd = 0;
				}
			}
		}
	
		//Go down slopes
		if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_wall) && place_meeting(x + xspd, y + abs(xspd)+1, obj_wall)
		{
			while !place_meeting(x + xspd, y + _subPixel, obj_wall) { y += _subPixel; };
		}

		//Move
		x += xspd;


	//Y movement
		//Gravity
		yspd += grav;


		//Reset/Prepare jumping variables
		if onGround
		{
			jumpCount = 0;	
			jumpHoldTimer = 0;
		} else {
			//If the player is in the air, make sure they can't do an extra jump
			if jumpCount  == 0 {jumpCount = 1;};
		}
	
	

		//Initiate the Jump
		if jumpKeyBuffered && jumpCount < jumpMax
		{
			audio_play_sound(snd_jump, 0, false);
			//Reset the buffer
			jumpKeyBuffered = false;
			jumpKeyBufferTimer = 0;
			//Increase the number of perfomed jumps
			jumpCount++;
			//Set the jump hold timer
			jumpHoldTimer = jumpHoldFrames[jumpCount-1];
			//tell ourself we're no longer on the ground
			setOnGround(false);
		
		}
		//Cut off the jump by releasing the jump button
		if !jumpKey
		{
			jumpHoldTimer = 0;	
		}
		//Jump based on the timer/holding the button
		if jumpHoldTimer > 0
		{	
			//Constantly set the yspd to jumping speed
			yspd = jspd[jumpCount-1];
			//Count down the timer
			jumpHoldTimer--;
		}


	
		//Y Collision and movement
			//Cap falling speed
			if yspd > termVel {yspd = termVel;};
	
			// Y Collision
			var _subPixel = .5;
		
			//Upwards Y Collision (with ceiling slopes)
			if yspd < 0 && place_meeting(x, y + yspd, obj_wall)
			{
				//Jump into sloped ceilings
				var _slopeSlide = false;
			
				//slide upleft slope
				if moveDir == 0 && !place_meeting(x - abs(yspd)-1, y + yspd, obj_wall)
				{
					while place_meeting(x, y + yspd, obj_wall) { x -= 1; };	
					_slopeSlide = true;
				}
			
				//slide upright slope
				if moveDir == 0 && !place_meeting(x + abs(yspd)+1, y + yspd, obj_wall)
				{
					while place_meeting(x, y + yspd, obj_wall) { x += 1; };	
					_slopeSlide = true;
				}
			
				//Normal Y collision
				if !_slopeSlide
				{
					//Scoot up to the wall precisely
					var _pixelCheck = _subPixel * sign(yspd);
					while !place_meeting(x, y + _pixelCheck, obj_wall)
					{
						y += _pixelCheck;	
					}
			
			
		
					//Set yspd to 0 to collide
					yspd = 0;
				}
			
			}
		

		
			//Downwards Y Collisions
			if yspd  >= 0 
			{
				if place_meeting(x, y+yspd, obj_wall)
				{
					//Scoot up to the wall precisely
					var _pixelCheck = _subPixel * sign(yspd);
					while !place_meeting(x, y + _pixelCheck, obj_wall)
					{
						y += _pixelCheck;	
					}
			
					//bonk
					if yspd < 0 { jumpHoldTimer = 0;};
		
					//Set yspd to 0 to collide
					yspd = 0;
				}
		
				//Set if I'm on the ground
				if place_meeting(x, y+1, obj_wall)
				{
					setOnGround(true);
				} 
		
			}	
		
			//Move
			y += yspd;
}

// At the END of the player Step Event (outside of if (!obj_pause.paused)):

// Always check for portal collision, even if paused
var portal = instance_place(x, y, obj_portal);
if (portal != noone) {
    if (portal.open) {
        audio_play_sound(snd_portal, 0, false);
        room_goto_next();
    }
}

if (!global.paused)
{
//Sprite Control
	//Walking
	if abs(xspd) > 0 
	{

		sprite_index = walkSpr;
	}

	//Not moving
	if xspd == 0 {sprite_index = idleSpr;};
	//In the air
	if !onGround {sprite_index = jumpSpr;};
	
	//set the collision mask
	mask_index = idleSpr;
}







		