// If need to respawn player

if (global.need_respawn)
{
    global.need_respawn = false; // turn off flag
    
    if global.lives > 0 
    {
        global.lives--;
        var player = instance_create_layer(room_width/2,room_height/2,layer,obj_player); //respawn player
    }
    else 
    {
    	// game over when no lives left
        global.gameover = true;
        
    }
}