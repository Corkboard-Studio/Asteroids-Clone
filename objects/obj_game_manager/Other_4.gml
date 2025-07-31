// More asteroids at higher levels

if (global.level > 3)
{
    // Adds additional asteroids at higher levels
    var additional_asteroids = global.level - 3;
    for (var i= 0; i < additional_asteroids; i++)
    {
        instance_create_layer(irandom(room_width),irandom(room_height),layer,obj_asteroid_lg);
    }
    
}