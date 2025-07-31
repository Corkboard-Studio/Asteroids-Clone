// screenwrap on
move_wrap(true, true, 100);

// unstick asteroids if they are stuck together

var other_asteroid = instance_place(x,y,obj_parent_asteroid);

if (other_asteroid != noone)
{
    // get an away vector so the overlapping asteroids have a direction to be pushed
    var away_angle = point_direction(other_asteroid.x,other_asteroid.y, x,y);
    var multiplier = 2; // adjusts the magnitude the asteroid should move away from the other
    
    // this asteroid moves away from the other_asteroid
    x += lengthdir_x(multiplier,away_angle);
    y += lengthdir_y(multiplier,away_angle);
    
    // the other_asteroid moves away from this asteroid
    other_asteroid.x += lengthdir_x(-multiplier,away_angle);
    other_asteroid.y += lengthdir_y(-multiplier,away_angle);
}

// Check if asteroid is out of HP and create smoke if out of HP
if current_hp <= 0
{
    var smoke = instance_create_layer(x,y,layer, obj_smoke);
    smoke.depth = -15;
    // if I want the smoke to be the color of asteriod
    // I'll need to create a variable to track the color based on the selected asteroid
    smoke.image_blend = smoke_color; 
    
    // scale the smoke based on size of asteroid
    smoke.image_xscale = effect_scale;
    smoke.image_yscale = effect_scale;
    
    // could have set up sound file in a variable so sm/lg asteroids sound different when explode
    audio_play_sound(snd_asteroid_explosion,1,false); 
    
    // Add score to global score
    global.score += score_value;
    
    instance_destroy();
    
    // If need to spawn new asteroids, spawn them
    var radius = (sprite_height + sprite_width) / 4 // estimates the radius of asteroid
    
    var count = 0;
    
    while (count < num_sm_asteroids_spawn and is_lg_asteroid)
    {
        var new_x = x + random_range(-radius, radius);
        var new_y = y + random_range(-radius, radius);
        
        instance_create_layer(new_x,new_y,layer, ref_sm_asteroid);
        
        count++;
    }
}
