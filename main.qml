import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "."

ApplicationWindow {
    visible: true
    title: "Taskie"

    Rectangle {
        id: "body"

        anchors.fill: parent

        Image {
            source: "background.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }
    }

    Row {
        anchors.fill: parent
        spacing: 15
        anchors.margins: 15

        Rectangle {
            id: sidebar

            width: 80
            height: parent.height
            color: "black"
            opacity: 0.7
            radius: 15
        }

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
                            title: "RAM"
                            content: "1.6/4.0 GB"
                        }

                        TopBox {
                            title: "CPU"
                            content: "25%"
                        }

                        TopBox {
                            title: "Disk"
                            content: "40%"
                        }

                    }

                }

            }

        }

    }

}
