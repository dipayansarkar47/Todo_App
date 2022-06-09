import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  final List<String> task = <String>[];
  final List<int> task_no = <int>[];
  int count = 0;

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      task.insert(count, nameController.text);
      task_no.insert(count, count);
      count++;
    });
  }

  void removeItemFromList(int index) {
    setState(() {
      task.removeAt(index);
      task_no.removeAt(index);
      count = task_no.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: task.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                iconColor: Colors.black,
                tileColor: Colors.blue,
                leading: Icon(Icons.check_box_outline_blank),
                title: Text(
                  '${task[index]}',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      removeItemFromList(index);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          label: Text('Add a Task'),
          icon: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Task'),
                  content: TextField(
                    autofocus: true,
                    maxLength: 20,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Task',
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Add'),
                      onPressed: () {
                        setState(() {
                          addItemToList();
                          nameController.clear();
                        });

                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
