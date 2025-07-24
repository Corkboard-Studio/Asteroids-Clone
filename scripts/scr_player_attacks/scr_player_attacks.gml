/// @description This function spawns a new laser from the center of the player by default
/// @parameter {Asset.GMObject} _obj_to_spawn The laser object to spawn
/// @parameter {Real} _speed Speed of laser
/// @parameter {Real} _direction Direction of laser
/// @parameter {Real} _random_variation [Degrees of variation (+/-) of the laser angle (default = 0)]
/// @parameter {Real} _offset_x [The x-variable offset of the laser]
/// @parameter {Real} _offset_y [The y-variable offset of the laser]
/// @return {Id.Instance} Reference to the spawned laser
function spawn_player_laser(_obj_to_spawn, _speed, _direction, _random_variation = 0, _offset_x = 0, _offset_y = 0)
{
    var cos_value = dcos(_direction);
    var sin_value = -dsin(_direction);
    
    var x_offset = _offset_x * cos_value - _offset_y * sin_value; // using rotation matrix calculation to account for direction of rotation
    var y_offset = _offset_x * sin_value + _offset_y * cos_value;  // using rotation matrix calculation to account for direction of rotation
    
    var laser = instance_create_layer(x + x_offset, y + y_offset, layer, _obj_to_spawn)
    var random_variation = random_range(-_random_variation,_random_variation)
    laser.speed = _speed;
    laser.direction = _direction + random_variation;
    laser.image_angle = _direction + random_variation;
    
    return laser;
}


/// @description This function spawns a new laser from the center of the player by default
/// @parameter {Bool} _primary_attack The state of the primary attack, true if button pressed
function player_attack(_primary_attack)
{
    // pulse laser
    var pulse_laser_cd = 10; // cooldown between each shot
    var pulse_laser_speed = 14 + (speed * 0.5);
    var pulse_laser_damage = 10;
    var pulse_laser_duration = 45;
    
    // sonic laser
    var sonic_laser_cd = 16;
    var sonic_laser_speed = 15 + (speed * 0.5);
    var sonic_laser_damage = 8;
    var sonic_laser_duration = 30;
    
    // vulcan laser
    var vulcan_laser_cd = 6;
    var vulcan_laser_speed = 22 + (speed * 0.5);
    var vulcan_laser_damage = 4;
    var vulcan_laser_duration = 30;
    
    if (_primary_attack and cooldown_primary <= 0)
    {
        if (current_weapon == 1)
        {
            // spawn new laser
            var x_offset = 60; // shifts the spawn location forward
            
            var laser = spawn_player_laser(obj_player_pulse_laser, pulse_laser_speed, direction, 0, x_offset);
            laser.damage = pulse_laser_damage;
            laser.exist_duration = pulse_laser_duration;
            
            cooldown_primary = pulse_laser_cd
            
            // play sound
            audio_play_sound(snd_laser01,1,false);
            
        } // end if current weapon is 1
        else if (current_weapon == 2)
        {
            // spawn new lasers
            var variation = 15; // amount of spread in the angle between each laser
            var x_offset = 30; // shifts the spawn location forward
            
            var laser1 = spawn_player_laser(obj_player_sonic_laser, sonic_laser_speed, direction - variation, 0, x_offset);
            laser1.damage = sonic_laser_damage;
            laser1.exist_duration = sonic_laser_duration;
            
            var laser2 = spawn_player_laser(obj_player_sonic_laser, sonic_laser_speed, direction, 0, x_offset);
            laser2.damage = sonic_laser_damage;
            laser2.exist_duration = sonic_laser_duration;
            
            var laser3 = spawn_player_laser(obj_player_sonic_laser, sonic_laser_speed, direction + variation, 0, x_offset);
            laser3.damage = sonic_laser_damage;
            laser3.exist_duration = sonic_laser_duration;
            
            cooldown_primary = sonic_laser_cd
            
            // play sound
            audio_play_sound(snd_laser02,1,false);
            
        } // end if current weapon is 2
        else if (current_weapon == 3)
        {
            // spawn new lasers
            var x_offset = 18; // shifts the spawn location forward
            var y_offset = 20; // shifts the spawn location outward
            
            var laser1 = spawn_player_laser(obj_player_vulcan, vulcan_laser_speed, direction, 0, x_offset, -y_offset);
            laser1.damage = vulcan_laser_damage;
            laser1.exist_duration = vulcan_laser_duration;
            
            var laser2 = spawn_player_laser(obj_player_vulcan, vulcan_laser_speed, direction, 0, x_offset, y_offset);
            laser2.damage = vulcan_laser_damage;
            laser2.exist_duration = vulcan_laser_duration;
            
            cooldown_primary = vulcan_laser_cd;
            
            // play sound
            audio_play_sound(snd_laser04,1,false);
        } // end if current weapon is 3
    }
}