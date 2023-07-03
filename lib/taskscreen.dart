import 'home.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController _descriptionTEController = TextEditingController();
  final TextEditingController _titleTEController = TextEditingController();

  // get counter => CounterScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
      ),
      body:

      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Padding(padding: EdgeInsets.only(top: 60, left: 40)),
              Text("Current Task  ", style: TextStyle(fontSize: 16),),
              Text("$_descriptionTEController", style: TextStyle(fontSize: 16),),
              Text("$_titleTEController", style: TextStyle(fontSize: 16),),
              // Container(
              //   alignment: Alignment.topLeft,
              //   padding: EdgeInsets.only(left: 10, right: 20),
              //   child: Text(
              //     counter.toString(),
              //     style: const TextStyle(fontSize: 20),
              //   ),
              // ),
              ElevatedButton(onPressed: () {
              }, child: Text('Delete')),
            ],
          ),
        ),
      ),
    );
  }
}