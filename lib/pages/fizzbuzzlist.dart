import 'package:flutter/material.dart';

class FizzBuzzList extends StatefulWidget {
  const FizzBuzzList({Key? key, required this.inputNumber}) : super(key: key);

  final int inputNumber;
  @override
  StateFizzBuzzList createState() => StateFizzBuzzList();
}

class StateFizzBuzzList extends State<FizzBuzzList> {
  ScrollController scrollController = ScrollController();
  late int currentMax = 10;
  late List<String> entries;
  bool getMore = true;

  @override
  void initState() {
    super.initState();
    if (widget.inputNumber < 10) {
      currentMax = widget.inputNumber;
    }
    entries = List.generate(currentMax + 1, (i) => getListData(i));
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData(widget.inputNumber);
      }
    });
  }

  getMoreData(int targetValue) {
    if (currentMax < targetValue && 10 > (targetValue % 10) && getMore) {
      for (int i = currentMax; i <= targetValue; i++) {
        entries.add(getListData(i));
      }
      getMore = false;
    } else if (currentMax < targetValue && getMore) {
      for (int i = currentMax; i <= currentMax + 10; i++) {
        entries.add(getListData(i));
      }
      currentMax = currentMax + 10;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fizz Buzz List"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        controller: scrollController,
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

String getListData(int targetValue) {
  if (targetValue % 3 == 0 && targetValue % 5 == 0) {
    return "fizzBuzz";
  } else if (targetValue % 3 == 0) {
    return "fizz";
  } else if (targetValue % 5 == 0) {
    return "buzz";
  } else {
    return targetValue.toString();
  }
}
