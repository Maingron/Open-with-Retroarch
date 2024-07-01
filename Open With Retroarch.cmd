@echo off
@REM Author: Maingron
@REM Version: 0.5-dev
@REM Description: Open a game with Retroarch | GitHub: https://github.com/Maingron/Open-with-Retroarch
@REM Website: https://maingron.com
@REM Dependencies: Retroarch (https://retroarch.com)

@REM Set the path to Retroarch; Some common paths will also be checked, however.

@REM CONFIGURATION:
set "retroarch-exe=C:\Program Files\RetroArch\retroarch.exe"
set "additional-parameters="
call :echoheader

goto init
:init_done




:nintendo_consoles
    :.nes
    :.nez
    :.unf
    :.unif
    :.fds
    :.fam
        set "emu-system=nes"
        set emu-core="mesen" "nestopia" "quicknes" "fceumm"

        set "callback=callback_nes"
        goto check_core_available
            :callback_nes

        goto run

    :.smc
    :.sfc
        set "emu-system=snes"
        set emu-core="snes9x" "snes9x2002" "snes9x2005" "snes9x2005_plus" "snes9x2005_next" "bsnes_mercury_accuracy" "bsnes_mercury_balanced" "bsnes_mercury_performance" "bsnes_cplusplus98" "bsnes_balanced" "bsnes_performance" "bsnes_accuracy" "bsnes_hd"

        set "callback=callback_snes"
        goto check_core_available
            :callback_snes

        goto run

    :.n64
    :.v64
    :.z64
    :.ndd
        set "emu-system=n64"
        set emu-core="mupen64plus_next" "mupen64plus" "parallel_n64" "parallel"
        
        set "callback=callback_n64"
        goto check_core_available
            :callback_n64

        goto run

    :.gc
    :.gcm
    :.gcz
    :.rvz
        set "emu-system=gc"
        set emu-core="dolphin" "dolphin-emu"

        set "callback=callback_gc"
        goto check_core_available
            :callback_gc

        goto run

    :.wii
    :.wia
    :.wad
    :.wbfs
    :.wdf
    :.dol
        set "emu-system=wii"
        set emu-core="dolphin" "dolphin-emu"

        set "callback=callback_wii"
        goto check_core_available
            :callback_wii

        goto run

    :.wiiu
    :.wud
    :.rpx
    :.wux
        set "emu-system=wiiu"
        set emu-core="cemu" "cemu_1_15_20" "dolphin" "dolphin-emu"

        set "callback=callback_wiiu"
        goto check_core_available
            :callback_wiiu

        goto run

    :.vb
    :.vboy
        set "emu-system=vb"
        set emu-core="mednafen_vb" "vbam"

        set "callback=callback_vb"
        goto check_core_available
            :callback_vb

        goto run

    :.gb
        set "emu-system=gb"
        set emu-core="gambatte" "basicboy" "gnuboy" "sameboy" "tgb_dual" "tgb_dx" "tgb_single" "vba" "vba-m" "visualboyadvance" "visualboyadvance-m"

        set "callback=callback_gb"
        goto check_core_available
            :callback_gb

        goto run

    :.gbc
        set "emu-system=gbc"
        set emu-core="gambatte" "basicboy" "gnuboy" "sameboy" "tgb_dual" "tgb_dx" "tgb_single" "vba" "vba-m" "visualboyadvance" "visualboyadvance-m"

        set "callback=callback_gbc"
        goto check_core_available
            :callback_gbc

        goto run

    :.gba
    :.agb
        set "emu-system=gba"
        set emu-core="mgba" "mgba-qt" "mgba_sdl" "mgba_libretro" "vba" "vba-m" "visualboyadvance" "visualboyadvance-m"

        set "callback=callback_gba"
        goto check_core_available
            :callback_gba

        goto run

    :.nds
    :.srl
    :.ids
        set "emu-system=nds"
        set emu-core="desmume" "melonds" "melonDS"

        set "callback=callback_nds"
        goto check_core_available
            :callback_nds

        goto run

    :.dsi
    :.dsiware
        set "emu-system=dsi"
        set emu-core="desmume" "melonds" "melonDS" "twlmenu" "citra"

        set "callback=callback_dsi"
        goto check_core_available
            :callback_dsi

        goto run

    :.3ds
    :.3dsx
    :.3dz
    :.cia
        set "emu-system=3ds"
        set emu-core="citra" "citra_canary" "citra_nightly"

        set "callback=callback_3ds"
        goto check_core_available
            :callback_3ds

        goto run

    :.nca
    :.nsp
    :.xci
    :.nro
    :.nso
        set "emu-system=switch"
        set emu-core="yuzu" "ryujinx"

        set "callback=callback_switch"
        goto check_core_available
            :callback_switch

        goto run


:sony_consoles
    :.psp
    :.psp.iso
        set "emu-system=psp"
        set emu-core="ppsspp"
        
        set "callback=callback_psp"
        goto check_core_available
            :callback_psp

        goto run

    :.vita
    :.vpk
        set "emu-system=ps-vita"
        set emu-core="vita3k"

        set "callback=callback_vita"
        goto check_core_available
            :callback_vita

        goto run

    :.psx
    :.ps1
    :.ps1.iso
    :.ecm
    :.cue
    :.ccd
    :.sbl
    :.sub
        set "emu-system=psx"
        set emu-core="pcsx_rearmed" "pcsx" "psx"

        set "callback=callback_psx"
        goto check_core_available
            :callback_psx

        goto run

    :.ps2
    :.ps2.iso
        set "emu-system=ps2"
        set emu-core="pcsx2"

        set "callback=callback_ps2"
        goto check_core_available
            :callback_ps2

        goto run

    :.ps3
    :.ps3.iso
        set "emu-system=ps3"
        set emu-core="rpcs3"

        set "callback=callback_ps3"
        goto check_core_available
            :callback_ps3

        goto run

    :.ps4
    :.ps4.iso
        set "emu-system=ps4"
        set emu-core="orbital"

        set "callback=callback_ps4"
        goto check_core_available
            :callback_ps4

        goto run

    :.ps5
    :.ps5.iso
        set "emu-system=ps5"
        set emu-core="orbital"

        set "callback=callback_ps5"
        goto check_core_available
            :callback_ps5

        goto run


:sega_consoles
    :.sms
        set "emu-system=sega-master-system"
        set emu-core="genesis_plus_gx" "smsplus" "smsplus_gx" "smsplus_libretro"

        set "callback=callback_sms"
        goto check_core_available
            :callback_sms

        goto run
    
    :.smd
    :.gen
    :.md
        set "emu-system=sega-genesis"
        set emu-core="genesis_plus_gx" "picodrive"

        set "callback=callback_gen"
        goto check_core_available
            :callback_gen

        goto run

    :.gg
        set "emu-system=sega-game-gear"
        set emu-core="genesis_plus_gx" "smsplus" "smsplus_gx" "smsplus_libretro"

        set "callback=callback_gg"
        goto check_core_available
            :callback_gg

        goto run

    :.32x
        set "emu-system=sega-32x"
        set emu-core="genesis_plus_gx" "picodrive"

        set "callback=callback_32x"
        goto check_core_available
            :callback_32x

        goto run

    :.gdi
    :.cdi
        set "emu-system=sega-dreamcast"
        set emu-core="genesis_plus_gx" "picodrive" "redream"

        set "callback=callback_dc"
        goto check_core_available
            :callback_dc

        goto run

    :.neogeo
    :.ng
        set "emu-system=neogeo"
        set emu-core="neocd" "fbneo"

        set "callback=callback_neogeo"
        goto check_core_available
            :callback_neogeo

        goto run

    :.ngp
    :.ngc
        set "emu-system=neogeo-pocket"
        set emu-core="neopop" "mednafen_ngp"

        set "callback=callback_ngp"
        goto check_core_available
            :callback_ngp

        goto run


:atari_consoles
    :.a26
        set "emu-system=atari-2600"
        set emu-core="stella" "stella2014" "stella_libretro"

        set "callback=callback_a26"
        goto check_core_available
            :callback_a26

        goto run

    :.a52
        set "emu-system=atari-5200"
        set emu-core="atari800" "atari800_libretro" "atari800_alt" "atari800_alt_libretro"

        set "callback=callback_a52"
        goto check_core_available
            :callback_a52

        goto run

    :.a78
        set "emu-system=atari-7800"
        set emu-core="prosystem" "atari800"

        set "callback=callback_a78"
        goto check_core_available
            :callback_a78

        goto run
        
    :.lnx
        set "emu-system=atari-lynx"
        set emu-core="handy" "mednafen_lynx"

        set "callback=callback_lnx"
        goto check_core_available
            :callback_lnx

        goto run

    :.jag
    :.jcg
        set "emu-system=atari-jaguar"
        set emu-core="virtualjaguar"

        set "callback=callback_jag"
        goto check_core_available
            :callback_jag

        goto run


:commodore_consoles
    :.hdf
        set "emu-system=commodore-amiga"
        set emu-core="puae"

        set "callback=callback_amiga"
        goto check_core_available
            :callback_amiga

        goto run

    :.c64
    :.d64
    :.t64
    :.prg
        set "emu-system=commodore-64"
        set emu-core="vice_x64" "vice_x64sc" "vice_x64dt

        set "callback=callback_c64"
        goto check_core_available
            :callback_c64

        goto run

    :.c128
        set "emu-system=commodore-128"
        set emu-core="vice_x128" "vice_x128sc" "vice_x128dt"

        set "callback=callback_c128"
        goto check_core_available
            :callback_c128

        goto run

    :.vic
        set "emu-system=commodore-vic20"
        set emu-core="vice_xvic" "vice_xvicsc" "vice_xvicdt"

        set "callback=callback_vic"
        goto check_core_available
            :callback_vic

        goto run

    :.pet
        set "emu-system=commodore-pet"
        set emu-core="vice_xpet" "vice_xpetsc" "vice_xpetdt"

        set "callback=callback_pet"
        goto check_core_available
            :callback_pet

        goto run


:microsoft_consoles
    :.xex
    :.xbe
    :.xbox
    :.xiso
    :.xiso.iso
        set "emu-system=xbox"
        set emu-core="xqemu" "xemu" "cxbx_reloaded" "xenia"

        set "callback=callback_xbox"
        goto check_core_available
            :callback_xbox

        goto run

    :.x360
    :.xbla
    :.xbl
    :.xbox360
        set "emu-system=xbox360"
        set emu-core="xenia"

        set "callback=callback_x360"
        goto check_core_available
            :callback_x360

        goto run

    :.xone
    :.xboxone
    :.xb1
    :.xbo
    :.xbone
        set "emu-system=xboxone"
        set emu-core="xenia" "xqemu" "xemu" "cxbx_reloaded"

        set "callback=callback_xone"
        goto check_core_available
            :callback_xone

        goto run

    :.xbsx
    :.xboxseriesx
    :.xboxsx
    :.xbs
    :.xboxseries
    :.xboxss
        set "emu-system=xboxseriesx"
        set emu-core="xemu" "xenia" "xqemu" "cxbx_reloaded"

        set "callback=callback_xbsx"
        goto check_core_available
            :callback_xbsx

        goto run

    :.com
    :.dos
    :.exe
    :.msdos
    :.win
        set "emu-system=pc"
        set emu-core="dosbox"

        set "callback=callback_dos"
        goto check_core_available
            :callback_dos

        goto run

    :.win3x
    :.win31
    :.win95
    :.win98
    :.winme
    :.winnt
    :.win2000
    :.winxp
    :.i386
    :.ibm
        set "emu-system=pc"
        set emu-core="pcem" "86box"

        set "callback=callback_win"
        goto check_core_available
            :callback_win

        goto run


:other_consoles
    :.mgw
        set "emu-system=msx"
        set emu-core="blueMSX" "bluemsx" "fmsx" "openmsx"

        set "callback=callback_msx"
        goto check_core_available
            :callback_msx

        goto run

    :.pce
    :.pcecd
        set "emu-system=pc-engine"
        set emu-core="mednafen_pce_fast" "mednafen_supergrafx" "mednafen_pce" "mednafen_supergrafx"

        set "callback=callback_pce"
        goto check_core_available
            :callback_pce

        goto run

    :.sgx
        set "emu-system=pc-engine-supergrafx"
        set emu-core="mednafen_pce_fast" "mednafen_supergrafx" "mednafen_pce" "mednafen_supergrafx"

        set "callback=callback_sgx"
        goto check_core_available
            :callback_sgx

        goto run

    :.wswan
    :.wswanc
    :.ws
    :.wsc
        set "emu-system=wonderswan"
        set emu-core="mednafen_wswan" "mednafen_wswanc" "mednafen_wswan_color" "mednafen_wswanc_color"

        set "callback=callback_wswan"
        goto check_core_available
            :callback_wswan

        goto run

    :.zxs
    :.tzx
        set "emu-system=zxspectrum"
        set emu-core="fuse" "zxbox"

        set "callback=callback_zxs"
        goto check_core_available
            :callback_zxs

        goto run

    :.apk
        set "emu-system=android"
        set emu-core=""

        set "callback=callback_android"
        goto check_core_available
            :callback_android

        goto run

    :.ipa
        set "emu-system=ios"
        set emu-core=""

        set "callback=callback_ios"
        goto check_core_available
            :callback_ios

        goto run

    :.p8
    :.pico8
        set "emu-system=pico-8"
        set emu-core="retro8" "pico8" "pico-8"

        set "callback=callback_pico8"
        goto check_core_available
            :callback_pico8

        goto run
    
    :.tic
    :.tic80
    :.t80
        set "emu-system=tic-80"
        set emu-core="tic80" "tic-80"

        set "callback=callback_tic80"
        goto check_core_available
            :callback_tic80

        goto run

    :.sv
    :.svi
        set "emu-system=supervision"
        set emu-core="potator" "mednafen_sv"

        set "callback=callback_sv"
        goto check_core_available
            :callback_sv

        goto run


:run
    :run-checks
        goto check-core_set

    :run-run
        start "" "%retroarch-exe%" -L %emu-core% %1 %additional-parameters%
        echo Started %rom-name% with %emu-core%.
        ping localhost -n 3 -w 500 > nul
    exit



:init
    set "rom-path=%~dp1"
    set "rom-name=%~nx1"
    set "rom-ext=%~x1"
    title Open With Retroarch - %rom-name%

    call :getRetroarchExe
    set "retroarch-exe=%errorlevel%"

    goto check-retroarch-available
        :retroarch_scan_done

    call :getRetroarchDirFromExe %retroarch-exe%
    set "retroarch-dir=%errorlevel%"

    call :getRetroarchCoreDirFromDir %retroarch-dir%
    set "retroarch-cores-dir=%errorlevel%"

    IF NOT DEFINED rom-ext (goto error-no_input_ext)
    goto %rom-ext%

    @REM Notes and useful links regarding this project:
    @REM https://teksyndicate.com/the-best-retroarch-cores-2022-desktop-performance-options-for-raspberry-pi-etc/

    goto error-no_fileext
    exit


:path_finding_stuff
    :check_core_available
        @REM Loop through array
        FOR %%i IN (%emu-core%) DO (
            @REM save value of first array item
            if not defined emu-core_first (
                set "emu-core_first=%%%i"
            )

            @REM Check if file exists
            IF EXIST "%retroarch-cores-dir%%%i_libretro.dll" (
                @REM Set variable
                set "emu-core=%%%i"
                goto %callback%
            ) else (
                set "emu-core=%emu-core_first%"
            )
        )

        IF NOT DEFINED emu-core (
            echo No core files found for %emu-system% in core-list. Falling back to first core in list and trying %emu-core_first%
            set "emu-core=%emu-core_first%"
        )

        goto %callback%


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
        echo retroarch-dir = %retroarch-dir%
        echo retroarch-cores-dir = %retroarch-cores-dir%
        echo rom-path = %rom-path%
        echo rom-name = %rom-name%
        echo rom-ext = %rom-ext%
        echo emu-system = %emu-system%
        echo emu-core = %emu-core%
        echo --------------------
        pause

:eof
exit

@REM New "functions" as of 0.5-dev folliwing below this line:


:echoheader
mode con cols=50 lines=20
echo Open with Retroarch
echo By Maingron - https://maingron.com
echo --------------------------------------------------
exit /b %errorlevel%

:getRetroarchExe
    set "retroarch-exe="

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

    set "errorlevel=%retroarch-exe%"
exit /b %errorlevel%

:getRetroarchDirFromExe
    set "pathToExe=%1"

    FOR %%i IN (%pathToExe%) DO set "retroarch-dir=%%~dpi"
    set "errorlevel=%retroarch-dir%"
exit /b %errorlevel%

:getRetroarchCoreDirFromDir
    set "retroarchDir=%1"

    set "coreDir=%retroarchDir%cores\"

    set "errorlevel=%coreDir%"
exit /b %errorlevel%


:getPubColor
    set "publisher=%1"

    set "color=0f"

    if %publisher% == "nintendo" (
        set "color=40"
    ) else if %publisher% == "sony" (
        set "color=30"
    ) else if %publisher% == "commodore" (
        set "color=e0"
    ) else if %publisher% == "sega" (
        set "color=10"
    ) else if %publisher% == "atari" (
        set "color=d0"
    ) else if %publisher% == "microsoft" (
        set "color=a0"
    ) else (
        set "color=0f"
    )

    set "errorlevel=%color%"
exit /b %errorlevel%
