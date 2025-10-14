gui_width  = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

back_x = gui_margin;   // left edge
back_y = gui_margin;   // top edge
back_x_target = back_x;

back_speed = 25;
back_font = f_menu;
back_itemheight = font_get_size(f_menu);
back_commited = -1;
back_control = true;

back[0] = "Back";  // array of items
back_items = array_length_1d(back);

back_top = back_y;   // top edge
back_cursor = 0;     // only one item
