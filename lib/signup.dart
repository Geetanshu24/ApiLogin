import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:sign_in/homepage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://r9n3k67qqg.execute-api.ap-south-1.amazonaws.com/Prod/swagger/index.html#/Token/Token_Post/v1/api/Token'),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body.toString());
        // print(data['token']);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  // login(emailController.text.toString(),
                  //     passwordController.text.toString());
                },
                child: ElevatedButton(
                  onPressed: () {
                    login(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Text("Login Button"),
                ))
          ],
        ),
      ),
    );
  }
}
