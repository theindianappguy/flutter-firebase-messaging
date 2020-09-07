# flutternotify

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Code for Cloud Functions

```const admin = require("firebase-admin");
const functions = require("firebase-functions");

admin.initializeApp(functions.config().firebase);

const fcm = admin.messaging();

exports.senddevices = functions.firestore
  .document("notification/{id}")
  .onCreate((snapshot) => {
    const name = snapshot.get("name");
    const subject = snapshot.get("subject");
    const token = snapshot.get("token");

    const payload = {
      notification: {
        title: "from " + name,
        body: "subject " + subject,
        sound: "default",
      },
    };

    return fcm.sendToDevice(token, payload);
  }); 
  ```

