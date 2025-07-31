/// @description Draw weapon and energy UI elements

// Define the position of the Energy Bar
// room_height and room_width could be used as well
var x_pos = 10;
var y_pos = 10;

var bar_width = 200;
var bar_height = 28;

// Draw Energy Bar's Frame
var frame_width = 206;
var frame_height = 34;

draw_sprite_stretched(spr_energy_back,0,x_pos,y_pos,frame_width,frame_height);

// If player is alive, draw the energy bar
if (instance_exists(obj_player))
{
    // Get reference to the player
    var player_instance = instance_find(obj_player,0);
    
    // Calculate the size of the energy bar based on player's current energy
    var energy_ratio = player_instance.energy / player_instance.energy_max; // value 0 to 1
    var energy_width = bar_width * energy_ratio;
    
    // Draw Energy Bar
    
    draw_sprite_stretched(spr_energy_bar,0,x_pos+3,y_pos+3,energy_width,bar_height);
}


// Show the current weapon

var current_weapon = 0;

// If player is alive, draw the weapon box
if (instance_exists(obj_player))
{
    // Get reference to the player
    var player_instance = instance_find(obj_player,0);
    
    current_weapon = player_instance.current_weapon;
}

// Define the location of the weapon box
var x_pos_weapon = 10;
var y_pos_weapon = 50;
var x_spacing = 50; // because each sprite is 40x40, so this will put 10 px spacing

var weapons_list = [spr_player_pulse_laser, spr_player_sonic_laser, spr_player_vulcan];

// Select the Font
draw_set_font(fnt_weapons_ui);
draw_set_color(c_white);
draw_set_halign(fa_left);

// Loop through each weapon
for (var weapon = 0; weapon < array_length(weapons_list); weapon++)
{
    // Draw weapon frames
    if (current_weapon == (weapon+1))
    {
        draw_sprite(spr_active_weapon,0,x_pos_weapon+x_spacing*weapon,y_pos_weapon);
    } else 
    {
    	draw_sprite(spr_inactive_weapon,0,x_pos_weapon+x_spacing*weapon,y_pos_weapon);
    }
    
    // Draw weapon sprites
    draw_sprite(weapons_list[weapon],0,x_pos_weapon+x_spacing*weapon+20,y_pos_weapon+20);
    
    // Draw text
    draw_text(x_pos_weapon+x_spacing*weapon+26,y_pos_weapon+22,string(weapon+1));
}


// Score UI with Text
var score_xpos = 10;
var score_ypos = room_height - 100;

draw_set_font(fnt_text_ui);
draw_set_color(c_lime);
draw_set_halign(fa_left);
draw_text(score_xpos, score_ypos, "SCORE: " + string(global.score));

// Show lives with Icons
draw_text(score_xpos, score_ypos+45,"LIVES: ")
for (var i = 0; i < global.lives; i++)
{
    draw_sprite(spr_lives_icon,0, score_xpos+90+i*36,score_ypos+45);
}

// Show Current Level
var level_xpos = room_width - 10;
var level_ypos = score_ypos+45;
draw_set_halign(fa_right);
draw_text(level_xpos, level_ypos, "LEVEL: " + string(global.level));

// Current Asteroid Count
var asteroid_count = instance_number(obj_parent_asteroid);

if (asteroid_count > 0)
{
    draw_text(level_xpos,level_ypos - 45,"Asteroids: " + string(asteroid_count));
}
else 
{
	draw_text(level_xpos,level_ypos - 45,"Transferring to Next Zone!");
}


// GAME OVER
if (global.gameover)
{
    draw_set_font(fnt_game);
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width/2,room_height/2,"GAME OVER");
    draw_text(room_width/2,room_height/2+60,"press R to restart");
    
    // reset back to default vertical alignment
    draw_set_valign(fa_top);
}