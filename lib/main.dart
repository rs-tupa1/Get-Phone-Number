import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Get Phone Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var phoneNumber = <String?>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  final contacts =
                      await ContactsService.openDeviceContactPicker();
                  final value = contacts?.phones?.map((e) => e.value).toList();
                  setState(() {
                    phoneNumber =
                        contacts?.phones?.map((e) => e.value).toList() ??
                            <String>[];
                  });
                  print(value ?? '');
                },
                child: Text('Get Phone Number')),
            ...phoneNumber.map((e) => Text(e ?? '')).toList()
          ],
        ),
      ),
    );
  }
}
