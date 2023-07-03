import 'dart:ui';
import 'taskscreen.dart';

import 'package:flutter/material.dart';
class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final TextEditingController _daysTEController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              todos.clear();
              if (mounted) {
                setState(() {});
              }
            },
            icon: const Icon(Icons.playlist_remove),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder:(context) => ProductDetails()));
              // showDetailTodoModalSheet();
            },
            onLongPress: () {
              todos[index].isDone = !todos[index].isDone;
              if (mounted) {
                setState(() {});
              }
            },
            leading: todos[index].isDone
                ? const Icon(Icons.done_outline)
                : const Icon(Icons.close),
            title: Text(todos[index].title),
            subtitle: Text(
              todos[index].description,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_forever_outlined),
              onPressed: () {
                todos.removeAt(index);
                if (mounted) {
                  setState(() {});
                }
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          ShowDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDetailTodoModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text('Add New Todo'),
                Text("$_titleTEController"),
                Text("$_descriptionTEController"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                )
              ],
            ),
          );
        });
  }

  void ShowDialog(){
    showDialog (context: context,
      builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
           borderRadius:
            BorderRadius.circular(20.0)), //this right here
            child: Container(
            height: 400,
            child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    const Text('Add New Todo'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                    ),
                SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      controller: _descriptionTEController,
                      decoration: const InputDecoration(hintText: 'Description', ),
                      selectionHeightStyle: BoxHeightStyle.max,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _daysTEController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_titleTEController.text
                        .trim()
                        .isNotEmpty &&
                        _descriptionTEController.text
                            .trim()
                            .isNotEmpty) {
                      todos.add(Todo(_titleTEController.text.trim(),
                          _descriptionTEController.text.trim(), false));
                      if (mounted) {
                        setState(() {});
                      }
                      _titleTEController.clear();
                      _descriptionTEController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add'),
                )
              ],
            ),
        )));});
        }
  }






// To do
// title, description, done

// class Todo {
//   String title, description;
//   bool isDone;
//
//   Todo(this.title, this.description, this.isDone);
// }