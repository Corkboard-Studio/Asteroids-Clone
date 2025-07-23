/// @description This function controls player movement; true if pressed
/// @param {Bool} _left The state of the left key
/// @param {Bool} _right The state of the right key
/// @param {Bool} _up The state of the up key
/// @param {Bool} _down The state of the down key 
/// 
function player_movement(_left, _right, _up, _down){
    var h_input = _left - _right;
    var v_input = _up - _down;
    
    var should_spawn_sparks = false;
    var spark_intensity = 1.0;
    
    // handles forward/backward motion
    if (v_input != 0) {
        friction = 0;
        speed += v_input * acceleration/2;
        speed = max(min(speed, max_speed), -max_speed/2);
        v_input = _up - deceleration * _down;
        
        // Reset fade timer when there's input
        spark_fade_timer = 0;
        should_spawn_sparks = true;
        spark_intensity = 1.0;
    } else {
        // No input - check if we should continue sparks based on speed    
        //Speed-based fade (sparks continue while moving)
        if (abs(speed) > 0.5) {
            should_spawn_sparks = true;
            spark_intensity = abs(speed) / max_speed; // Fade based on speed
        }
    }
    
    // Spawn sparks if conditions are met
    /* Note: I deviated from Justin Zendt's tutorial because I didn't want the sparks
     * shooting out of the front of the spaceship while moving in reverse.
     * I also wanted there to be a smoother transition between how they behaved
     * while transitioning from forward to backwards
     * */
    if (should_spawn_sparks) {
        var num_sparks = irandom_range(2, 10) * spark_intensity; // Fewer sparks as intensity decreases
        
        for (var i = 0; i < num_sparks; i++) {
            var spark = instance_create_layer(x, y, layer, obj_spark);
            var speed_factor = abs(speed) / max_speed;
            spark.direction = direction + 180 + irandom_range(-45, 45);
            
            if (speed > 0) {
                spark.direction = direction + 180 + irandom_range(-30, 30);
                spark.speed = random_range(1.0, 1.8) * (0.5 + speed_factor);
            } else if (speed < 0) {
                spark.direction = direction + 180 + irandom_range(-10, 10);
                spark.speed = random_range(1.5, 2.5) * (5.3 + abs(speed_factor));
            } else {
                spark.direction = direction + 180 + irandom_range(-45, 45);
                spark.speed = random_range(0.8, 1.5);
            }
            
            // Reduce alpha during fade-out
            spark.image_alpha = random_range(0.3, 0.7) * spark_intensity;
            
            // Direction of motion
            var forward_intensity = clamp((speed + 2) / 4, 0, 1); // 0 when moving backward, 1 when moving forward
            var backward_intensity = 1 - forward_intensity;
            
            // Colors of spark change based on direction of motion
            var green_component = irandom_range(50, 255);
            var red_component = forward_intensity * 255;
            var blue_component = backward_intensity * 255;
    
            
            spark.image_blend = make_color_rgb(red_component, green_component, blue_component);
        }
    }
    
    // handles steering of the spaceship left/right
    if (use_mouse_steering) // uses mouse for steering
    {
        // calculate the angle from the ship to the mouse
        var target_angle = point_direction(x,y, mouse_x,mouse_y);
        
        var turn_angle = angle_difference(target_angle, direction);
        
        // the ship will only incrementally turn instead of all at once; limits turn_angle to turn_speed
        if (abs(turn_angle) > turn_speed)
        {
            turn_angle = sign(turn_angle) * turn_speed;
        }
        
        image_angle += turn_angle;
        direction += turn_angle;
    }
    else // uses keyboard for steering
    {
        direction += h_input * turn_speed/2;
        image_angle += h_input * turn_speed/2;
    }
}