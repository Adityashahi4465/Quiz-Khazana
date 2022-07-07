import 'package:flutter/material.dart';

class Looser extends StatelessWidget {
  const Looser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assests/img/loose.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Retry"),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "OH SORRY!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "YOUR ANSWER IS INCORRECT",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You Won",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Text(
                "Rs.5,40,000",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Icon(
                Icons.error_outline,
                size: 100,
                color: Colors.red,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Go To Rewards"))
            ],
          ),
        ),
      ),
    );
  }
}
