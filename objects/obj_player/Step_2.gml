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