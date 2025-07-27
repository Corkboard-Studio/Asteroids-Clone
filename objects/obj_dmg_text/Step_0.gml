// Floats the text up per frame for 1 second (exist_duration set in instance variables)
y -= move_speed;
exist_duration -= 1;

// Fades out the text
if (exist_duration <= 15)
{
    alpha = exist_duration / 15;
}

// Destroys text
if (exist_duration <= 0)
{
    instance_destroy();
}