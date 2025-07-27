/// @description Collision with asteroid
var scale_factor = 2.5;
var explosion = instance_create_layer(x,y,layer,obj_explosion);
explosion.depth = -20; // lower numbers stack higher (are drawn on top of higher numbers)
explosion.image_xscale = scale_factor;
explosion.image_yscale = scale_factor;
audio_play_sound(snd_player_explosion,1,false);

// Destroy player
instance_destroy();