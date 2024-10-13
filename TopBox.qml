import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: id
    Layout.fillWidth: true
    height: parent.height
    radius: 15
    border.color: "#737373"
    border.width: 2
    y: -150

    NumberAnimation on y {
        to: 0
        duration: animDuration
        easing.type: Easing.InOutCubic
	}

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        CustomText {
            innerText: title
        }

        Item {
            Layout.fillHeight: true
        }

        CustomText {
            innerText: content
            pointSize: 28
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

    property string id: ""
    property string title: ""
    property string content: ""
    property int animDuration: 800
}
