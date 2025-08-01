// screenwrap, cooldown, energy, and other things you want to do after all animations, etc are completed

move_wrap(true, true, 10);

if (cooldown_primary > 0)
{
    cooldown_primary -= 1;
}

// Handler energy cooldown
if (energy_regen_cooldown > 0)
{
    energy_regen_cooldown -= 1;
    if (energy_regen_cooldown <= 0)
    {
        energy_regen_rate = 1.0;
    }
}

// Regen energy
energy += (energy_regen * energy_regen_rate);
energy = min(energy, energy_max);

// Invulnerability Cooldown
if (invulnerable_timer > 0 and room != 0)
{
    // visual feedback with transparency and color that invulnerable
    image_alpha = 0.4
    image_blend = c_aqua
    invulnerable_timer--;
    
    if (invulnerable_timer <= 0)
    {
        // visual feed of removing transparency and color to show end of invulnerable time
        image_alpha = 1.0;
        image_blend = c_white;
    }
}