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

    Background {}

    Button {
        contentItem: Image {
            source: "close.svg"
            anchors.centerIn: parent
        }

        text: qsTr("Close")
        display: AbstractButton.IconOnly

        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 16
        onClicked: {
            Qt.quit();
        }
        background: Rectangle {
            color: "transparent"
        }

    }

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
