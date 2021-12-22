import subprocess, binascii
def apply(config, args):
    p = subprocess.Popen(["make", "print-DEVKITPPC"], stdout=subprocess.PIPE)
    devkit_str = p.communicate()[0].decode("ascii")
    devkit_path = devkit_str.split("[")[1][:-2]

    #config['mapfile'] = 'supermonkeyball.map'
    #config['myimg'] = 'supermonkeyball.elf'
    #config['baseimg'] = 'baserom.elf'
    
    config['mapfile'] = 'mkbe.rel_mini_pilot.map'
    config['myimg'] = 'mkbe.rel_mini_pilot.rel'
    config['baseimg'] = 'baserom.mkbe.rel_mini_pilot.rel'
    
    config['makeflags'] = []
    config['source_directories'] = ['src', 'include', 'spec']
    config["arch"] = "ppc"
    config["map_format"] = "mw" # gnu or mw
    config["mw_build_dir"] = "./" # only needed for mw map format
    config["makeflags"] = []
    config["objdump_executable"] = devkit_path+"/bin/powerpc-eabi-objdump"
