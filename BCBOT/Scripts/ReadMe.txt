--[[
    Talisman Online Lua Script README

    This Lua script is crafted to automate various actions within Talisman Online, enhancing your gaming experience. Below, you'll find a breakdown of each variable utilized in the script:

    Variables:

    User Configuration:

    - `mountkey`: Key for mounting your character.
    - `windcontrolling`: Key assigned for wind control.
    - `healskill`: Slot designated for healing skills.
    - `attackskills`: Slot reserved for offensive abilities.
    - `aoe`: Slot dedicated to Area of Effect (AOE) attacks.
    - `stonecitycharm`: Charm slot utilized for Stone City.
    - `buff1`, `buff2`: Keys employed to activate buffs.
    - `Petfood`: Quantity of pet food available.
    - `pet`: Key for summoning your pet.

    Presets:

    - `CHAR_NAME`: Your character's designation.
    - `ADDTEAM`: Define whether adding a teammate is from the blocklist ("BLOCK") or foelist ("FOE") (default is "FOE").
    - `WeakChar`: Indicate if your character is considered weak ("YES") or not ("NO").
      - When `WeakChar` is set to "YES", the script automatically adds battle potions to the attack skill and healing potions to the slot specified for healing.
    - `Fairy`: Specify if your character is a Fairy ("YES") or not ("NO").

    Other Settings:

    - `HeroBadge`: Enable ("ON") or disable ("OFF") the conversion of courage badges upon reaching 1000.
    - `SoulBell`: Toggle the Soul Bell feature ("ON" or "OFF").
    - `Health_Check`: Set the percentage value (0 to 100) representing when your character should heal based on total health.
    - `gamePath`: Path leading to the game launcher.
    - `Game_Server`: Specify the game server using the following abbreviations:
      - Estival Echo: EE
      - Deep Gaze: DG
      - Wild Wave: WW
      - Giant Sky Medal: GSM
      - Tiger Fish: TF
      - All Stars: AS
      - Lightning in the Darkness: LiD

    Usage:

    1. Customize your character's name, key bindings, and skill slots according to your preferences.
    2. Adjust presets and other settings as required.
    3. Ensure the correct game path is provided.
    4. Execute the script within your Lua environment.

    Notes:

    - This script relies on external modules `Bot` and `BC`; ensure they are correctly installed and accessible.
    - For additional context and usage instructions, refer to the provided YouTube video.

    Should you require further assistance or have any inquiries, please consult the provided resources or reach out to the script author. Happy gaming!
]]
