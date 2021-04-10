#!/usr/bin/env python

# THIS SCRIPT CURRENTLY HAS SOME PROBLEMS REGARDING DEVICE IDENTIFICATION
# IT MIGHT LOCK YOUR TOUCHPAD WHEN YOU CONNECT ANOTHER USB DEVICE TO YOUR PC


import pyudev
import subprocess

class TouchPad:

    def __init__(self, enabled=True):
        self.enabled = enabled
        if self.enabled is False:
            self.disable()

    def disable(self):
        subprocess.run(["synclient", "TouchpadOff=1"])
        self.enabled = False

    def enable(self):
        subprocess.run(["synclient", "TouchpadOff=0"])
        self.enabled = True

touchpad = TouchPad()

context = pyudev.Context()
monitor = pyudev.Monitor.from_netlink(context)
monitor.filter_by(subsystem="usb")
mouse = None

while True:

    for action, device in monitor:

        # # # Left this for debugging purposes
        # print(f"{action} for {device}")
        # print(f"device subsystem: {device.subsystem}")
        # print(f"device driver: {device.driver}")
        # print(f"device type: {device.device_type}")

        # Mouse is added
        if action == "add" and device.driver == "usbhid":
            # print("Mouse added")
            mouse = device
            touchpad.disable()

        # Mouse is removed
        elif device == mouse and action == "remove":
            # print("Mouse removed")
            touchpad.enable()
    break
