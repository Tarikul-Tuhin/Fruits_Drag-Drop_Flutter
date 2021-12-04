import 'package:flutter/material.dart';

void main() {
  runApp(DragApp());
}

class DragApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragScreen(),
    );
  }
}

class DragScreen extends StatefulWidget {
  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  bool insiderTarget = false;
  String activeEmoji = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag & Drop'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DragTarget<String>(
              builder: (context, data, rejectedDate) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.red,
                  child: activeEmoji == ''
                      ? null
                      : FruitBox(
                          activeEmoji,
                          Colors
                              .green), //jodi string empty hoy do nothing, jodi empty na hoy means false hoy tahole red color r emoji nao.
                );
              },
              onAccept: (emoji) {
                setState(() {
                  insiderTarget = true;
                  activeEmoji = emoji;
                });
              },
              onWillAccept: (emoji) {
                return emoji == '🍎' ? false : true; // ' : ' eta mane otherwise
              }, //restrict dragged items.
            ),
            Text(
              "No Apple Please!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FruitBox('🍎', Colors.yellow),
                FruitBox('🍌', Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FruitBox extends StatelessWidget {
  final String boxIcon;
  final Color boxColor;

  FruitBox(this.boxIcon, this.boxColor);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: boxIcon,
      child: Container(
        height: 120.0,
        width: 120.0,
        color: boxColor,
        child: Center(
          child: Text(
            boxIcon,
            style: TextStyle(fontSize: 50.0),
          ),
        ),
      ),
      feedback: Material(
        child: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.yellow,
          child: Center(
            child: Text(
              boxIcon,
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.grey,
      ),
    );
  }
}
