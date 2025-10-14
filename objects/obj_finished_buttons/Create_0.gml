gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

finish_x = gui_width + 200;
finish_y = gui_height - gui_margin;
finish_x_target = gui_width - gui_margin;
finish_speed = 25; // lower = faster
finish_font = f_menu;
finish_itemheight = font_get_size(f_menu);
finish_commited = -1;
finish_control = true;

// Only 2 items here
finish[1] = "Play Again";
finish[0] = "Quit";

finish_items = array_length_1d(finish);

finish_top = finish_y - ((finish_itemheight * 1.5) * finish_items);

finish_cursor = 1;
