import 'package:expense_tracker_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';

class SignupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> signup() async {
    errorMessage = null;
    setBusy(true);

    try {
      final user = await _authService.signUpWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
      );

      if (user != null) {
        Fluttertoast.showToast(
          msg: "User Created Successfully!!!",
          toastLength: Toast.LENGTH_LONG, // Duration: 5 seconds
          gravity: ToastGravity.TOP, // Position of the toast
          backgroundColor: Colors.black87, // Background color
          textColor: Colors.white, // Text color
          fontSize: 16.0,
        );
        _navigationService.replaceWithLoginView();
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "User Created Failed!!!",
        toastLength: Toast.LENGTH_LONG, // Duration: 5 seconds
        gravity: ToastGravity.TOP, // Position of the toast
        backgroundColor: Colors.black87, // Background color
        textColor: Colors.white, // Text color
        fontSize: 16.0,
      );
      errorMessage = e.toString().replaceFirst("Exception: ", "");
    } finally {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }

    setBusy(false);
    notifyListeners();
  }

  void navigateToLogin() {
    _navigationService.back();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
