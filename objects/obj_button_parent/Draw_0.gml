// Draw the button
draw_self();

// Setup the text for the button
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y,button_text);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);