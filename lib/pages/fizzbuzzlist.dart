import 'package:flutter/material.dart';

final List<String> entries = [];

class FizzBuzzList extends StatelessWidget {
  const FizzBuzzList({Key? key, required this.inputNumber}) : super(key: key);

  final int inputNumber;

  @override
  Widget build(BuildContext context) {
    entries.clear();
    getListData(inputNumber);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fizz Buzz List"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Center(
                child: Text(entries[index]),
              ),
              tileColor: Colors.grey,
            ),
          );
        },
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
      ),
    );
  }
}

void getListData(int targetValue) {
  for (int i = 1; i <= targetValue; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      entries.add("fizzBuzz");
    } else if (i % 3 == 0) {
      entries.add("fizz");
    } else if (i % 5 == 0) {
      entries.add("buzz");
    } else {
      entries.add(i.toString());
    }
  }
}
