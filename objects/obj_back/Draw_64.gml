draw_set_font(f_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < back_items; i++) 
{
    var offset = 2;
    var txt = back[i];
    if (back_cursor == i)
    {
        txt = "> " + txt;
        var col = c_white;
    }
    else
    {
        var col = c_gray;	
    }

    var xx = back_x;
    var yy = back_y + (i * back_itemheight * 1.5);

    // Border
    draw_set_color(c_black);
    draw_text(xx-offset, yy, txt);
    draw_text(xx+offset, yy, txt);
    draw_text(xx, yy+offset, txt);
    draw_text(xx, yy-offset, txt);

    // Main text
    draw_set_color(col);
    draw_text(xx, yy, txt);
}
