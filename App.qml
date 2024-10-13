import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    title: "Taskie"
    minimumWidth: 1000
    minimumHeight: 800
    maximumWidth: 1000
    maximumHeight: 800
    flags: Qt.FramelessWindowHint

    property string mem: "--/-- GB"
    property string cpuData: "--%"
    property string diskUsageData: "--%"
    property string systemfetch: "--"

    Background {}

    Row {
        anchors.fill: parent
        spacing: 15
        anchors.margins: 15

        Sidebar {}

        Rectangle {
            id: main

            width: parent.width - 95
            height: parent.height
            color: "transparent"

            Column {
                anchors.fill: parent
                spacing: 10

                TopBar {}

                Rectangle {
                    width: parent.width
                    height: 150
                    color: "transparent"
                    anchors.margins: 20
                    border.color: "white"
                    border.width: 1
                    radius: 4

                    CustomText {
                        text: systemfetch
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                    }
                }

                Rectangle {
                    height: 200
                    width: parent.width
                    radius: 15
                    color: "transparent"

                    RowLayout {
                        anchors.fill: parent
                        spacing: 15

                        TopBox {
                            id: ram
                            title: "RAM"
                            content: mem 
                            animDuration: 800
                        }

                        TopBox {
                            id: cpu
                            title: "CPU"
                            content: cpuData
                            animDuration: 1200
                        }

                        TopBox {
                            id: disk
                            title: "Disk"
                            content: diskUsageData
                            animDuration: 1600
                        }

                    }

                }

            }

        }

    }

}
