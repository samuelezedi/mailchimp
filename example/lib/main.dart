import 'package:flutter/material.dart';
import 'package:mailchimp/mailchimp.dart';

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
  MailChimpMarketing marketing = MailChimpMarketing(apiKey: "*****", server: "us10");

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    // mailChimpTransaction.getUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: ()async{
                var data = await marketing.getRoot();

              },
              child: Text('Check',style: TextStyle(fontSize: 20),),
            ),
          )
        ],
      ),
    );
  }
}
