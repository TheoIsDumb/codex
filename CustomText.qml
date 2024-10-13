import QtQuick 2.15
import QtQuick.Layouts 1.15

Text {
    text: innerText
    font.letterSpacing: -0.5
    font.bold: true
    color: "white"
    font.family: "PP Supply Mono"
    font.pointSize: pointSize

    property string innerText: ""
    property int pointSize: 14
}