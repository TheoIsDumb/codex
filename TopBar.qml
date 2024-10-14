import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

RowLayout {
    width: parent.width

    CustomText {
        innerText: "CODEX"
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
}
