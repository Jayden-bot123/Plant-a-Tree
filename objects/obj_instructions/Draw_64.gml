/// Draw Event of obj_instructions

// Set up text
draw_set_font(f_menu); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
var title = "INSTRUCTIONS";
var tx = room_width/2;
var ty = 80;

// Draw title with black border
draw_set_color(c_black);
draw_text(tx-2, ty, title);
draw_text(tx+2, ty, title);
draw_text(tx, ty-2, title);
draw_text(tx, ty+2, title);
draw_set_color(c_white);
draw_text(tx, ty, title);

// Instructions
var instructions = 
"Use the left and right keys OR\n A and D to move.\n" +
"Press SPACE or W to jump.\n" +
"Hold jump to jump higher.\n" +
"Double click jump to double jump.\n" +
"Press E to interact with the signposts.\n" +
"Collect all the 5 saplings on the level\n to continue.\n" +
"Avoid the spikes.\n\n";


tx = room_width/2;
ty = room_height/2;

// Draw instructions with black border
draw_set_color(c_black);
draw_text(tx-2, ty, instructions);
draw_text(tx+2, ty, instructions);
draw_text(tx, ty-2, instructions);
draw_text(tx, ty+2, instructions);
draw_set_color(c_white);
draw_text(tx, ty, instructions);
