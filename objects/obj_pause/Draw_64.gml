if (global.paused) {
	
	
    // Translucent black overlay
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
	
	draw_set_font(f_pause);
	var title = "PAUSE";
	var tx = room_width/5;
	var ty = room_height/3.5;

	// Draw title with black border
	draw_set_color(c_black);
	draw_text(tx-2, ty, title);
	draw_text(tx+2, ty, title);
	draw_text(tx, ty-2, title);
	draw_text(tx, ty+2, title);
	draw_set_color(c_white);
	draw_text(tx, ty, title);


    // Menu items
    draw_set_font(f_menu);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);

    for (var i = 0; i < menu_items; i++) {
        var offset = 2;
        var txt = menu[i];
        if (menu_cursor == i) {
            txt = string_insert("> ", txt, 0);
            var col = c_white;
        } else {
            var col = c_gray;    
        }

        var xx = menu_x;
        var yy = menu_y - (menu_itemheight * (i * 1.5));

        draw_set_colour(c_black);
        draw_text(xx - offset, yy, txt);
        draw_text(xx + offset, yy, txt);
        draw_text(xx, yy + offset, txt);
        draw_text(xx, yy - offset, txt);

        draw_set_colour(col);
        draw_text(xx, yy, txt);
    }
}
