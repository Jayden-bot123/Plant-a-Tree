audio_play_sound(snd_death, 0, false);

// Respawn player
other.x = other.respawn_x;
other.y = other.respawn_y;

// Restore sapling progress
global.saplings_collected = global.saplings_saved;

// Restore sapling list to checkpoint state
if (variable_global_exists("saplings_saved_list")) 
{
    ds_list_destroy(global.saplings_collected_list);
    global.saplings_collected_list = ds_list_create();
    ds_list_copy(global.saplings_collected_list, global.saplings_saved_list);
}

// Reset only saplings collected AFTER the checkpoint
with (obj_saplings) 
{
	
    if (ds_list_find_index(global.saplings_collected_list, sapling_id) == -1) 
	{
        // Not in the saved list -> should respawn
        visible = true;
        active = true;
    } else 
	{
        // Was already collected before checkpoint -> stay gone
        visible = false;
        active = false;
    }
}
