// Set alignment
draw_set_font(f_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// First draw black border (outline)
draw_set_color(c_black);
draw_text(11, 10, "Saplings: " + string(global.saplings_collected) + " out of 5"); // right
draw_text(9, 10,  "Saplings: " + string(global.saplings_collected) + " out of 5"); // left
draw_text(10, 11, "Saplings: " + string(global.saplings_collected) + " out of 5"); // down
draw_text(10, 9,  "Saplings: " + string(global.saplings_collected) + " out of 5"); // up

// Then draw main white text
draw_set_color(c_white);
draw_text(10, 10, "Saplings: " + string(global.saplings_collected) + " out of 5");
