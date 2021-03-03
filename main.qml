import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("VK BOOM")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            header: ToolBar{                                    //Хедер
                height: 40
                Material.background: "#1e1e1e"                  //Тёмный цвет

                Image {                                         //Аватарка юзера
                    id: image
                    width: 36
                    height: 36
                    source: "Alex.jpg"
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: mask
                    }
                }

                Rectangle {                                     //Закругление авы
                    id: mask
                    width: 36
                    height: 36
                    radius: 18
                    visible: false
                }

                Label {
                    x: 45
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: 1
                    text: "Элементы графического \nинтерфейса."
                    font.pixelSize: 14
                    padding: 10
                }

                Image {                                        //Шестерёнка справа
                    id: image1
                    width: 34
                    height: 32
                    source: "option.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                }
            }

            GridLayout {                                                       //Грид
                id: gridLayout
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.top: parent.top

                rows: 4     //4 строки
                columns: 2  //2 колонки

                RowLayout{                                                      //Шаблон первой строки, занимает 2 колонки (строка под хедером, заголовок)
                    id: row1
                    Layout.row: 0
                    Layout.columnSpan: 2
                    anchors.fill: parent

                    Rectangle{
                        height: 30
                        width: parent.width
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        color: "#ff69b4"

                        Text{
                            text: "Настройки языка и параметров"
                            font.pixelSize: 18
                            color: "#ffffff"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                ColumnLayout{                                                   //Шаблон первой колонки второй строки (выбор языка)
                    Layout.row: 1
                    Layout.column: 0
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 37
                    anchors.leftMargin: 25

                    Label{
                        id: myLab
                        font.pixelSize: 16
                        color: "#ffffff"
                        text: "Выберите язык"
                    }

                    RadioButton {                                               //Кастомизация кнопки
                        id: but1
                        text: "Русский"
                        anchors.top: myLab.top
                        anchors.topMargin: 10

                        indicator: Rectangle {                                  //Оконтовка кнопки
                            implicitWidth: 26
                            implicitHeight: 26
                            x: but1.leftPadding
                            y: but1.height / 2 - height / 2
                            radius: 13
                            border.color: "#ff69b4"

                            Rectangle {                                         //Кружочек внутри
                                width: 14
                                height: 14
                                x: 6
                                y: 6
                                radius: 7
                                color: "#ff69b4"
                                visible: but1.checked
                            }
                        }

                        contentItem: Text {                                     //Меняем цвет текста рядом с кнопкой
                            text: but1.text
                            font: but1.font
                            color: "#ff69b4"
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left                           //Настройка отступа от края кнопки
                            anchors.leftMargin: 40
                        }
                    }

                    RadioButton {                                               //Аналогично кнопке 1
                        id: but2
                        text: "English"
                        anchors.top: but1.top                                   //Отступ от верхней кнопки
                        anchors.topMargin: 35

                        indicator: Rectangle {
                            implicitWidth: 26
                            implicitHeight: 26
                            x: but2.leftPadding
                            y: but2.height / 2 - height / 2
                            radius: 13
                            border.color: "#ff69b4"

                            Rectangle {
                                width: 14
                                height: 14
                                x: 6
                                y: 6
                                radius: 7
                                color: "#ff69b4"
                                visible: but2.checked
                            }
                        }

                        contentItem: Text {
                            text: but2.text
                            font: but2.font
                            color: "#ff69b4"
                            verticalAlignment: Text.AlignVCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 40
                        }
                    }
                }


                ColumnLayout{                                               //Вторая колонка на 2 строке
                    Layout.row: 1
                    Layout.column: 1
                    anchors.right: parent.right
                    anchors.rightMargin: 25

                    Label{
                        font.pixelSize: 16
                        color: "#ffffff"
                        text: "Введите Ваш возраст"
                    }

                    Tumbler{                                                //Тумблер и его кастом
                        model: 70
                        anchors.left: parent.left
                        anchors.leftMargin: 50

                        Rectangle {                                         //Верхняя строчка над тумблером
                            anchors.top: parent.top
                            width: 65
                            height: 1
                            color: "grey"
                        }

                        delegate: Text {                                    //Внутри текста добавил подпись "л."
                            color: "#ff69b4"
                            text: (modelData + 1) + " л."
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        Rectangle {                                         //Нижняя строчка над тумблером
                            color: "grey"
                            width: 65
                            height: 1
                            anchors.bottom: parent.bottom
                        }
                    }
                }

                RowLayout{                                                  //3 строка, заголовок нового раздела
                    id: row3
                    Layout.row: 2
                    Layout.columnSpan: 2
                    anchors.fill: parent

                    Rectangle{
                        height: 30
                        width: parent.width
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.topMargin: 280
                        color: "#ff69b4"

                        Text{
                            text: "Настройки приложения и выбор музыки"
                            font.pixelSize: 18
                            color: "#ffffff"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                ColumnLayout{                                               //4 строка 1 колонка
                    Layout.row: 3
                    Layout.column: 0

                    Rectangle{                                              //Прямоугольный блок
                        id: reck1
                        color: "#1e1e1e"
                        anchors.fill: parent
                        radius: 15
                        scale: 0.8                                          //Немного уменьшил масштаб

                        Text{
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            font.pixelSize: 18
                            color: "#ffffff"
                            text: "Выбор трека"
                        }

                        TextField{                                          //Ввод текста
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 40
                            font.pixelSize: 18
                            width: parent.width - 10
                            placeholderText: "Название трека ..."
                            placeholderTextColor: "#ffffff"
                        }

                        Dial {                                              //Управление громкостью трека
                            id: dial
                            anchors.right: parent.right
                            anchors.rightMargin: 70
                            anchors.left: parent.left
                            anchors.leftMargin: 70
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 30
                            anchors.top: parent.top
                            anchors.topMargin: 60
                        }
                    }
                }

                ColumnLayout{                                               //4 строка колонка 2
                    Layout.row: 3
                    Layout.column: 1

                    Rectangle{                                              //Прямоугольный блок
                        id: reck2
                        color: "#1e1e1e"
                        anchors.fill: parent
                        radius: 15
                        scale: 0.8

                        Text{
                            id: text1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 10
                            font.pixelSize: 18
                            color: "#ffffff"
                            text: "Подбор музыки \nпо годам"
                        }

                        Text{
                            id: text2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 18
                            color: "#ffffff"
                            text: "2005 2010 2015 2020"
                        }

                        RangeSlider{                                        //Выбор трека по году выпуска
                            id: slider1
                            width: 200
                            from: 2005
                            to: 2020
                            first.value: 2005
                            second.value: 2020
                            anchors.top: text2.bottom
                            anchors.topMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }

        Page {
        }

        Page {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Lab 1")
        }
        TabButton {
            text: qsTr("Lab 2")
        }
        TabButton {
            text: qsTr("Lab 3")
        }
    }
}
