import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    getToken();

    firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(
        alert: true,
        badge: true,
        provisional: true,
        sound: true
      )
    );

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //_showItemDialog(message);
      },
      //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //_navigateToItemDetail(message);
      },
    );

    super.initState();
  }

  void getToken() async {
    token = await firebaseMessaging.getToken();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Token : $token")),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print(token);
      },
        child: Icon(Icons.print),
      ),
    );
  }

}
