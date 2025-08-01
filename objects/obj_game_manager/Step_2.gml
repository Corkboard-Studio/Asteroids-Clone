// Check for victory and load next level

var asteroid_count = instance_number(obj_parent_asteroid);

// turns on flag to start timer in instance variables to transition to next level
if (not level_cleared and asteroid_count <= 0)
{
    level_cleared = true;
}

// if level is cleared, decrement timer
if (level_cleared)
{
    timer--;
}

// load next level
if (timer <= 0 and level_cleared)
{
    room_goto(room_list[global.level % 3]);
    global.level++;
}