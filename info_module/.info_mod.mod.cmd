savedcmd_info_mod.mod := printf '%s\n'   info_mod.o | awk '!x[$$0]++ { print("./"$$0) }' > info_mod.mod
