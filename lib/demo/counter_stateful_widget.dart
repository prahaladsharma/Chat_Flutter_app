import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  //Widget variable
  Color buttonColor;

  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() {
    State<
        CounterStateful> stateClassAssociatedWithThisWidget = _CounterStatefulState();
    return stateClassAssociatedWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {

  //State variable
  int counter = 0;


  void increment() {
    setState(() {  //This function tell the framework to redraw the UI. It will call again build() to redraw UI.
      counter++;
    });

    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        child: Icon(Icons.add),
        onPressed: () {
          increment();
        },
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
