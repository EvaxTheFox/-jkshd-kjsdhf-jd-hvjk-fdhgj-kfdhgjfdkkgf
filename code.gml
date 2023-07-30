if (MENU_NO == 1 || MENU_NO == 4 || MENU_NO == 6 || MENU_NO == 7)
{
    if left_p()
    {
        if (MENUCOORD[MENU_NO] == 1)
        {
            MENUCOORD[MENU_NO] = 0
            MOVENOISE = 1
        }
    }
    if right_p()
    {
        if (MENUCOORD[MENU_NO] == 0)
        {
            MENUCOORD[MENU_NO] = 1
            MOVENOISE = 1
        }
    }
    if (button1_p() && ONEBUFFER < 0)
    {
        ONEBUFFER = 2
        TWOBUFFER = 2
        SELNOISE = true
        if (MENUCOORD[MENU_NO] == 0)
        {
            if (MENU_NO == 1)
            {
                if (FILE[MENUCOORD[0]] == 1)
                {
                    global.filechoice = MENUCOORD[0]
                    scr_windowcaption(scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_35_0")) // THE DARK
                    snd_free_all()
                    f = instance_create(0, 0, obj_persistentfadein)
                    f.image_xscale = 1000
                    f.image_yscale = 1000
                    if file_exists((("config_" + string(global.filechoice)) + ".ini"))
                    {
                        ini_open((("config_" + string(global.filechoice)) + ".ini"))
                        for (i = 0; i < 10; i += 1)
                        {
                            readval = ini_read_real("KEYBOARD_CONTROLS", string(i), -1)
                            if (readval != -1)
                                global.input_k[i] = readval
                        }
                        for (i = 0; i < 10; i += 1)
                        {
                            readval = ini_read_real("GAMEPAD_CONTROLS", string(i), -1)
                            if (readval != -1)
                                global.input_g[i] = readval
                        }
                        ini_close()
                    }
                    scr_load()
                }
                if (FILE[MENUCOORD[0]] == 0)
                {
                    global.filechoice = MENUCOORD[0]
                    snd_free_all()
                    room_goto(PLACE_CONTACT)
                }
            }
            if (MENU_NO == 4)
            {
                if (TYPE == 0)
                {
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_74_0") // IT CONFORMED TO THE REFLECTION.
                    if (NAME[0] == NAME[1] && NAME[1] == NAME[2])
                    {
                        if (TIME[0] == TIME[1] && TIME[1] == TIME[2])
                        {
                            if (PLACE[0] == PLACE[1] && PLACE[1] == PLACE[2])
                                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_77_0") // WHAT AN INTERESTING BEHAVIOR.
                        }
                    }
                }
                event_user(5)
                if (TYPE == 0)
                {
                    if (NAME[0] == NAME[1] && NAME[1] == NAME[2])
                    {
                        if (TIME[0] == TIME[1] && TIME[1] == TIME[2])
                        {
                            if (PLACE[0] == PLACE[1] && PLACE[1] == PLACE[2] && TEMPCOMMENT != scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_86_0")) // WHAT AN INTERESTING BEHAVIOR.
                                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_86_1") // PREPARATIONS ARE COMPLETE.
                        }
                    }
                }
                if (TYPE == 1)
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_91_0") // Copy complete.
                MESSAGETIMER = 90
                SELNOISE = false
                DEATHNOISE = true
                MENU_NO = 0
            }
            if (MENU_NO == 7)
            {
                FILE[MENUCOORD[5]] = 0
                NAME[MENUCOORD[5]] = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_105_0") // [EMPTY]
                TIME[MENUCOORD[5]] = 0
                PLACE[MENUCOORD[5]] = "------------"
                LEVEL[MENUCOORD[5]] = 0
                TIME_STRING[MENUCOORD[5]] = "--:--"
                file_delete(("filech1_" + string(MENUCOORD[5])))
                iniwrite = ini_open("dr.ini")
                ini_write_string(("G" + string(MENUCOORD[5])), "Name", "[EMPTY]")
                ini_write_real(("G" + string(MENUCOORD[5])), "Level", 0)
                ini_write_real(("G" + string(MENUCOORD[5])), "Love", 0)
                ini_write_real(("G" + string(MENUCOORD[5])), "Time", 0)
                ini_write_real(("G" + string(MENUCOORD[5])), "Room", 0)
                ini_close()
                if file_exists((("config_" + string(MENUCOORD[5])) + ".ini"))
                    file_delete((("config_" + string(MENUCOORD[5])) + ".ini"))
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_126_0") // IT WAS AS IF IT WAS NEVER THERE AT ALL.
                if (TYPE == 1)
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_127_0") // Erase complete.
                MESSAGETIMER = 90
                SELNOISE = false
                DEATHNOISE = true
                MENU_NO = 0
            }
            if (MENU_NO == 6)
            {
                THREAT += 1
                MENU_NO = 7
                MENUCOORD[7] = 0
            }
        }
        if (MENUCOORD[MENU_NO] == 1)
        {
            if (MENU_NO == 4 && TYPE == 0)
            {
                TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_149_0") // IT RETAINED ITS ORIGINAL SHAPE.
                MESSAGETIMER = 90
            }
            if (MENU_NO == 6 || MENU_NO == 7)
            {
                if (TYPE == 0)
                {
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_156_0") // THEN IT WAS SPARED.
                    if (THREAT >= 10)
                    {
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_159_0") // VERY INTERESTING.
                        THREAT = 0
                    }
                    MESSAGETIMER = 90
                }
            }
            MENU_NO = 0
        }
    }
    if (button2_p() && TWOBUFFER < 0)
    {
        ONEBUFFER = 1
        TWOBUFFER = 1
        BACKNOISE = true
        if (MENU_NO == 1)
            MENU_NO = 0
        if (MENU_NO == 4)
            MENU_NO = 2
        if (MENU_NO == 6)
            MENU_NO = 5
        if (MENU_NO == 7)
            MENU_NO = 5
    }
}
if (MENU_NO == 2 || MENU_NO == 3 || MENU_NO == 5)
{
    if down_p()
    {
        if (MENUCOORD[MENU_NO] < 3)
        {
            MENUCOORD[MENU_NO] += 1
            MOVENOISE = 1
        }
    }
    if up_p()
    {
        if (MENUCOORD[MENU_NO] > 0)
        {
            MENUCOORD[MENU_NO] -= 1
            MOVENOISE = 1
        }
    }
    if (button1_p() && ONEBUFFER < 0)
    {
        if (MENUCOORD[MENU_NO] < 3)
        {
            if (MENU_NO == 3)
            {
                if (MENUCOORD[2] != MENUCOORD[3])
                {
                    if (FILE[MENUCOORD[MENU_NO]] == 1)
                    {
                        TWOBUFFER = 2
                        ONEBUFFER = 2
                        SELNOISE = true
                        MENUCOORD[4] = 0
                        MENU_NO = 4
                    }
                    else
                    {
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_225_0") // THE DIVISION IS COMPLETE.
                        MESSAGETIMER = 90
                        if (TYPE == 1)
                            TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_227_0") // Copy complete.
                        DEATHNOISE = true
                        MENU_NO = 0
                        ONEBUFFER = 2
                        TWOBUFFER = 2
                        event_user(5)
                    }
                }
                else
                {
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_238_0") // IT IS IMMUNE TO ITS OWN IMAGE.
                    if (TYPE == 1)
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_239_0") // You can't copy there.
                    MESSAGETIMER = 90
                    TWOBUFFER = 2
                    ONEBUFFER = 2
                    BACKNOISE = true
                }
            }
            if (MENU_NO == 2)
            {
                if (FILE[MENUCOORD[MENU_NO]] == 1)
                {
                    TWOBUFFER = 2
                    ONEBUFFER = 2
                    SELNOISE = true
                    MENUCOORD[3] = 0
                    MENU_NO = 3
                }
                else
                {
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_261_0") // IT IS BARREN AND CANNOT BE COPIED.
                    if (FILE[0] == 0 && FILE[1] == 0 && FILE[2] == 0)
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_264_0") // BUT THERE WAS NOTHING LEFT TO COPY.
                    if (TYPE == 1)
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_266_0") // It can't be copied.
                    MESSAGETIMER = 90
                    BACKNOISE = true
                    TWOBUFFER = 2
                    ONEBUFFER = 2
                }
            }
            if (MENU_NO == 5)
            {
                if (FILE[MENUCOORD[MENU_NO]] == 1)
                {
                    TWOBUFFER = 2
                    ONEBUFFER = 2
                    SELNOISE = true
                    MENUCOORD[6] = 0
                    MENU_NO = 6
                }
                else
                {
                    TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_289_0") // BUT IT WAS ALREADY GONE.
                    if (FILE[0] == 0 && FILE[1] == 0 && FILE[2] == 0)
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_292_0") // BUT THERE WAS NOTHING LEFT TO ERASE.
                    if (TYPE == 1)
                        TEMPCOMMENT = scr_84_get_lang_string("DEVICE_MENU_slash_Step_0_gml_294_0") // There's nothing to erase.
                    MESSAGETIMER = 90
                    TWOBUFFER = 2
                    ONEBUFFER = 2
                    BACKNOISE = true
                }
            }
        }
        if (MENUCOORD[MENU_NO] == 3)
        {
            TWOBUFFER = 2
            ONEBUFFER = 2
            SELNOISE = true
            MENU_NO = 0
        }
    }
    if (button2_p() && TWOBUFFER < 0)
    {
        TWOBUFFER = 2
        ONEBUFFER = 2
        BACKNOISE = true
        if (MENU_NO == 2 || MENU_NO == 5)
            MENU_NO = 0
        if (MENU_NO == 3)
            MENU_NO = 2
    }
}
if (MENU_NO == 0)
{
    if down_p()
    {
        if (MENUCOORD[0] < 3)
        {
            MENUCOORD[0] += 1
            MOVENOISE = 1
        }
    }
    if up_p()
    {
        if (MENUCOORD[0] > 0)
        {
            MENUCOORD[0] -= 1
            if (MENUCOORD[0] == 3)
                MENUCOORD[0] = 2
            MOVENOISE = 1
        }
    }
    if right_p()
    {
        if (MENUCOORD[0] >= 3 && MENUCOORD[0] <= 5)
        {
            MOVENOISE = 1
            MENUCOORD[0] += 1
            if (MENUCOORD[0] > 5)
                MENUCOORD[0] = 3
        }
    }
    if left_p()
    {
        if (MENUCOORD[0] >= 3 && MENUCOORD[0] <= 5)
        {
            MOVENOISE = 1
            MENUCOORD[0] -= 1
            if (MENUCOORD[0] < 3)
                MENUCOORD[0] = 5
        }
    }
    if (button1_p() && ONEBUFFER < 0)
    {
        MESSAGETIMER = -1
        if (MENUCOORD[0] <= 2)
        {
            MENUCOORD[1] = 0
            ONEBUFFER = 1
            TWOBUFFER = 1
            MENU_NO = 1
            SELNOISE = true
        }
        if (MENUCOORD[0] == 3)
        {
            MENUCOORD[2] = 0
            ONEBUFFER = 1
            TWOBUFFER = 1
            MENU_NO = 2
            SELNOISE = true
        }
        if (MENUCOORD[0] == 4)
        {
            MENUCOORD[5] = 0
            ONEBUFFER = 1
            TWOBUFFER = 1
            MENU_NO = 5
            SELNOISE = true
        }
    }
}
if (OBMADE == 1)
{
    OB_DEPTH += 1
    obacktimer += OBM
    if (obacktimer >= 20)
    {
        DV = instance_create(0, 0, DEVICE_OBACK_4)
        DV.depth = (5 + OB_DEPTH)
        DV.OBSPEED = (0.01 * OBM)
        if (OB_DEPTH >= 60000)
            OB_DEPTH = 0
        obacktimer = 0
    }
}
if (MOVENOISE == 1)
{
    snd_play(snd_menumove)
    MOVENOISE = 0
}
if (SELNOISE == true)
{
    snd_play(snd_select)
    SELNOISE = false
}
if (BACKNOISE == true)
{
    snd_play(snd_swing)
    BACKNOISE = false
}
if (DEATHNOISE == true)
{
    snd_play(AUDIO_APPEARANCE)
    DEATHNOISE = false
}
ONEBUFFER -= 1
TWOBUFFER -= 1
