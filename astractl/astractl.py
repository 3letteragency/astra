#!/usr/bin/env python3
import krpc
import argparse
import terminaltables
from tkinter import *
from tkinter import ttk

import numpy 

def client_config():
    p = argparse.ArgumentParser(description='Astractl')

    p.add_argument('-a', '--address', required=True, help='Astra Flight node IP address')
    p.add_argument('-r', '--rpc-port', default=50000, help='kRPC RPC listen port')
    p.add_argument('-s', '--stream-port', default=50001, help='kRPC Stream listen port')
    p.add_argument('-n', '--name', default='astra-client', help='Astractl client name')

    a = p.parse_args()

    return a

def new_client(cfg=client_config()):
    c = krpc.connect(name=cfg.name, address=cfg.address, rpc_port=cfg.rpc_port, stream_port=cfg.stream_port)

    return c

def launchable_vessels(client=c):
    v = client.space_center.launchable_vessels("VAB")

    return v

def main():
    k = new_client()
    launchable_vessels = launchable_vessels()

    window = Tk()
    window.title("Astractl")

    sidebar = Frame()

    view = Label(
        text=k.krpc.get_status(),
        foreground="black",
    )

    view.pack()

    window.mainloop()

main()
