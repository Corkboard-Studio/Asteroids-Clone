// mouse steering and movement

// checks if 'M' key is pressed and toggles between mouse vs keyboard steering
if (keyboard_check_pressed(ord("M")))
{
    use_mouse_steering = !use_mouse_steering; //switch states
}

// check weapon selection
if (keyboard_check_pressed(ord("1")))
{
    current_weapon = 1;
}
if (keyboard_check_pressed(ord("2")))
{
    current_weapon = 2;
}
if (keyboard_check_pressed(ord("3")))
{
    current_weapon = 3;
}

// checks for movement keys being pressed
var left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var down = keyboard_check(vk_down) or keyboard_check(ord("S"));

var primary_attack = keyboard_check(vk_space) or mouse_check_button(mb_left); //space or left click on mouse

player_movement(left, right, up, down);

// player attacks
player_attack(primary_attack);