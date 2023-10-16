import 'package:flutter/material.dart';
import 'class.dart';

class AddTodo extends StatefulWidget {
  final Function(Todo) onAddTodo;
  const AddTodo({
    super.key,
    required this.onAddTodo,
  });

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController addDetailsController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    addTitleController.dispose();
    addDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
              controller: addTitleController,
              decoration: const InputDecoration(
                  hintText: "Add Title",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder()),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter a value";
                }
                return null;
              }),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
              controller: addDetailsController,
              decoration: const InputDecoration(
                  hintText: "Add description",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder()),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter a value";
                }
                return null;
              }),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  Todo newTodo = Todo(
                      title: addTitleController.text.trim(),
                      details: addDetailsController.text.trim());
                  widget.onAddTodo(newTodo);
                  addTitleController.clear();
                  addDetailsController.clear();
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}
