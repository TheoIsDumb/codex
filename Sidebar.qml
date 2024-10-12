import QtQuick 2.15
import QtQuick.Controls 2.15

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
}
