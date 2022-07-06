#!/usr/bin/python3

import tkinter as tk
import sys

cmd = sys.argv[1:]
color = None

if len(cmd) == 1:
  color = cmd[0]
elif len(cmd) == 3:
  cmd = [int(x) for x in cmd]
  color = ''.join('{:02X}'.format(a) for a in cmd)
else:
    print('Provide color as either `[CMD] R G B` or `[CMD] RRGGBB`.')

root = tk.Tk()

root.configure(background=f'#{color}')

root.bind("<Escape>", lambda e: e.widget.quit())
root.mainloop(0)
