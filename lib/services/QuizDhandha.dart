import 'package:cloud_firestore/cloud_firestore.dart';
import 'localdb.dart';

class QuizDhandha {
  static Future<bool> buyQuiz(
      {required int QuizPrice, required String QuizID}) async {
    String user_id = "";
    bool paisaHaiKya = false;
    await LocalDB.getUserID().then((uID) {
      user_id = uID!;
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user_id)
        .get()
        .then((user) {
      paisaHaiKya = QuizPrice <= int.parse(user.data()!["money"]);
    });

    if (paisaHaiKya) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user_id)
          .collection("unlocked_quizzes")
          .doc(QuizID)
          .set({"unlocked_at": DateTime.now()});
      //DO YOUR TASK HERE
      print("QUIZ IS UNLOCKED NOW");
      return true;
    } else {
      print("PAISA KAMA KE AAO PEHLE");
      return false;
    }
  }
}
