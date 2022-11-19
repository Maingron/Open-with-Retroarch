@echo off
set "retroarch-exe=G:\SteamLibrary\steamapps\common\RetroArch\retroarch.exe"
set "rom-path=%~dp1"
set "rom-name=%~nx1"
set "rom-ext=%~x1"

IF NOT DEFINED rom-ext (goto error-no_input_ext)
goto %rom-ext%

@REM https://teksyndicate.com/the-best-retroarch-cores-2022-desktop-performance-options-for-raspberry-pi-etc/

:nintendo_consoles

    :.nes
        set "emu-system=nes"
        set "emu-core=mesen"
        goto run

    :.smc
    :.sfc
        set "emu-system=snes"
        set "emu-core=snes9x"
        goto run

    :.n64
    :.z64
    :.v64
        set "emu-system=n64"
        set "emu-core=mupen64plus_next"
        @REM set "emu-core=parallel"
        goto run

    :.gc
    :.gcz
        set "emu-system=gc"
        set "emu-core=dolphin"
        goto run

    :.wii
    :.wad
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
    :.cia
        set "emu-system=3ds"
        set "emu-core=citra"
        goto run


:sony_consoles

    :.psp
        set "emu-system=psp"
        set "emu-core=ppsspp"

    :.vita
        set "emu-system=ps-vita"
        set "emu-core="

    :.psx
        set "emu-system=psx"
        set "emu-core="

    :.ps2
        set "emu-system=ps2"
        set "emu-core="

    :.ps3
        set "emu-system=ps3"
        set "emu-core="

    :.ps4
        set "emu-system=ps4"
        set "emu-core="


:microsoft_consoles

    :.xex
        set "emu-system=xbox"
        set "emu-core="





:run
    start %retroarch-exe% -L %emu-core% %1
    exit


:error_stuff

    :error-no_fileext
        echo File extension %rom-ext% not defined.
        goto list-variables
        goto eof

    :error-no_input_ext
        echo No input file or input file extension not passed to script.
        goto list-variables
        goto eof

    :list-variables
        echo rom-path = %rom-path%
        echo rom-name = %rom-name%
        echo rom-ext = %rom-ext%
        echo emu-system = %emu-system%
        echo emu-core = %emu-core%
        pause

:eof
exit
