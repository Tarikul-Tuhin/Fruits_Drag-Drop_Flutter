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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag & Drop?' + insiderTarget.toString()),
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
                  color: Colors.blue,
                );
              },
              onAccept: (data) {
                setState(() {
                  insiderTarget = true;
                });
              },
            ),
            Draggable(
              data: 'red',
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.red,
              ),
              feedback: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.yellow,
              ),
              childWhenDragging: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
