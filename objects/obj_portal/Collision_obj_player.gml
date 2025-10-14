if (open && !activated)
{
    activated = true; // ensure it won't trigger twice
    audio_play_sound(snd_portal, 0, false);
    room_goto_next();
}
