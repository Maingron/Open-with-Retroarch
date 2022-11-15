set "retroarch-exe=G:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe"
set "rom-path=%~dp1"
set "rom-name=%~nx1"
set "rom-ext=%~x1"

set "nes=mesen"

set core-nes = "mesen"
set core-snes = "snes9x"
set core-gb = "gambatte"
set core-gba = "mgba"
set core-gbc = "gambatte"


:file_associations
    @REM Nintendo
    if(%rom-ext% in (".nes")) set emu-system = "nes"
    if(%rom-ext% in (".sfc", ".smc")) set emu-system = "snes"
    if(%rom-ext% in (".n64", ".z64", "v64")) set emu-system = "n64"
    if(%rom-ext% in (".gc", ".gcz")) set emu-system = "gc"
    if(%rom-ext% in (".wii", ".wad")) set emu-system = "wii"
    if(%rom-ext% in (".wiiu", ".wud")) set emu-system = "wiiu"
    if(%rom-ext% in (".gb")) set emu-system = "gb"
    if(%rom-ext% in (".gbc")) set emu-system = "gbc"
    if(%rom-ext% in (".gba")) set emu-system = "gba"
    if(%rom-ext% in (".nds")) set emu-system = "nds"
    if(%rom-ext% in (".3ds", ".3dsx", ".cci", ".3dz", ".cia")) set emu-system = "3ds"

    @REM Sony
    if(%rom-ext% in (".psp")) set emu-system = "psp"
    if(%rom-ext% in (".vita")) set emu-system = "ps-vita"
    if(%rom-ext% in (".psx")) set emu-system = "psx"
    if(%rom-ext% in (".ps2")) set emu-system = "ps2"
    if(%rom-ext% in (".ps3")) set emu-system = "ps3"
    if(%rom-ext% in (".ps4")) set emu-system = "ps4"

    @REM Microsoft
    if(%rom-ext% in (".xex")) set emu-system = "xbox"


:core_selection
    if(%emu-system% == "nes") set core = %core-nes%
    if(%emu-system% == "snes") set core = %core-snes%
    if(%emu-system% == "gb") set core = %core-gb%
    if(%emu-system% == "gba") set core = %core-gba%
    if(%emu-system% == "gbc") set core = %core-gbc%

    if not defined core (
        echo No core found for %rom-ext%
        exit /b 1
    )

    echo %core%
switch(%emu-system%) {
case "nes"
    set emulator = "retroarch" && set core = "mesen"
    break
case "snes"
    set emulator = "retroarch" && set core = "snes9x"
    break
case "n64"
    set emulator = "retroarch" && set core = "mupen64plus"
    break
}
goto :run


:run
    switch(%emulator%)

    case "retroarch"
        %retroarch-exe% -L %core% %1

    exit

    default
        echo "No emulator found for %rom-ext%"
        exit

    %retroarch-exe% -L %retroarch-core% %1
    exit
