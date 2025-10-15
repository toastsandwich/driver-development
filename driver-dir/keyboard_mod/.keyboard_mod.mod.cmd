savedcmd_keyboard_mod.mod := printf '%s\n'   keyboard_mod.o | awk '!x[$$0]++ { print("./"$$0) }' > keyboard_mod.mod
