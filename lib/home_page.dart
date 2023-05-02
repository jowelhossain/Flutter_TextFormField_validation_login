import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_validation/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Colors.green,
                  Colors.deepOrange,
                  Colors.blue,
                  Colors.yellow,
                ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200))),
            child: Center(
              child: InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage())),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "lOGin",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )),
      ),
    );
  }
}
