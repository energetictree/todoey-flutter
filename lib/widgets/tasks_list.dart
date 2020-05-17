import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) {
        return ListView.builder(
//       padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          itemCount: value.taskCount,
          itemBuilder: (context, index) {
            final task = value.tasks[index];
            print({task.isDone});
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                value.deleteTask(task);
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  //value.toggleTask(index);
                  value.updateTask(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}

// class TasksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskData>(
//       builder: (context, value, child) {
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             final task = value.tasks[index];
//             print({task.isDone});
//             return Dismissible(
//               key: UniqueKey(),
//               background: Container(
//                 padding: EdgeInsets.all(10.0),
//                 color: Colors.red,
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'DELETE',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               direction: DismissDirection.endToStart,
//               onDismissed: (direction) {
//                 value.deleteTask(task);
//               },
//               child: TaskTile(
//                 taskTitle: task.name,
//                 isChecked: task.isDone,
//                 checkboxCallback: (checkboxState) {
//                   //value.toggleTask(index);
//                   value.updateTask(task);
//                 },
//                 longpressCallback: () {
//                   value.deleteTask(task);
//                 },
//               ),
//             );
//           },
//           itemCount: value.taskCount,
//         );
//       },
//     );
//   }
// }
