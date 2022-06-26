/// Admin Page
/// Features:
/// - Upload image set
/// - Configure audio settings
/// - Set delay time
/// Requires admin account set-up (via link) and log-in
/// TODO at the end

import 'package:diffusion_gui/settings.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    const textInputDecoration = InputDecoration(
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)
        ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.pink, width: 2.0)
        // )
    );
    return Scaffold(
      appBar: AppBar(
          title: const Text("Diffusion Research"),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text(
                "Auracher, László, & Goh",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ]
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            TextFormField( // Username
              decoration: textInputDecoration.copyWith(hintText: "Email"),
              validator: (val) => val!.isEmpty ? "Enter an email": null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField( // Password
              decoration: textInputDecoration.copyWith(hintText: "Password"),
              obscureText: true,
              validator: (val) => val!.length < 6 ? "Enter a password 6+ chars wrong": null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text("Sign in"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                      error = "Could not sign in with given credentials";
                      /// Skipping corners - Firebase Auth for 1 user? Eh.
                      if (email != "test@gmail.com" &&
                          password != "ABCD1234") {
                        error = "You are not authorized to access this page";
                      } else {
                        Get.to(() => const SettingsPage());
                      }
                  }
                }
              ),
            const SizedBox(height: 12.0),
            Text(
              error,
              style: const TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
