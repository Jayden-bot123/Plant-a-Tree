///Control finish

// Ease in
finish_x += (finish_x_target - finish_x) / finish_speed;

// Keyboard controls
if (finish_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		finish_cursor++;
		if (finish_cursor >= finish_items) finish_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		finish_cursor--;
		if (finish_cursor < 0) finish_cursor = finish_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		audio_play_sound(snd_button, 0, false);
		audio_sound_gain(snd_button, 0.1, 0);
		finish_x_target = gui_width + 200;
		finish_commited = finish_cursor;
		finish_control = false;
	}
	
	// Mouse controls
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if ((mouse_y_gui < finish_y) && (mouse_y_gui > finish_top))
	{
		finish_cursor = (finish_y - mouse_y_gui) div (finish_itemheight * 1.5);
		
		if (mouse_check_button_pressed(mb_left))
		{
			finish_x_target = gui_width + 200;
			finish_commited = finish_cursor;
			finish_control = false;
		}
	}
}

// Handle selection when finish slides out
if (finish_x > gui_width+150) && (finish_commited != -1)
{
	switch (finish_commited)
	{
		case 1: room_goto(rm_menu); break; // Play Again goes to finish
		case 0: game_end(); break;         // Quit closes the game
	}
}
