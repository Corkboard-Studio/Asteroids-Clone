global.score = 0;
global.lives = 2; // The UI shows number of lives remaining, not including current life; start with 3 lives
global.level = 1;
global.need_respawn = false;
global.gameover = false;
global.current_weapon = 1;

global.wx = window_get_width();
global.wy = window_get_height();
global.scale = 0.6;
window_set_size(global.wx*global.scale,global.wy*global.scale);
display_set_gui_maximise(global.scale, global.scale, 0, 0);
