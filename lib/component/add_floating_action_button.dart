import 'package:flutter/material.dart';
import 'package:todo_app_with_getx/view/add_task_to_server.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'hero',
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTaskFromNetPage()));
      },
      backgroundColor: Colors.white,
      elevation: 0,
      child: const Icon(
        Icons.add,
        color: Color.fromRGBO(22, 190, 105, 1),
        size: 30,),
    );
  }
}
