@echo off
@REM Author: Maingron
@REM Version: 0.3-dev
@REM Description: Open a game with Retroarch
@REM Website: https://maingron.com
@REM Dependencies: Retroarch (https://retroarch.com)

@REM Set the path to Retroarch; Some common paths will also be checked, however.
set "retroarch-exe=C:\Program Files\RetroArch\retroarch.exe"
set "additional-parameters="

goto init
:init_done


:nintendo_consoles
    :.nes
    :.fds
    :.fam
        set "emu-system=nes"
        set "emu-core=mesen"
        goto run

    :.smc
    :.sfc
    :.srm
        set "emu-system=snes"
        set "emu-core=snes9x"
        goto run

    :.n64
    :.v64
    :.z64
    :.ndd
        set "emu-system=n64"
        set "emu-core=mupen64plus_next"
        @REM set "emu-core=parallel"
        goto run

    :.gc
    :.gcz
    :.gcm
        set "emu-system=gc"
        set "emu-core=dolphin"
        goto run

    :.wii
    :.wad
    :.wbfs
    :.wdf
        set "emu-system=wii"
        set "emu-core=dolphin"
        goto run

    :.wiiu
        set "emu-system=wiiu"
        set "emu-core=dolphin"
        goto run

    :.gb
        set "emu-system=gb"
        set "emu-core=gambatte"
        goto run

    :.gbc
        set "emu-system=gbc"
        set "emu-core=gambatte"
        goto run

    :.gba
        set "emu-system=gba"
        set "emu-core=mgba"
        goto run

    :.nds
        set "emu-system=nds"
        set "emu-core=desmume"
        @REM set "emu-core=melonDS"
        goto run

    :.3ds
    :.3dsx
    :.3dz
    :.cia
        set "emu-system=3ds"
        set "emu-core=citra"
        goto run


:sony_consoles
    :.psp
        set "emu-system=psp"
        set "emu-core=ppsspp"
        goto run

    :.vita
        set "emu-system=ps-vita"
        set "emu-core="
        goto run

    :.psx
    :.ps1
    :.ecm
    :.cue
    :.ccd
        set "emu-system=psx"
        set "emu-core=pcsx_rearmed"
        goto run

    :.ps2
        set "emu-system=ps2"
        set "emu-core=pcsx2"
        goto run

    :.ps3
        set "emu-system=ps3"
        set "emu-core="
        goto run

    :.ps4
        set "emu-system=ps4"
        set "emu-core="
        goto run


:sega_consoles
    :.sms
        set "emu-system=sega-master-system"
        set "emu-core=genesis_plus_gx"
        goto run
    
    :.smd
    :.gen
        set "emu-system=sega-genesis"
        set "emu-core=genesis_plus_gx"
        goto run

    :.gg
        set "emu-system=sega-game-gear"
        set "emu-core=genesis_plus_gx"
        goto run

    :.32x
        set "emu-system=sega-32x"
        set "emu-core=genesis_plus_gx"
        goto run

    :gdi
        set "emu-system=sega-dreamcast"
        set "emu-core=genesis_plus_gx"
        goto run

    :.neogeo
        set "emu-system=neogeo"
        set "emu-core=neocd"
        goto run


:atari_consoles
    :.a26
        set "emu-system=atari-2600"
        set "emu-core=stella"
        goto run

    :.a52
        set "emu-system=atari-5200"
        set "emu-core=atari800"
        goto run

    :.a78
        set "emu-system=atari-7800"
        set "emu-core=prosystem"
        goto run
        
    :.lnx
        set "emu-system=atari-lynx"
        set "emu-core="
        goto run

    :.jag
    :.jcg
        set "emu-system=atari-jaguar"
        set "emu-core="
        goto run


:commodore_consoles
    :.hdf
        set "emu-system=commodore-amiga"
        set "emu-core=puae"
        goto run

    :.c64
        set "emu-system=commodore-64"
        set "emu-core="
        goto run

    :.c128
        set "emu-system=commodore-128"
        set "emu-core=vice_x128"
        goto run

    :.vic
        set "emu-system=commodore-vic20"
        set "emu-core="
        goto run


:microsoft_consoles
    :.xex
        set "emu-system=xbox"
        set "emu-core="
        goto run








:run
    :run-checks
        goto check-core_set

    :run-run
        start %retroarch-exe% -L %emu-core% %1 %additional-parameters%
        echo Started %rom-name% with %emu-core%.
        ping localhost -n 3 -w 500 > nul
    exit



:init
    set "rom-path=%~dp1"
    set "rom-name=%~nx1"
    set "rom-ext=%~x1"

    title Open With Retroarch - %rom-name%

    goto scan_for_retroarch
    :retroarch_scan_done

    IF NOT DEFINED rom-ext (goto error-no_input_ext)
    goto %rom-ext%

    @REM Notes and useful links regarding this project:
    @REM https://teksyndicate.com/the-best-retroarch-cores-2022-desktop-performance-options-for-raspberry-pi-etc/

    goto error-nono_fileext
    exit




:path_finding_stuff
    :scan_for_retroarch
        if exist "%retroarch-exe%" (
            goto retroarch_scan_done
        ) else (
            set "retroarch-exe="
        )
        if exist "retroarch.lnk" (
            set "retroarch-exe=retroarch.lnk"
        ) else if exist "retroarch.exe" (
            set "retroarch-exe=retroarch.exe"
        ) else if exist "retroarch\retroarch.exe" (
            set "retroarch-exe=retroarch\retroarch.exe"
        ) else if exist "%PROGRAMFILES%\RetroArch\retroarch.exe" (
            set "retroarch-exe=%PROGRAMFILES%\RetroArch\retroarch.exe"
        ) else if exist "%PROGRAMFILES(X86)%\RetroArch\retroarch.exe" (
            set "retroarch-exe=%PROGRAMFILES(X86)%\RetroArch\retroarch.exe"
        ) else if exist "%PROGRAMFILES(X86)%\Steam\steamapps\common\RetroArch\retroarch.exe" (
            set "retroarch-exe=%PROGRAMFILES(X86)%\Steam\steamapps\common\RetroArch\retroarch.exe"
        ) else if exist "%appdata%\retroarch\retroarch.exe" (
            set "retroarch-exe=%appdata%\retroarch\retroarch.exe"
        ) else if exist "G:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe" (
            set "retroarch-exe=G:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe"
        )

        goto check-retroarch-available



:check_stuff
    :check-core_set
        IF NOT DEFINED emu-core (goto error-no_core_defined)
        goto run-run

    :check-retroarch-available
        IF NOT DEFINED retroarch-exe (goto error-no_retroarch_found)
        goto retroarch_scan_done



:error_stuff

    :error-no_fileext
        echo File extension %rom-ext% not defined.
        goto list-variables
        goto eof

    :error-no_input_ext
        echo No input file or input file extension not passed to script.
        goto list-variables
        goto eof

    :error-no_core_defined
        echo No core defined for %emu-system%. Please edit the script and add a core for this system.
        echo You can CTRL+F and search for ":%rom-ext%" to find the section you need to edit.
        echo.
        echo By the way: If you know of a core that works for this system, please submit a pull request on GitHub.
        goto list-variables
        goto eof

    :error-no_retroarch_found
        echo No RetroArch executable found.
        echo Please make sure RetroArch is installed and that the script can find it.
        echo You can also create a shortcut to RetroArch.exe and name it "retroarch.lnk" and place it in the same folder as this script.
        echo If you have RetroArch installed in a non-standard location, you can edit the script and add the path to the RetroArch executable.
        goto list-variables
        goto eof

    :list-variables
        echo.
        echo --------------------
        echo Variables in use:
        echo retroarch-exe = %retroarch-exe%
        echo rom-path = %rom-path%
        echo rom-name = %rom-name%
        echo rom-ext = %rom-ext%
        echo emu-system = %emu-system%
        echo emu-core = %emu-core%
        echo --------------------
        pause

:eof
exit
