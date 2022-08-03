import 'package:fizzbizzapp/pages/fizzbuzzlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<String> entries = [];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const MyHomeForm(),
      ),
    );
  }
}

class MyHomeForm extends StatefulWidget {
  const MyHomeForm({super.key});

  @override
  MyHomeFormState createState() {
    return MyHomeFormState();
  }
}

class MyHomeFormState extends State<MyHomeForm> {
  final targetValueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool submit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    targetValueController.addListener(() {
      setState(() {
        submit = targetValueController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    targetValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 60, right: 60, bottom: 30),
            child: TextFormField(
              controller: targetValueController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              maxLength: 4,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Number',
                  hintText: 'Enter valid Input  as 1234'),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            child: ElevatedButton(
              onPressed: submit ? () => submitData() : null,
              child: const Text(
                'Submit Number',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  submitData() {
    String input = targetValueController.text;
    int value = int.parse(input);
    print(value);
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Processing Data")));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FizzBuzzList(inputNumber: value)));
    }
  }
}
