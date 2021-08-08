import 'package:flutter/material.dart';
import 'package:sqlite_demo/sqlite_demo/databaseHelper.dart';
import 'package:sqlite_demo/sqlite_demo/grocery.dart';

// https://learnflutterwithme.com/sqlite             source code
// https://www.youtube.com/watch?v=noi6aYsP7Go&t=3s  by: Learn Flutter with Me

class SqfliteDemo extends StatefulWidget {
  // const SqfliteDemo({Key? key}) : super(key: key);

  @override
  _SqfliteDemoState createState() => _SqfliteDemoState();
}

class _SqfliteDemoState extends State<SqfliteDemo> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Grocery>>(
              future: DatabaseHelper.instance.getGroceries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Grocery>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(child: Text('No Groceries in List.'))
                    : ListView(
                        children: snapshot.data!.map((grocery) {
                          return Center(
                            child: Card(
                              color: selectedId == grocery.id
                                  ? Colors.white70
                                  : Colors.white,
                              child: ListTile(
                                title: Text(grocery.name),
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      textController.text = grocery.name;
                                      selectedId = grocery.id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance.remove(grocery.id!);
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            selectedId != null
                ? await DatabaseHelper.instance.update(
                    Grocery(id: selectedId, name: textController.text),
                  )
                : await DatabaseHelper.instance.add(
                    Grocery(name: textController.text),
                  );
            setState(() {
              textController.clear();
              selectedId = null;
            });
          },
        ),
      ),
    );
  }
}
