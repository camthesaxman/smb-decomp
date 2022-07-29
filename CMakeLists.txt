cmake_minimum_required(VERSION 3.13)
project(supermonkeyball LANGUAGES C CXX)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 20)
if (CMAKE_SYSTEM_NAME STREQUAL Linux)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32 -Wall -fsanitize=address -fsanitize-address-use-after-scope -Wno-unknown-pragmas -Wno-unused-variable -Wno-unused-parameter")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32 -Wall -fsanitize=address -fsanitize-address-use-after-scope")
  set(CMAKE_PREFIX_PATH /usr)
  set(CMAKE_LIBRARY_ARCHITECTURE i386-linux-gnu)
  set(CMAKE_LIBRARY_PATH "/usr/lib32" CACHE PATH "")
  set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX 32)
endif ()

add_subdirectory(extern/aurora EXCLUDE_FROM_ALL)

add_executable(supermonkeyball
    stubs.c
    src/main.c
    src/init.c
    src/init_2.c
    src/mathutil.c
    src/mode.c
    src/pause_menu.c
    src/event.c
    src/polydisp.c
    src/adv.c
    src/code_5.c
    src/sel.c
    src/game.c
    src/camera.c
    src/frustum.c
    src/light.c
    src/gxsync.c
    src/info.c
    src/code_7.c
    src/input.c
    src/bitmap.c
    src/bmp_list_com.c
    src/bmp_list_adv.c
    src/bmp_list_end.c
    src/bmp_list_rnk.c
    src/bmp_list_sel.c
    src/bmp_list_nml.c
    src/bmp_list_bwl.c
    src/bmp_list_rac.c
    src/bmp_list_bil.c
    src/bmp_list_fgt.c
    src/bmp_list_glf.c
    src/bmp_list_tgt.c
    src/bmp_list_how.c
    src/bmp_list_cmd.c
    src/trig_tables.c
    src/perf.c
    src/pool.c
    src/nl2ngc.c
    src/mot_joint.c
    src/motload.c
    src/motload_3.c
    src/motload_4.c
    src/ball.c
    src/stcoli.c
    src/world.c
    src/interpolate_keyframes.c
    src/stage.c
    src/code_8.c
    src/recplay.c
    src/recplay_2.c
    src/background.c
    src/bg_old_cave.c
    src/bg_old_night.c
    src/bg_old_space.c
    src/bg_old_sunset.c
    src/bg_old_bonus.c
    src/bg_old_sand.c
    src/bg_old_storm.c
    src/bg_jungle.c
    src/bg_sand.c
    src/bg_water.c
    src/bg_space.c
    src/bg_sunset.c
    src/bg_bonus.c
    src/bg_storm.c
    src/bg_end.c
    src/course.c
    src/item.c
    src/item_coin.c
    src/item_pilot.c
    src/obj_collision.c
    src/stobj.c
    src/stobj_goal.c
    src/sprite.c
    src/textbox.c
    src/hud.c
    src/ord_tbl.c
    src/code_3.c
    src/ranking_screen.c
    src/mot_ape.c
    src/code_2.c
    src/lzs_decompress.c
    src/avdisp.c
    src/load.c
    src/mouse.c
    src/rend_efc.c
    src/rend_efc_mirror.c
    src/rend_efc_3.c
    src/relocation.c
    src/gxutil.c
    src/gxcache.c
    src/memcard.c
    src/DEMOPuts.c
    src/view.c
    src/code_6.c
    src/dvd.c
    src/preview.c
    libraries/dolphin_pc/OS.c
    #    libraries/dolphin_pc/GX.c
    libraries/dolphin_pc/dvd.c
    #    libraries/dolphin_pc/vi.c
    #    libraries/dolphin_pc/pad_evdev.c
    #    libraries/dolphin_pc/pad_dinput.c
    libraries/dolphin_pc/ar.c
    libraries/dolphin_pc/arq.c
    libraries/os/OSAlloc.c
    libraries/os/OSArena.c
    libraries/os/OSAudioSystem.c
    libraries/os/OSError.c
    libraries/os/OSMutex.c
    libraries/os/OSSync.c
    libraries/mtx/mtx44.c
    libraries/dvd/dvdqueue.c
    libraries/dvd/fstload.c
    libraries/demo/DEMOFont.c
    libraries/dsp/dsp.c
    libraries/dsp/dsp_debug.c
    libraries/dsp/dsp_task.c
    libraries/hio/hio.c
    libraries/gx/GXStubs.c
    libraries/gx/GXPerf.c
    libraries/amcnotstub/amcnotstub.c
    src/byteswap.cpp
    src/imgui.cpp
    src/sel_stage_rel.c
    src/sel_stage_rel_2.c
    src/sel_stage_rel_3.c
    )
target_compile_definitions(supermonkeyball PRIVATE NONMATCHING C_ONLY)
target_include_directories(supermonkeyball PRIVATE include)
if (NOT MSVC)
  target_sources(supermonkeyball PRIVATE src/mathutil_vec_cross_prod.c)
endif ()
target_link_libraries(supermonkeyball PRIVATE aurora::aurora aurora::main)

