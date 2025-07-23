/// @description This function spawns a new laser from the center of the player by default
/// @parameter {Asset.GMObject} _obj_to_spawn The laser object to spawn
/// @parameter {Real} _speed Speed of laser
/// @parameter {Real} _direction Direction of laser
/// @parameter {Real} _random_variation *Amount of variation is laser angle (default = 0)
/// @return None
function spawn_player_laser(_obj_to_spawn, _speed, _direction, _random_variation = 0)
{
    var laser = instance_create_layer(x,y,layer,_obj_to_spawn)
    var random_variation = random_range(-_random_variation,_random_variation)
    laser.speed = _speed;
    laser.direction = _direction + random_variation;
    laser.image_angle = _direction + random_variation;
}


/// @description This function spawns a new laser from the center of the player by default
/// @parameter {Bool} _primary_attack The state of the primary attack, true if button pressed
function player_attack(_primary_attack)
{
    var pulse_laser_cd = 10; // cooldown between each shot
    var pulse_laser_speed = 14 + (speed * 0.5);
    
    if (_primary_attack and cooldown_primary <= 0)
    {
        // spawn new laser
        spawn_player_laser(obj_player_pulse_laser, pulse_laser_speed, direction);
        
        cooldown_primary = pulse_laser_cd
        
    }
}