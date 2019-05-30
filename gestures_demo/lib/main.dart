import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestures Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int tapsCount = 0;
  int doubleTapsCount = 0;
  int longPressCount = 0;

  double xPosition = 0.0;
  double yPosition = 0.0;

  double boxSize = 0.0;
  double fullBoxSize = 150.0;

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation.addListener(() {
      setState(() {
        boxSize = fullBoxSize * animation.value;
      });
      centerBOx(context);
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if(xPosition == 0.0){
    //   centerBOx(context);
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures Demo"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            tapsCount++;
          });
        },
        onDoubleTap: () {
          setState(() {
            doubleTapsCount++;
          });
        },
        onLongPress: () {
          setState(() {
            longPressCount++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            yPosition += value.delta.dy;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            xPosition += value.delta.dx;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
              "Tap : $tapsCount, Double Tap : $doubleTapsCount, Long Press : $longPressCount "),
        ),
      ),
    );
  }

  void centerBOx(BuildContext context) {
    xPosition = MediaQuery.of(context).size.width / 2.0 - boxSize / 2.0;
    yPosition = MediaQuery.of(context).size.height / 2.0 - boxSize / 2.0 - 30.0;

    setState(() {
      this.xPosition = xPosition;
      this.yPosition = yPosition;
    });
  }
}
