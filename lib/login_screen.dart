import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid')),
                    );
                  } else {
                    // Form is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is invalid')),
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email cannot be empty.";
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