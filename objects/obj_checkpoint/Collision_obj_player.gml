if (!active) {
    other.respawn_x = x;
    other.respawn_y = y;

    global.saplings_saved = global.saplings_collected;

    // Save the current collected saplings list
    if (variable_global_exists("saplings_collected_list")) {
        global.saplings_saved_list = ds_list_create();
        ds_list_copy(global.saplings_saved_list, global.saplings_collected_list);
    }

    active = true;
}
