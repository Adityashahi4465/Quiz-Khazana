import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Win extends StatefulWidget {
  const Win({Key? key}) : super(key: key);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assests/img/win.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Share With Friends"),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CONGRATULATIONS!!!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "YOUR ANSTER IS CORRECT",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "You Won",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Rs.5,40,000",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assests/img/cheque.jpg"),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Next"))
                ],
              ),
            ),
            buildConfettiWidget(confettiController, pi / 2)
          ],
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: const Size(50, 20),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 30,
        minBlastForce: 10,
        emissionFrequency: 0.5,
        numberOfParticles: 8,
        gravity: 0.3,
      ),
    );
  }
}
