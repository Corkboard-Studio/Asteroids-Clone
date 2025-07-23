// screen wrapping and clean up

exist_duration -= 1;

// screen wrap
if (allow_wrap)
{
    move_wrap(true,true,1);
}

// destroy projectile after time runs out
if (exist_duration <= 0)
{
    instance_destroy();
}