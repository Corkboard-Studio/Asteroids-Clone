// mouse steering

// checks if 'M' key is pressed and toggles between mouse vs keyboard steering
if keyboard_check_pressed(ord("M"))
{
    use_mouse_steering = !use_mouse_steering; //switch states
}

if use_mouse_steering
{
    // calculate the angle from the ship to the mouse
    var target_angle = point_direction(x,y, mouse_x,mouse_y);
    
    var turn_angle = angle_difference(target_angle, direction);
    
    
    // checking for mouse coordinates and proper calculations for ship movement
    //show_debug_message("Mouse x: " + string(mouse_x) + " Mouse y: " + string(mouse_y));
    //show_debug_message("Angle to mouse: " + string(target_angle) + " Desired turn angle: " + string(turn_angle));
    
    // the ship will only incrementally turn instead of all at once; limits turn_angle to turn_speed
    if abs(turn_angle) > turn_speed
    {
        turn_angle = sign(turn_angle) * turn_speed;
    }
    
    image_angle += turn_angle;
    direction += turn_angle;
}