/// Pause Menu Step Event

// Toggle pause
if (keyboard_check_pressed(vk_escape)) 
{
    if (global.paused) 
	{
        // Closing pause menu
        global.paused = false;
        menu_control = false;
        menu_x_target = gui_width + 200;
    } 
	else 
	{
        // Opening pause menu
        global.paused = !global.paused;
        menu_control = true;
        menu_cursor = 0;
        menu_commited = -1;
        menu_x_target = gui_width - 100; // slide menu onto screen
    }
}

// If paused, control menu
if (global.paused) 
{
    // Ease in/out
    menu_x += (menu_x_target - menu_x) / menu_speed;

    // Keyboard controls
    if (menu_control) {
        if (keyboard_check_pressed(vk_up)) 
		{
            menu_cursor++;
            if (menu_cursor >= menu_items) 
			{
                menu_cursor = 0;    
            }
        }

        if (keyboard_check_pressed(vk_down)) 
		{
            menu_cursor--;
            if (menu_cursor < 0) {
                menu_cursor = menu_items - 1;    
            }
        }

        if (keyboard_check_pressed(vk_enter)) 
		{
            audio_play_sound(snd_button, 0, false);
            audio_sound_gain(snd_button, 0.1, 0);
            menu_x_target = gui_width + 200;
            menu_commited = menu_cursor;
            menu_control = false;
        }
    }

    // Handle chosen option once menu slides off
    if (menu_x > gui_width + 150 && (menu_commited != -1)) {
        switch (menu_commited) {
            case 0: // Resume
                global.paused = !global.paused;
                break;
            case 1: // Restart
                room_restart();
                break;
            case 2: // Quit
                room_goto(rm_menu); // change this to your main menu room
                break;
        }
        menu_commited = -1;
    }
}
