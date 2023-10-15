import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';


class TasksScreen extends StatelessWidget {

  late String newTaskTitle;


  //We commented the line of code below to make tthe code shorter.
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Scaffold(
      backgroundColor: Colors.white24,
        //The floatingActionButton property of the Scaffold is designed
       //for this purpose, and it automatically handles the positioning
      // of the FAB at the bottom-right corner of the screen.
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.black54,
          //To have the AddTaskScreen sit just above the keyboard, you can wrap it inside a SingleChildScrollView, which determines the padding at the bottom using a MediaQuery.
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen((newTaskTitle){

                      }),
                    )
                )
            );
          }
        // onPressed: () {
        //   showModalBottomSheet(context: context, builder: (context)=>AddTaskScreen());
        // },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:80.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                    child:
                    Icon(Icons.list, size: 40, color: Colors.black54,),
                backgroundColor: Colors.white,),
                SizedBox(height: 15,),
                Text("Todoey", style: TextStyle(fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.w700),),
                //final taskData = Provider.of<TaskData>(context);
                Text("${taskData.tasks.length} tasks", style: TextStyle(color: Colors.white, fontSize: 18),),
                // Container(
                //   width: 393,
                //   height: 470.5,
                //   color: Colors.black,

                //
                // )
              ],
            ),
          ),
          Expanded(
            child: Container(
              //This padding will make the tasks and checkboxes shrink horizontally.
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              //final taskData = Provider.of<TaskData>(context);
              child: TasksWidget(),
            ),
          )
        ],
      ),
    );
  }
}



