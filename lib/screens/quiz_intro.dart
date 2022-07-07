import 'package:flutter/material.dart';
import 'package:kbc_quiz_app/services/QuizDhandha.dart';
import 'package:kbc_quiz_app/services/cheackQuizUnloack.dart';

class QuizIntro extends StatefulWidget {
  String quizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizId;
  String QuizPrice;
  QuizIntro({
    super.key,
    required this.QuizAbout,
    required this.QuizDuration,
    required this.QuizImgUrl,
    required this.quizName,
    required this.QuizTopics,
    required this.QuizId,
    required this.QuizPrice,
  });
  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  bool quizIsUnlocked = false;
  getQuizUnlocked() async {
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId)
        .then((unlockStatus) {
      setState(() {
        quizIsUnlocked = unlockStatus;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getQuizUnlocked();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text(
          quizIsUnlocked ? "START QUIZ" : " UNLOCK QUIZ",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          quizIsUnlocked
              ? print("QUIZ IS ALREADY UNLOCKED")
              : QuizDhandha.buyQuiz(
                  QuizID: widget.QuizId,
                  QuizPrice: int.parse(widget.QuizPrice),
                ).then((quizlockedHai) {
                  if (quizlockedHai) {
                    setState(() {
                      quizIsUnlocked = true;
                    });
                  } else {
                    return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                  "You don't have sufficient money to buy QUIZ!"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK")),
                              ],
                            ));
                  }
                });
        },
      ),
      appBar: AppBar(
        title: const Text("Quiz Intro"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.quizName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Image.network(
                widget.QuizImgUrl,
                fit: BoxFit.cover,
                height: 230,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.topic_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Related To:-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      widget.QuizTopics,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.timer),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Duration:-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "${widget.QuizDuration} Minutes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.topic_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "About Quiz:-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      widget.QuizAbout,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
