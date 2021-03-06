import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;
  final bool completed;
  final Function(bool?) onChanged;
  final Function(DismissDirection?) onDismiss;
  const TaskItemWidget(
      {Key? key,
      required this.title,
      required this.completed,
      required this.onChanged,
      required this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismiss,
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child: CheckboxListTile(
        value: completed,
        onChanged: onChanged,
        title: Text(
          title,
          style: TextStyle(
              decoration:
                  completed ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        secondary: Icon(completed ? Icons.check_circle : Icons.error),
      ),
      background: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: const Align(
            alignment: Alignment(-0.9, 0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            )),
      ),
      direction: DismissDirection.startToEnd,
    );
  }
}
