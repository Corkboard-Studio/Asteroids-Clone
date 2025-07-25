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