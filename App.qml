import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// ApplicationWindow
ApplicationWindow {
    visible: true
    title: "Taskie"
    minimumWidth: 1000
    minimumHeight: 800
    maximumWidth: 1000
    maximumHeight: 800
    flags: Qt.FramelessWindowHint

    property string currentPage: "Overview"
    property string mem: "--/-- GB"
    property string cpuData: "--%"
    property string diskUsageData: "--%"
    property string systemfetch: "--"
    property string cpuJSON: ""

    Background {}

    // this row holds the sidebar and the body
    Row {
        anchors.fill: parent
        spacing: 15
        anchors.margins: 15

        // SIDEBAR
        Rectangle {
            id: sidebar

            width: 80
            height: parent.height
            color: "black"
            opacity: 0.7
            radius: 15
            x: -150

            SmoothedAnimation on x {
                to: 0
                duration: 800
                easing.type: Easing.InOutCubic
            }

            Column {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                padding: 20

                Button {
                    contentItem: Image {
                        source: "icons/overview.svg"
                        anchors.centerIn: parent
                    }
                
                    text: qsTr("Close")
                    display: AbstractButton.IconOnly
                
                    onClicked: {
                        loader.sourceComponent = overview
                        currentPage = "Overview"
                    }

                    background: MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        Rectangle {
                            color: "transparent"
                        }
                    }
                }

                Button {
                    contentItem: Image {
                        source: "icons/proc.svg"
                        anchors.centerIn: parent
                    }
                
                    text: qsTr("Close")
                    display: AbstractButton.IconOnly
                
                    onClicked: {
                        loader.sourceComponent = cpu
                        currentPage = "CPU"
                    }

                    background: MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        Rectangle {
                            color: "transparent"
                        }
                    }
                }
            }
        } // SIDEBAR

        // this column holds the topbar and the content body
        ColumnLayout {
            width: parent.width - 95
            spacing: 10

            // TOPBAR
            RowLayout {
                width: parent.width

                CustomText {
                    innerText: "CODEX" + " - " + currentPage
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    contentItem: Image {
                        source: "icons/close.svg"
                        anchors.centerIn: parent
                    }
                    anchors.bottomMargin: 10.0

                    text: qsTr("Close")
                    display: AbstractButton.IconOnly

                    onClicked: {
                        Qt.quit();
                    }
                    background: Rectangle {
                        color: "transparent"
                    }
                }
            } // TOPBAR


            Loader {
                id: loader
                width: parent.width
                sourceComponent: overview
            }
        }
    }

    Component {
        id: overview

        Column {
            width: parent.width
            height: parent.height
            spacing: 10

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
                    spacing: 10

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
    } // overview

    Component {
        id: cpu

        Rectangle {
            property var parsed: JSON.parse(cpuJSON)

            CustomText {
                text: parsed.lscpu[0].data
            }
        }
    }
}