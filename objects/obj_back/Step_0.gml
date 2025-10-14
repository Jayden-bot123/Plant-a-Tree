/// Control menu

// --- Keyboard controls ---
if (back_control)
{
    if (keyboard_check_pressed(vk_enter))
    {
        back_commited = back_cursor;
        back_control = false;
		audio_play_sound(snd_button, 0, false);
		audio_sound_gain(snd_button, 0.1, 0);
    }
}

// --- Mouse controls ---
var mouse_x_gui = device_mouse_x_to_gui(0);
var mouse_y_gui = device_mouse_y_to_gui(0);

// Dimensions of Back text
var xx = back_x;
var yy = back_y;
var w  = string_width(back[0]);
var h  = back_itemheight;

// Check if mouse is over the button rectangle
if (mouse_x_gui >= xx && mouse_x_gui <= xx + w &&
    mouse_y_gui >= yy && mouse_y_gui <= yy + h)
{
    back_cursor = 0; // highlight the Back button

    if (mouse_check_button_pressed(mb_left))
    {
        back_commited = back_cursor;
        back_control = false;
    }
}

//commit action
if (back_commited != -1)
{
    switch (back_commited)
    {
        case 0: room_goto(rm_menu); break;
    }
}
