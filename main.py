#!/bin/python3

import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QTimer
import psutil
import os
import platform
import subprocess

def fetchSystemInfo():
    os_info = platform.system()
    host = platform.node()
    kernel = platform.release()
    shell = os.environ.get('SHELL', 'Unknown shell')
    desktop_env = os.environ.get('XDG_CURRENT_DESKTOP', 'Unknown DE')

    systemfetch = f"OS	 {os_info}\nHost	 {host}\nKernel	 {kernel}\nShell	 {shell}\nDE	 {desktop_env}"

    engine.rootObjects()[0].setProperty('systemfetch', systemfetch)

def fetchCPU():
    result = subprocess.run(['lscpu', '-J'], check=True, capture_output=True, text=True)
    engine.rootObjects()[0].setProperty('cpuJSON', result.stdout)

def fetchRAM():
    mem = psutil.virtual_memory()
    memData = f"{mem.used / 1e9:.1f}/{mem.total / 1e9:.1f}GB"
    engine.rootObjects()[0].setProperty('mem', memData)

# def fetchCPU():
#     engine.rootObjects()[0].setProperty('cpuData', f"{psutil.cpu_percent(1)}%")

def fetchDisk():
    total_used = 0
    total_capacity = 0

    for partition in psutil.disk_partitions():
        usage = psutil.disk_usage(partition.mountpoint)
        total_used += usage.used
        total_capacity += usage.total

    total_percentage = (total_used / total_capacity) * 100 if total_capacity > 0 else 0

    engine.rootObjects()[0].setProperty('diskUsageData', f"{total_percentage:.1f}%")


if __name__ == "__main__":
    app = QApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(os.path.dirname(os.path.abspath(__file__)) + "/" + "App.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    timer = QTimer()
    timer.setInterval(1000)
    timer.timeout.connect(fetchRAM)
    # timer.timeout.connect(fetchCPU)
    timer.start()

    fetchRAM()
    fetchCPU()
    fetchDisk()
    fetchSystemInfo()

    sys.exit(app.exec())
