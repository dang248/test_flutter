import 'package:flutter/material.dart';
import 'package:test_flutter/avatar/index.dart';
import 'package:test_flutter/custom_textfield.dart';
import 'package:test_flutter/test_validator.dart';
import 'package:test_flutter/textfield/vts_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String email = "hello";
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState>? viewKeyEn = GlobalKey<FormState>();
  GlobalKey<FormState>? viewKeyDis = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              VTSTextField(
                keyVTS: viewKeyEn,
                controller: controller,
                enabled: true,
              ),
              ElevatedButton(
                onPressed: () {
                  if (viewKeyEn != null &&
                      viewKeyEn!.currentState!.validate()) {
                    setState(() {
                      email = controller.text;
                    });
                  }
                },
                child: const Text('Submit'),
              ),
              Text(email),
              const SizedBox(
                height: 4.0,
              ),

              VTSTextField(
                enabled: false,
                keyVTS: viewKeyDis,
              ),

              // MyCustomForm(),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
