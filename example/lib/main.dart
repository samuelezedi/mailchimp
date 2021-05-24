import 'package:flutter/material.dart';
import 'package:mailchimp/mailchimp.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TestingMailchimp(),
    );
  }
}

class TestingMailchimp extends StatefulWidget {
  @override
  _TestingMailchimpState createState() => _TestingMailchimpState();
}

class _TestingMailchimpState extends State<TestingMailchimp> {
  // MailChimpTransaction mailChimpTransaction = MailChimpTransaction(apiKey: "Sdf", server: "SDf");
  MailChimpMarketing marketing =
      MailChimpMarketing(apiKey: "*****", server: "us10");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    marketing.getAuthorizationApp(fields: ['jsdklf', 'sdfd']);
  }

  @override
  Widget build(BuildContext context) {
    bool useSensor = false;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Native Orientation Example'),
          actions: <Widget>[
            Center(child: Text('Sensor:')),
            Switch(
                value: useSensor,
                onChanged: (val) => setState(() => useSensor = val)),
          ],
        ),
        body: NativeDeviceOrientationReader(
          builder: (context) {
            final orientation =
                NativeDeviceOrientationReader.orientation(context);
            print('Received new orientation: $orientation');
            if (orientation == NativeDeviceOrientation.landscapeLeft) {
              return RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                      child: Text('Native Orientation: $orientation\n')));
            } else if (orientation == NativeDeviceOrientation.landscapeRight) {
              return RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                      child: Text('Native Orientation: $orientation\n')));
            }
            return RotatedBox(
                quarterTurns: 4,
                child:
                    Center(child: Text('Native Orientation: $orientation\n')));
          },
          useSensor: useSensor,
        ),
      ),
    );
  }
}
