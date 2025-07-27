// Inherit the parent event
event_inherited();

// Select random sprite
is_lg_asteroid = false;
effect_scale = 0.7;
sprite_index = choose(spr_asteroid_sm_a,spr_asteroid_sm_b,spr_asteroid_sm_c,spr_asteroid_sm_e,spr_asteroid_sm_e);

if (sprite_index == spr_asteroid_sm_a)
{
    smoke_color = #ff78ef; // pink
}
else if (sprite_index == spr_asteroid_sm_b)
{
    smoke_color = c_teal;
}
else if (sprite_index == spr_asteroid_sm_c)
{
    smoke_color = c_yellow;
}
else if (sprite_index == spr_asteroid_sm_d)
{
    smoke_color = c_orange;
}
else if (sprite_index == spr_asteroid_sm_e)
{
    smoke_color = c_navy;
}