@echo off
@REM Author: Maingron
@REM Description: Open a game with Retroarch
@REM Website: https://maingron.com
@REM Dependencies: Retroarch (https://retroarch.com)


set "retroarch-exe=G:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe"
set "rom-path=%~dp1"
set "rom-name=%~nx1"
set "rom-ext=%~x1"
title Open With Retroarch - %rom-name%

IF NOT DEFINED rom-ext (goto error-no_input_ext)
goto %rom-ext%

@REM https://teksyndicate.com/the-best-retroarch-cores-2022-desktop-performance-options-for-raspberry-pi-etc/

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
        start %retroarch-exe% -L %emu-core% %1
    exit

:check_stuff
    :check-core_set
        IF NOT DEFINED emu-core (goto error-no_core_defined)

    goto run-run


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
