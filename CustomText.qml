import QtQuick 2.15
import QtQuick.Layouts 1.15


Text {
	FontLoader {
	        id: barlow
	        source: "barlow.woff2"
	}

    text: innerText
    font.family: barlow.name
    font.letterSpacing: -0.5
    font.bold: true
    color: "white"
    font.pointSize: pointSize

    property string innerText: ""
    property int pointSize: 15
}
