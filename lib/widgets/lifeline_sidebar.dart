import 'package:flutter/material.dart';

class Lifeline_Drawer extends StatefulWidget {
  const Lifeline_Drawer({Key? key}) : super(key: key);

  @override
  State<Lifeline_Drawer> createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "LifeLine",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // *******************   1st LifeLine   **********************

                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purple),
                        child: const Icon(
                          Icons.people,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Audience\n Poll",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // ************************  2nd LifeLine   **************************
                Column(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black54),
                        child: const Icon(
                          Icons.change_circle,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Joker\n Question",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                //               ***********    3rd LifeLine   *******************
                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purple),
                        child: const Icon(
                          Icons.two_k_plus_sharp,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Double\n Dip",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // *******************   4th LifeLine   **********************
                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purple),
                        child: const Icon(
                          Icons.desktop_mac,
                          size: 33,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ask The\n Expert",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black12,
              thickness: 2,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const Text(
                  "Prices",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      title: Text(
                        "Rs. ${(5000) * (index + 1)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      trailing: Icon(Icons.circle),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
