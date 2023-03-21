import 'package:flutter/material.dart';
import 'package:kbc_quiz_app/screens/home.dart';
import 'package:kbc_quiz_app/screens/login.dart';
import 'package:kbc_quiz_app/screens/profile.dart';
import 'package:kbc_quiz_app/services/auth.dart';
import 'package:kbc_quiz_app/services/localdb.dart';

class SideNev extends StatelessWidget {
  String name;
  String money;
  String rank;
  String proUrl;
  String level;

  SideNev(@required this.name, @required this.money, @required this.rank,
      @required this.proUrl, @required this.level);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(198, 0, 178, 1),
        child: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: name,
                              rank: rank,
                              proUrl: proUrl,
                              level: level,
                              money: money,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(proUrl),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rs.$money",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Leaderboard - $rank  th Rank",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 24,
            ),
            listItem(
              label: ' DAILY QUIZE',
              icon: Icons.quiz,
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
            ),
            listItem(
              label: ' LEADERBOARD',
              icon: Icons.leaderboard,
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
            ),
            listItem(
              label: 'HOW TO USE',
              icon: Icons.question_answer,
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
            ),
            listItem(
              label: 'ABOUT US',
              icon: Icons.face,
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
            ),
            listItem(
              label: "LogOut",
              icon: Icons.logout,
              context: context,
              path:
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon,
    required BuildContext context,
    required MaterialPageRoute path,
  }) {
    final color = Colors.white;
    final hovercoor = Colors.white60;

    return ListTile(
      leading: Icon(icon, color: color,),
      hoverColor: color,
      title: Text(
        label,
        style: TextStyle(color: color,),
      ),
      onTap: () async {
        await signOut();
        Navigator.pushReplacement(context, path);
      },
    );
  }
}
