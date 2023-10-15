import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback onLongPressCallback;
  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.onLongPressCallback });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
        title: Text(taskTitle, style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : null, color: isChecked ? Colors.red : null,),),
        trailing: Checkbox(
           value: isChecked,
           onChanged: checkboxCallback,
            activeColor: Colors.black54,
    )
    );
  }
}

