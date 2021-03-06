import QtQuick 2.7
import QtGraphicalEffects 1.0

import MuseScore.UiComponents 1.0
import MuseScore.Cloud 1.0

Item {
    id: root

    height: 40

    AccountModel {
        id: model
    }

    Component.onCompleted: {
        model.load()
    }

    Row {
        anchors.fill: parent
        anchors.leftMargin: 8

        spacing: 8

        Image {
            id: avatar

            width: 40
            height: width

            fillMode: Image.PreserveAspectCrop

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: avatar.width
                    height: avatar.height
                    radius: width / 2
                    visible: false
                }
            }

            source: model.accountInfo.avatarUrl
        }

        StyledTextLabel {
            anchors.verticalCenter: parent.verticalCenter

            text: Boolean(model.accountInfo.userName) ? model.accountInfo.userName : "Sign in"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: model.logIn()
    }
}
