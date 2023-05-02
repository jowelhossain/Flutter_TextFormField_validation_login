import 'package:flutter/material.dart';
import 'package:flutter_form_validation/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordController1 = new TextEditingController();
  bool isObsecure1 = true;
  bool isObsecure2 = true;

  GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/hi.jpeg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: GestureDetector(
                onDoubleTap: () {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                "Welcome to our \nInterface",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              }
                              if (value.length < 5) {
                                return "Invalid email";
                              }
                              if (!value.contains("@")) {
                                return "Invalid email";
                              }
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.2),
                                filled: true,
                                hintText: "Enter Email",
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password can't be empty";
                              }
                              if (value.length < 8) {
                                return "Password most be 8 - 16 chracter";
                              }
                              if (value.length > 16) {
                                return "Password must be 8 - 16 chracter";
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isObsecure1,
                            controller: passwordController,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.2),
                                filled: true,
                                hintText: "Enter Password",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObsecure1 = !isObsecure1;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_sharp)),
                                prefixIcon: Icon(Icons.password),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            onEditingComplete: () {
                              if (_formkey.currentState!.validate()) {
                                print("success");
                              } else {
                                print("invalid");
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password can't be empty";
                              }
                              if (value.length < 8) {
                                return "Password most be 8 - 16 chracter";
                              }
                              if (value.length > 16) {
                                return "Password must be 8 - 16 chracter";
                              }

                              if (value != passwordController.text) {
                                return "Password doesn't match";
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isObsecure2,
                            controller: passwordController1,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(.2),
                                filled: true,
                                hintText: "Confirm Password",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObsecure2 = !isObsecure2;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_sharp)),
                                prefixIcon: Icon(Icons.password),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                )),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: Text("Forgot Password?")),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DashBoard(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            )));
                                print("success");
                              } else {
                                print("invalid");
                              }
                            },
                            color: Colors.blueAccent,
                            height: 40,
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text("Sign in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(color: Colors.blue),
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
