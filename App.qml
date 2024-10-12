import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    title: "Taskie"

    property string mem: "--/-- GB"
    property string cpuData: "--%"
    property string diskUsageData: "--%"

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
                        }

                        TopBox {
                            id: cpu
                            title: "CPU"
                            content: cpuData
                        }

                        TopBox {
                            id: disk
                            title: "Disk"
                            content: diskUsageData
                        }

                    }

                }

            }

        }

    }

}
