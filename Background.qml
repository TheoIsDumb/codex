import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: "body"

    anchors.fill: parent

    Image {
        source: "background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }
}