/// Draw Event of obj_finished

// Set up text
draw_set_font(f_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
var title = "IMPORTANCE OF TREES";
var tx = room_width / 2 - 40;
var ty = 40; // keep title around upper quarter of the screen

// Draw title with black border
draw_set_color(c_black);
draw_text(tx-2, ty, title);
draw_text(tx+2, ty, title);
draw_text(tx, ty-2, title);
draw_text(tx, ty+2, title);
draw_set_color(c_white);
draw_text(tx, ty, title);
// Instructions text
var instructions = 
"Trees give us clean air to breathe,\nshade to keep cool, and homes for animals.\n" +
"They also help fight climate change\nand make the world more beautiful.\n\n" +
"That's why we should plant more trees\nand look after them.\n" +
"Every new tree makes our planet\nhealthier and happier for everyone!";

// Position instructions just below the title
tx = room_width / 2 - 40; // move text a bit left (adjust -80 as needed)
ty = room_height /3  ; // lower the text so it doesn’t overlap title

// Draw instructions with black border
draw_set_color(c_black);
draw_text(tx-2, ty, instructions);
draw_text(tx+2, ty, instructions);
draw_text(tx, ty-2, instructions);
draw_text(tx, ty+2, instructions);
draw_set_color(c_white);
draw_text(tx, ty, instructions);
