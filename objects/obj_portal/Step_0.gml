// ALWAYS update portal state (do NOT wrap in a pause check)
if (global.saplings_collected >= 5) {
    open = true;
    sprite_index = spr_portal_activated;
} else {
    open = false;
    sprite_index = spr_portal;
    // reset activation if portal closed (optional)
    activated = false;
}
