import 'package:fizzbizzapp/pages/fizzbuzzlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<String> entries = [];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fizz Buzz"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const MyHomeForm(),
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
          SizedBox(
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
    if (_formKey.currentState!.validate()) {
      if (value <= 1000) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FizzBuzzList(inputNumber: value)));
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Invalid Number Detected !"),
                content: const Text("Please enter Number less than 1000 "),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Ok'),
                    child: const Text('Ok'),
                  ),
                ],
              );
            });
      }
    }
  }
}
