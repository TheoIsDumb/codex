import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    Layout.fillWidth: true
    height: parent.height
    radius: 15
    border.color: "#737373"
    border.width: 2

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        Text {
            text: title
            color: "white"
            font.family: "PP Supply Mono"
        }

        Item {
            Layout.fillHeight: true
        }

        Text {
            text: content
            font.pixelSize: 50
            font.bold: true
            color: "white"
            font.family: "PP Supply Mono"
        }
    }

    gradient: Gradient {
        stops: [
            GradientStop {
                position: 0
                color: "black"
            },
            GradientStop {
                position: 1
                color: Qt.rgba(0.149, 0.149, 0.149, 1)
            }
        ]
    }

    property string title: ""
    property string content: ""
}