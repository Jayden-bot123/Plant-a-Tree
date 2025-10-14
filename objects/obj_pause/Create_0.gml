global.paused = false;
menu_items = 3;
menu = ["Resume", "Restart", "Main Menu"];

// Use GUI functions instead of gui_width/gui_height
menu_x = display_get_gui_width() + 200;
menu_x_target = display_get_gui_width() + 200;
menu_y = display_get_gui_height() - 200;
menu_itemheight = 32;

menu_cursor = 0;
menu_commited = -1;
menu_speed = 6;
menu_control = false;

gui_width = display_get_gui_width();
gui_height =display_get_gui_height();
gui_margin = 32;
