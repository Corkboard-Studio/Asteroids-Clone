/// @description Asteroids bounce 180 degrees when colliding with another asteroid
/// Very unrealistic physics, but this is what was used in the tutorial
/// Note to future self: Change this if you want to improve the feel and polish of the game

direction += 180;
audio_play_sound(snd_asteroids_collide,1,false);

// push away from asteroid after collision (reset position)
x = xprevious;
y = yprevious;