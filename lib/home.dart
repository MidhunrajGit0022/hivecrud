import 'package:flutter/material.dart';
import 'package:hivecrud/database/controller/data_controller.dart';
import 'package:hivecrud/screens/add_widget.dart';
import 'package:hivecrud/screens/list_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getalldata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hivecrud"),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddWidget(),
              Expanded(child: Listdata()),
            ],
          ),
        ),
      ),
    );
  }
}
