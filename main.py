#!/bin/python3

import sys
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QTimer
import psutil
import os

def fetchRAM():
    mem = psutil.virtual_memory()
    memData = f"{mem.used / 1e9:.1f}/{mem.total / 1e9:.1f}GB"
    engine.rootObjects()[0].setProperty('mem', memData)

def fetchCPU():
    engine.rootObjects()[0].setProperty('cpuData', f"{psutil.cpu_percent(1)}%")

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
    # fetchCPU()
    fetchDisk()
    sys.exit(app.exec())
