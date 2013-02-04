// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtQuick 1.0

Rectangle {
    id: page
    width: 360
    height: 360
    color: "#343434"

    Image {
        id: icon
        x: 10
        y: 20
        source: "states.png"
    }

    Rectangle {
        id: topLeftRect
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.width: 1
        border.color: "#808080"

        MouseArea {
            anchors.fill: parent
            onClicked: page.state = ''
        }
    }

    Rectangle {
        id: middleRightRect
        x: 9
        y: 2
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#808080"
        MouseArea {
            anchors.fill: parent
            onClicked: page.state = 'State1'
        }
        border.width: 1
    }

    Rectangle {
        id: bottomLeftRect
        y: -3
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.color: "#808080"
        MouseArea {
            anchors.fill: parent
            onClicked: page.state = 'State2'
        }
        border.width: 1
    }
    states: [
        State {
            name: "State1"
            PropertyChanges {
                target: icon
                x: middleRightRect.x
                y: middleRightRect.y
            }
        },
        State {
            name: "State2"
            PropertyChanges {
                target : icon
                x: bottomLeftRect.x
                y: bottomLeftRect.y
            }
        }
    ]

    transitions: [
    Transition {
        from: "*"; to: "State2"
        NumberAnimation {
            easing.type: Easing.OutBounce
            properties: "x,y";
            duration: 1000
        }
    },
        Transition {
            from: "*"; to: "State2"
            NumberAnimation {
                easing.type: Easing.InOutQuad
                properties: "x,y";
                duration: 1000
            }
        },
        Transition {
            NumberAnimation {
                properties: "x,y";
                duration: 200
            }
        }
    ]
}
