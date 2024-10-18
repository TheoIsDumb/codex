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
    property string ipJSON: ""
    property string lsblkJSON: ""

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
            x: -100

            SmoothedAnimation on x {
                to: 0
                duration: 600
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

                Button {
                    contentItem: Image {
                        source: "icons/network.svg"
                        anchors.centerIn: parent
                    }
                
                    text: qsTr("Close")
                    display: AbstractButton.IconOnly
                
                    onClicked: {
                        loader.sourceComponent = network
                        currentPage = "Network"
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
                        source: "icons/storage.svg"
                        anchors.centerIn: parent
                    }
                
                    text: qsTr("Close")
                    display: AbstractButton.IconOnly
                
                    onClicked: {
                        loader.sourceComponent = storage
                        currentPage = "storage"
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
                y: -150

                NumberAnimation on y {
                    to: 0
                    duration: 600
                    easing.type: Easing.InOutCubic
                }

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
                    background: MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        Rectangle {
                            color: "transparent"
                        }
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

        Column {
            height: parent.width
            width: parent.width
            spacing: 20

            property var parsed: JSON.parse(cpuJSON)

            Rectangle {
                height: 200
                width: parent.width
                radius: 15
                color: "transparent"

                RowLayout {
                    height: 200
                    width: parent.width
                    spacing: 10

                    TopBox {
                        id: arch
                        title: "Arch"
                        content: parsed.lscpu[0].data 
                        animDuration: 800
                    }

                    TopBox {
                        id: cpu_model
                        title: "CPU Mode"
                        content: parsed.lscpu[1].data 
                        animDuration: 1200
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "gray"
            }

            ScrollView {
                width: parent.width
                height: 500

                Column {
                    anchors.fill: parent
                    spacing: 10
                    padding: 10

                    Repeater {
                        model: parsed.lscpu.length

                        Column {
                            CustomText {
                                text: parsed.lscpu[index].field
                                color: "white"
                            }
                            CustomText {
                                text: parsed.lscpu[index].data
                                color: "lightgray"
                            }
                        }
                    }
                }
            }
        }
    } // cpu

    Component {
        id: network

        Column {
            width: parent.width
            height: parent.height
            spacing: 10

            property var parsed: JSON.parse(ipJSON)

            Rectangle {
                width: parent.width
                color: "transparent"
                height: 200

                Column {
                    anchors.fill: parent
                    spacing: 10
                    padding: 10

                    Repeater {
                        model: parsed.length

                        Row {
                            spacing: 20

                            CustomText {
                                text: parsed[index].ifindex
                                color: "white"
                                pointSize: 80
                            }

                            Column {
                                spacing: 5

                                CustomText {
                                    text: parsed[index].ifname
                                    color: "lightgray"
                                }
                                CustomText {
                                    text: parsed[index].addr_info[0].local
                                    color: "lightgray"
                                }
                                CustomText {
                                    text: parsed[index].addr_info[1].local
                                    color: "lightgray"
                                }
                                CustomText {
                                    text: parsed[index].address
                                    color: "lightgray"
                                }
                            }
                        }
                    }
                }
            }
        }
    } // network

    Component {
        id: storage


        ColumnLayout {
            width: parent.width
            height: parent.height
            spacing: 10

            property var parsed: JSON.parse(lsblkJSON).blockdevices

            Column {
                width: parent.width
                spacing: 10

                Repeater {
                    model: parsed

                    Repeater {
                        model: modelData.children

                        RowLayout {
                            spacing: 20
                            width: parent.width

                            CustomText { text: modelData.name }
                            CustomText { text: modelData.fstype }
                            CustomText { text: modelData.fsavail }

                            Item { Layout.fillWidth: true }

                            ProgressBar {
                                id: control
                                value: Number(modelData['fsuse%'].replace('%', '')/100)
                                Layout.fillWidth: true
                                padding: 2

                                background: Rectangle {
                                    implicitWidth: 200
                                    implicitHeight: 6
                                    color: "gray"
                                    radius: 10
                                }

                                contentItem: Item {
                                    implicitWidth: 200
                                    implicitHeight: 4

                                    Rectangle {
                                        anchors.leftMargin: -10
                                        width: control.visualPosition * parent.width
                                        height: parent.height
                                        radius: 10
                                        color: "lightgray"
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
    }
}
