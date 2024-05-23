import 'package:flutter/material.dart';
class FormScreen extends StatelessWidget {
  const FormScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }
  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return null;
    }
    if (input.length <= 5) {
      return "Email must have more than 5 characters.";
    }
    if (!input.contains('@')) {
      return "Email must contain the '@' character.";
    }
    if (!input.endsWith('.com') && !input.endsWith('.de')) {
      return "Email must end with '.com' or '.de'.";
    }
    return null;
  }
  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return "Password cannot be empty.";
    }
    if (input.length < 6 || input.length > 12) {
      return "Password must be between 6 and 12 characters long.";
    }
    return null;
  }
}




