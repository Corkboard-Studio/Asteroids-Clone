// Speed up

//using if

//if speed < max_speed
//{
    //speed += acceleration/2;
//}
friction = 0;
speed += acceleration/2;
speed = min(speed, max_speed);

// spawn sparks for the engine

var num_sparks = irandom_range(4,10);

for (var i = 0; i < num_sparks; i++)
{
    var spark = instance_create_layer(x,y,layer,obj_spark);
    spark.direction = direction + 180 + irandom_range(-90,90);
    spark.speed = random_range(1.0,1.8);
    spark.image_alpha = random_range(0.3,0.7);
    spark.image_blend = make_color_rgb(255,irandom_range(0,245),0); //can also use make_color_hsv()
}