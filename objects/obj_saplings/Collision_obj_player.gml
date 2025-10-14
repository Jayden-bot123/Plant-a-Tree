if (active) {
    audio_play_sound(snd_coin, 0, false);

    global.saplings_collected += 1;

    // Mark this sapling as collected
    active = false;
    visible = false;

    // Save its ID into a global list of collected saplings
    if (!variable_global_exists("saplings_collected_list"))
	{
        global.saplings_collected_list = ds_list_create();
    }
    ds_list_add(global.saplings_collected_list, sapling_id);
}
