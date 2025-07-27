// Asteroid takes damage from laser
current_hp -= other.damage;

var laser_hit = instance_create_layer(other.x,other.y,layer, obj_hit);
laser_hit.image_blend = other.effect_color;
laser_hit.depth = -10

// Spawn damage text on its own layer
var x_offset = irandom_range(-10,10);
var y_offset = -5
var damage_text = instance_create_layer(other.x+x_offset, other.y+y_offset,"Damage_Text",obj_dmg_text);
damage_text.damage_text = string(other.damage);
damage_text.draw_color = other.effect_color;
audio_play_sound(snd_asteroid_shot,1,false);

instance_destroy(other); // destroys laser
