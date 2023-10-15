import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'tasks_screen.dart';

class AddTaskScreen extends StatelessWidget {


  final Function addTaskCallback;
  late String newTaskTitle;
  AddTaskScreen(this.addTaskCallback);

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.fromLTRB(60, 30, 80, 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15,),
            Text(textAlign: TextAlign.center, "Add Task", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0, fontWeight: FontWeight.w500),),
            TextField(
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
              //This makes the curser inside the field.
              autofocus: true,
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                  onPressed: (){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text("Add", style: TextStyle(fontSize: 20),))

          ],
        ),
      ),
    );
  }
}
