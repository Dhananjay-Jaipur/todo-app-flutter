
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todo extends StatelessWidget {
  final String name;
  final bool done;
  Function(bool?)? onChanged;
  Function(BuildContext?)? delete;


  todo({
    super.key,
    required this.name,
    required this.done,
    required this.onChanged,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 19, right: 19),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: delete,
                icon: Icons.delete,
                backgroundColor: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ]
        ),
        child: Container(
          // increse size of container
          padding: const EdgeInsets.all(22),
          child: Row(
            children: [
              Checkbox(value: done, onChanged: onChanged),
        
              Text(name,
                style: TextStyle(
                  fontSize: 18,
                  decoration: done ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }
}
