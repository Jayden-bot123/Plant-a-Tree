draw_set_font(f_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < finish_items; i++) 
{
	var offset = 2;
	var txt	= finish[i];
	var col;
	if (finish_cursor == i)
	{
		txt = string_insert("> ",txt, 0);
		col = c_white;
	}
	else
	{
		col = c_gray;
	}
	var xx = finish_x;
	var yy = finish_y - (finish_itemheight * (i * 1.5));
	
	// Outline
	draw_set_colour(c_black);
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx, yy-offset, txt);
	
	// Main text
	draw_set_colour(col);
	draw_text(xx, yy, txt);
}
