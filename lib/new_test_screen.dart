

import 'dart:async';
import 'dart:developer';
import 'dart:math' as  math;
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';


void main() {
  runApp(ExampleApp());
}




class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fortune Wheel Example',
      home: SpinningWheelPage(),
    );
  }
}


class SpinItem{
  String label;
  TextStyle labelStyle;
  Color color;

  SpinItem({
    required this.label,
    required this.color,
    required this.labelStyle
  });
}

class MySpinner extends StatefulWidget {
  final MySpinController mySpinController;
  final List<SpinItem> itemList;
  final double wheelSize;
  final Function(void) onFinished;
  const MySpinner({
    Key? key,
    required this.mySpinController,
    required this.onFinished,
    required this.itemList,
    required this.wheelSize,
  }) : super(key: key);

  @override
  State<MySpinner> createState() => _MySpinnerState();
}

class _MySpinnerState extends State<MySpinner> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    widget.mySpinController.initLoad(
      tickerProvider: this,
      itemList: widget.itemList,
    );
  }

  @override
  void dispose() {
    super.dispose();
    null;
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: widget.mySpinController._baseAnimation,
            builder: (context, child) {
              double value = widget.mySpinController._baseAnimation.value;
              double rotationValue = (360 * value);
              return RotationTransition(
                turns: AlwaysStoppedAnimation( rotationValue / 360 ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                          width: widget.wheelSize,
                          height: widget.wheelSize,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black,Colors.white,Colors.black, Colors.white,Colors.black], // Define the colors for the gradient
                                begin: Alignment.topLeft, // Define the starting point of the gradient
                                end: Alignment.bottomRight, // Define the ending point of the gradient
                                // You can also define more stops and their positions if needed
                                // stops: [0.2, 0.7],
                                // tileMode: TileMode.clamp,
                              ),
                              //color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                                shape: BoxShape.circle
                            ),

                            padding: const EdgeInsets.all(5),
                            child: CustomPaint(
                              painter: SpinWheelPainter(
                                  items: widget.itemList
                              ),
                            ),
                          )
                      ),
                    ),
                    ...widget.itemList.map((each) {
                      int index = widget.itemList.indexOf(each);
                      double rotateInterval = 360 / widget.itemList.length;
                      double rotateAmount = (index + 0.5) * rotateInterval;
                      return RotationTransition(
                        turns: AlwaysStoppedAnimation(rotateAmount/360),
                        child: Transform.translate(
                          offset: Offset(0,-widget.wheelSize/4),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(each.label,style: each.labelStyle),
                          ),
                        ),
                      );
                    }).toList(),
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
         Container(
           alignment: Alignment.topCenter,
             padding: const EdgeInsets.all(0),
             child: const Icon(Icons.location_on_sharp,size: 50,color: Colors.green,)),
      ],
    );
  }
}

class MySpinController{

  late AnimationController _baseAnimation;
  late TickerProvider _tickerProvider;
  bool _xSpinning = false;
  List<SpinItem> _itemList = [];

  Future<void> initLoad({
    required TickerProvider tickerProvider,
    required List<SpinItem> itemList,
  }) async{
    _tickerProvider = tickerProvider;
    _itemList = itemList;
    await setAnimations(_tickerProvider);
  }

  Future<void> setAnimations(TickerProvider tickerProvider) async{
    _baseAnimation = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 200),
    );
  }

  Future<void> spinNow({
    required int luckyIndex,
    int totalSpin = 10,
    int baseSpinDuration = 100
  }) async{

    //getWhereToStop
    int itemsLength = _itemList.length;
    int factor = luckyIndex % itemsLength;
    if(factor == 0) factor = itemsLength;
    double spinInterval = 1 / itemsLength;
    double target = 1 - ( (spinInterval * factor) - (spinInterval/2));

    if(!_xSpinning){
      _xSpinning = true;
      int spinCount = 0;

      do{
        _baseAnimation.reset();
        _baseAnimation.duration = Duration(milliseconds: baseSpinDuration);
        if(spinCount == totalSpin){
          await _baseAnimation.animateTo(target);
        }
        else{
          await _baseAnimation.forward();
        }
        baseSpinDuration = baseSpinDuration + 50;
        _baseAnimation.duration = Duration(milliseconds: baseSpinDuration);
        spinCount++;
      }
      while(spinCount <= totalSpin);

      _xSpinning = false;
    }
  }

}


class SpinWheelPainter extends CustomPainter {
  final List<SpinItem> items;

  SpinWheelPainter({required this.items});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    final paint = Paint()
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.25) // Adjust the shadow color and opacity as needed
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0); // Adjust the blur radius as needed

    const spaceBetweenItems = 0.05; // Adjust this value to set the desired space between items
    final totalSections = items.length;
    const totalAngle = 2 * math.pi;
    final sectionAngleWithSpace = (totalAngle - (totalSections * spaceBetweenItems)) / totalSections;
    const spaceOnBothSides = spaceBetweenItems / 2;

    for (var i = 0; i < items.length; i++) {
      final startAngle = i * (sectionAngleWithSpace + spaceBetweenItems) + spaceOnBothSides;

      paint.color = items[i].color;

      // Draw shadow before drawing the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        shadowPaint,
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        paint,
      );
    }

    // Draw a circle at the center of the wheel
    final centerCircleRadius = radius * 0.05; // Adjust the radius of the center circle as needed
    final centerCirclePaint = Paint()..color = Colors.white; // Adjust the color of the center circle as needed
    canvas.drawCircle(center, centerCircleRadius, centerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



class SpinningWheelPage extends StatefulWidget {
  const SpinningWheelPage({super.key});

  @override
  SpinningWheelPageState createState() => SpinningWheelPageState();
}

class SpinningWheelPageState extends State<SpinningWheelPage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  List<SpinItem> _spinList = [
    SpinItem(label: '0% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color:  Colors.black),
                SpinItem(label: '5% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color: const Color(0xff9e00ff)),
                SpinItem(label: '10% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color: const Color(0xff00a0ff)),
                SpinItem(label: '15% Sale',labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), color: const Color(0xffffe000)),
                SpinItem(label: '20% Sale',labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), color: Colors.white),
                SpinItem(label: '25% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color: const Color(0xffde0000)),
                SpinItem(label: '30% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color: const Color(0xff41d849)),
                SpinItem(label: '35% Sale',labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), color: const Color(0xffff9c00)),
                // SpinItem(label: 'Eggplant', color: Colors.redAccent),
  ];

  MySpinController mySpinController = MySpinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xff0C1B3A)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        StreamBuilder<int>(
  stream: selected.stream,
  builder: (context, snapshot) {
    // Check if data is available or not
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Text(
        'Waiting for data...',
        style: TextStyle(color: Colors.white), // White text
      );
    } else if (snapshot.hasError) {
      return Text(
        'Error: ${snapshot.error}',
        style: const TextStyle(color: Colors.white), // White text
      );
    } else if (!snapshot.hasData) {
      return const Text(
        'No data',
        style: TextStyle(color: Colors.white), // White text
      );
    } else {
      // Display the value from the stream
      return Text(
        'Selected value: ${_spinList[snapshot.data ?? 0].label}',
        style: const TextStyle(color: Colors.white), // White text
      );
    }
  },
)
,

            const SizedBox(height: 40,),
            MySpinner(
              mySpinController: mySpinController,
              wheelSize: MediaQuery.of(context).size.width * 0.8,
              itemList: _spinList,
              onFinished: (p0) {
                log('SPIN IS FINISHEDDDDDDDDD');

              },
            ),
            //circleOverlay(size: Get.width * 0.6,data: ['Apple','Banana','Cucumber','Durian']),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
      int rdm = math.Random().nextInt(6); // Generate a random integer between 0 and 5
selected.add(rdm);     
              await mySpinController.spinNow(luckyIndex: rdm+1,totalSpin: 10,baseSpinDuration: 20);
              
            }, child: const Text('Spin Now')),
          ],
        ),
      ),
    );
  }
}