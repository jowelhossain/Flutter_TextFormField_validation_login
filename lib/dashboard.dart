import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashBoard extends StatefulWidget {
  String? email;
  String? password;
  DashBoard({this.email, this.password, super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                backgroundColor: Colors.orange,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.email}"),
              Text("${widget.password}"),
            ],
          ),
        ],
      ),
    );
  }
}
