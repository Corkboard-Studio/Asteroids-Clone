// Setup the text for the button
draw_set_font(fnt_controls);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
var offset = x+200;
draw_text(offset,y-90,"CONTROLS");
draw_text(offset,y-60,"Ship points towards Mouse");
draw_text(offset,y-30,"UP or W = Forward");
draw_text(offset,y,"DOWN or S = Reverse");
draw_text(offset,y+30,"SPACE or Left Click = Shoot");
draw_text(offset,y+60,"1, 2, or 3 = Switch Weapon");
draw_text(offset,y+90,"UP or W = Forward");

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);