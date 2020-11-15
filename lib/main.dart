import 'package:flutter/material.dart';
import 'task.dart';

void main() {
  runApp(TaskList());
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List App',
      home: ScreenList(),
    );
  }
}

class ScreenList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScreenListState();
  }
}

class _ScreenListState extends State<ScreenList> {
  List<Task> tasks = new List<Task>();
  TextEditingController controller = new TextEditingController();

  void addTask(String name) {
    setState(() {
      tasks.add(Task(name));
    });
    controller.clear();
  }

  Widget getItem(Task tasks) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            tasks.done ? Icons.check_box : Icons.check_box_outline_blank,
            size: 42.0,
            color: Colors.green,
          ),
          padding: EdgeInsets.only(left: 10.0, right: 30.0),
          onPressed: () {
            setState(() {
              tasks.done = true;
            });
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tasks.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(tasks.date.toIso8601String()),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task List')),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: addTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                return getItem(tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
