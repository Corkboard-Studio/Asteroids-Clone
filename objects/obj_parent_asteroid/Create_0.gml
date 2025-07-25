/// Instance variables are created in the Variable Definitions of the obj

current_hp = max_hp
direction = irandom_range(0,359);

var random_speed = random_range(initial_min_velocity, initial_max_velocity);
speed = random_speed;

// Randomly assigns left or right rotation
visual_spin = 0.5 * random_speed * (irandom(1) == 0 ? -1:1); // if irandom == 0 it is -1, else 1