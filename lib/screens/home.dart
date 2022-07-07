import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kbc_quiz_app/screens/quiz_intro.dart';
import 'package:kbc_quiz_app/services/localdb.dart';
import 'package:kbc_quiz_app/widgets/sidenevbar.dart';
import 'package:kbc_quiz_app/services/home_fire.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "User Name";
  String money = "--";
  String lead = "---";
  String proUrl = "---";
  String level = "0";

  late List quizzes = [];
  getUserDet() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });

    await LocalDB.getMoney().then((value) {
      setState(() {
        money = value.toString();
      });
    });

    await LocalDB.getRank().then((value) {
      setState(() {
        lead = value.toString();
      });
    });

    await LocalDB.getUrl().then((value) {
      setState(() {
        proUrl = value.toString();
      });
    });

    await LocalDB.getLevel().then((value) {
      setState(() {
        level = value.toString();
      });
    });
  }

  getquiz() async {
    await HomeFire.getquizzes().then((returned_quizzes) {
      setState(() {
        quizzes = returned_quizzes;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDet();
    getquiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KBC - Quiz Game'),
        ),
        drawer: SideNev(name, money, lead, proUrl, level),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1652721684678-a147a957a03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=948&q=80",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(backgroundColor: Colors.purple, radius: 35),
                      CircleAvatar(
                          backgroundColor: Colors.redAccent, radius: 35),
                      CircleAvatar(backgroundColor: Colors.green, radius: 35),
                      CircleAvatar(
                          backgroundColor: Colors.yellowAccent, radius: 35),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Stack(
                            children: [
                              Card(
                                elevation: 8,
                                child: Container(
                                  height: 150,
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1652721684678-a147a957a03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=948&q=80",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(width: 10),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Stack(
                            children: [
                              Card(
                                elevation: 8,
                                child: Container(
                                  height: 150,
                                  child: Image.network(
                                      "https://images.unsplash.com/photo-1652721684678-a147a957a03e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=948&q=80",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Stack(
                            children: [
                              Card(
                                elevation: 8,
                                child: Container(
                                  height: 150,
                                  child: Image.network(
                                    "https://images.unsplash.com/photo-1652614347707-df3983ab3ed7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(width: 10),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Stack(
                            children: [
                              Card(
                                elevation: 8,
                                child: Container(
                                  height: 150,
                                  child: Image.network(
                                      "https://images.unsplash.com/photo-1652614347707-df3983ab3ed7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 8,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Image.network(
                              "https://images.unsplash.com/photo-1651151925744-eb3a82fa0cbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Top Player In This Week",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Last Updated 5 Days Ago",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(proUrl),
                                radius: 50,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Player ID - ABD553",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300)),
                                  Text("Rs.$money",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          )
                        ])),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unlock New Quizzes",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QuizIntro(
                                                  QuizAbout: (quizzes[1])[
                                                      "about_quiz"],
                                                  QuizImgUrl: (quizzes[1])[
                                                      "quiz_thumbnail"],
                                                  QuizDuration:
                                                      (quizzes[1])["duration"],
                                                  QuizTopics:
                                                      (quizzes[1])["topics"],
                                                  quizName:
                                                      (quizzes[1])["quiz_name"],
                                                  QuizId:
                                                      (quizzes[1])["Quizid"],
                                                  QuizPrice: (quizzes[1])[
                                                      "unlock_money"],
                                                )));
                                  },
                                  child: Stack(
                                    children: [
                                      Card(
                                        elevation: 8,
                                        child: Container(
                                          height: 150,
                                          child: Image.network(
                                            (quizzes[0])["quiz_thumbnail"],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(width: 10),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                            "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1656052564863-8ef68f491c38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 10),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                            "https://images.unsplash.com/photo-1656052564863-8ef68f491c38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1656052564863-8ef68f491c38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 10),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                            "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(width: 10),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 8,
                                      child: Container(
                                        height: 150,
                                        child: Image.network(
                                            "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 8,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Image.network(
                              "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1655704705321-3ac52dc67f70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ],
                    options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(backgroundColor: Colors.purple, radius: 35),
                      CircleAvatar(
                          backgroundColor: Colors.redAccent, radius: 35),
                      CircleAvatar(backgroundColor: Colors.green, radius: 35),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(backgroundColor: Colors.purple, radius: 35),
                      CircleAvatar(
                          backgroundColor: Colors.redAccent, radius: 35),
                      CircleAvatar(backgroundColor: Colors.green, radius: 35),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(backgroundColor: Colors.purple, radius: 35),
                      CircleAvatar(
                          backgroundColor: Colors.redAccent, radius: 35),
                      CircleAvatar(backgroundColor: Colors.green, radius: 35),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "v1.0 Made By ADITYA SHAHI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          ),
        ));
  }
}
