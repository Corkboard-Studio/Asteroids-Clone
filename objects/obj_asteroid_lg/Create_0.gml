// Inherit the parent event
event_inherited();

// Select random sprite
effect_scale = 0.8;
sprite_index = choose(spr_asteroid_lg_a,spr_asteroid_lg_b,spr_asteroid_lg_c);

if (sprite_index == spr_asteroid_lg_a)
{
    smoke_color = c_purple;
}
else if (sprite_index == spr_asteroid_lg_b)
{
    smoke_color = c_orange;
}
else if (sprite_index == spr_asteroid_lg_c)
{
    smoke_color = c_blue;
}