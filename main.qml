import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    title: "Taskie"

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
                            content: "1.6/4.0 GB"
                        }

                        TopBox {
                            id: cpu
                            title: "CPU"
                            content: "25%"
                        }

                        TopBox {
                            id: disk
                            title: "Disk"
                            content: "40%"
                        }

                    }

                }

            }

        }

    }

}
