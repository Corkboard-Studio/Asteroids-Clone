draw_self(); // A Draw event removes the automatic drawing of the player sprite, so manually have to draw_self

if (invulnerable_timer > 0)
{
    var invulnerable_ratio = invulnerable_timer / invulnerable_timer_max;
    var full_state_bar_width = sprite_get_width(spr_ui_state_bar);
    
    var state_bar_width = full_state_bar_width * invulnerable_ratio;
    
    // Draw cropped state bar
    draw_sprite_part(spr_ui_state_bar,0,0,0,state_bar_width,sprite_get_height(spr_ui_state_bar),x,y-62);
    draw_sprite(spr_ui_state_bar,1,x,y-55);
    
    // Draw the invulnerability ui icon
    draw_sprite(spr_ui_invulnerability,0,x-10,y-58);
}