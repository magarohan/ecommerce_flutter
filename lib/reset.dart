import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage
    extends
        StatefulWidget {
  const ResetPasswordPage({
    super.key,
  });

  @override
  State<
    ResetPasswordPage
  >
  createState() =>
      _ResetPasswordPageState();
}

class _ResetPasswordPageState
    extends
        State<
          ResetPasswordPage
        > {
  final TextEditingController
  emailController =
      TextEditingController();
  final _formKey =
      GlobalKey<
        FormState
      >();
  bool
  isLoading =
      false;

  @override
  void
  dispose() {
    emailController.dispose();
    super.dispose();
  }

  bool
  isValidEmail(
    String
    email,
  ) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(
      email,
    );
  }

  Future<
    void
  >
  sendPasswordResetLink(
    String
    email,
  ) async {
    setState(
      () => isLoading = true,
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(
          content: Text(
            "Password reset link sent to your email",
          ),
          backgroundColor: Colors.green,
        ),
      );
      emailController.clear();
    } on FirebaseAuthException catch (
      e
    ) {
      if (!mounted) {
        return;
      }

      String
      errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        default:
          errorMessage =
              e.message ??
              'Something went wrong';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter your email address and we'll send you a link to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
                validator:
                    (
                      value,
                    ) {
                      if (value ==
                              null ||
                          value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!isValidEmail(
                        value.trim(),
                      )) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            sendPasswordResetLink(
                              emailController.text.trim(),
                            );
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Send Reset Link",
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
