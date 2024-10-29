import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:coin_scratcher/Constants/colors.dart';
import 'package:coin_scratcher/View/Redemption.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scratchEnable=false;
  @override
  void initState() {
    // TODO: implement initState
    scratchEnable=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.primarycontainerColor,
        title: const Text("Coin Scratcher",style: TextStyle(color: ColorConstants.TextColor),),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Redemption()),
              );
            },
            child: Container(
              decoration: const BoxDecoration(color: ColorConstants.SecondaryColor),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              child: const Text("1000",),),
          ),],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Scratcher(
                enabled:scratchEnable ,
                brushSize: 30,
                threshold: 50,
                color: Colors.red,
                image:Image.asset("assets/images/scratch.png"),
                onChange: (value) => print("Scratch progress: $value%"),
                onThreshold: () => print("Threshold reached, you won!"),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.blue,
                ),
              ),
          CircularCountDownTimer(
            // Countdown duration in Seconds.
            duration: 10,

            // Countdown initial elapsed Duration in Seconds.
            initialDuration:0,

            // Width of the Countdown Widget.
            width: MediaQuery.of(context).size.width / 2,

            // Height of the Countdown Widget.
            height: MediaQuery.of(context).size.height / 2,

            // Ring Color for Countdown Widget.
            ringColor: Colors.grey[300]!,

            // Ring Gradient for Countdown Widget.
            ringGradient: null,

            // Filling Color for Countdown Widget.
            fillColor: Colors.purpleAccent[100]!,

            // Filling Gradient for Countdown Widget.
            fillGradient: null,

            // Background Color for Countdown Widget.
            backgroundColor: Colors.purple[500],

            // Background Gradient for Countdown Widget.
            backgroundGradient: null,

            // Border Thickness of the Countdown Ring.
            strokeWidth: 20.0,

            // Begin and end contours with a flat edge and no extension.
            strokeCap: StrokeCap.round,

            // Text Style for Countdown Text.
            textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

            // Format for the Countdown Text.
            textFormat: CountdownTextFormat.HH_MM_SS,

            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
            isReverse: true,

            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
            isReverseAnimation: false,

            // Handles visibility of the Countdown Text.
            isTimerTextShown: true,

            // Handles the timer start.
            autoStart: true,

            // This Callback will execute when the Countdown Starts.
            onStart: () {
              // Here, do whatever you want
              debugPrint('Countdown Started');
            },

            // This Callback will execute when the Countdown Ends.
            onComplete: () {
              setState(() {
                scratchEnable=true;
              });
              // Here, do whatever you want
              debugPrint('Countdown Ended');
            },

            // timeFormatterFunction: (defaultFormatterFunction, duration) {
            //   if (duration.inSeconds == 0) {
            //     //only format for '0'
            //     return "Start";
            //   } else {
            //     //others durations by it's default format
            //     return Function.apply(defaultFormatterFunction, [duration]);
            //   }
            // },

            // This Callback will execute when the Countdown Changes.
            // onChange: (String timeStamp) {
            //   // Here, do whatever you want
            //   debugPrint('Countdown Changed $timeStamp');
            // },
          ),

            ],
          ),
        ),

      ),
    );
  }
}
