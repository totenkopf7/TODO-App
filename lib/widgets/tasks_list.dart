import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = taskData.tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          taskTitle: task.name,
          checkboxCallback: (checkboxState) {
            taskData.updateTask(task);
          },
          onLongPressCallback: (){
            taskData.deleteTask(task);
          },
        );
      },
      itemCount: taskData.tasks.length,
    );
  }
}
