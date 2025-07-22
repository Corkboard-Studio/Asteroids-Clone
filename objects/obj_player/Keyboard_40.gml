// Move slow down

//using if

//if speed < max_speed
//{
    //speed -= acceleration/2;
//}
friction = 0;
speed -= acceleration/2;
speed = max(speed, -max_speed);