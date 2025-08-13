import 'package:expense_tracker_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';
import '../../../services/hive_service.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> login() async {
    errorMessage = null;
    setBusy(true);

    try {
      final user = await _authService.signInWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        // Open Hive boxes for this user
        await _hiveService.openUserBoxes();
        await _hiveService.addDefaultCategoriesIfEmpty();

        Fluttertoast.showToast(
          msg: "Login Successfully!!!",
          toastLength: Toast.LENGTH_LONG, // Duration: 5 seconds
          gravity: ToastGravity.TOP, // Position of the toast
          backgroundColor: Colors.black87, // Background color
          textColor: Colors.white, // Text color
          fontSize: 16.0,
        );

        _navigationService.replaceWithHomeView();
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst("Exception: ", "");
      Fluttertoast.showToast(
        msg: "Login Failed!!!",
        toastLength: Toast.LENGTH_LONG, // Duration: 5 seconds
        gravity: ToastGravity.TOP, // Position of the toast
        backgroundColor: Colors.black87, // Background color
        textColor: Colors.white, // Text color
        fontSize: 16.0,
      );
    } finally {
      emailController.clear();
      passwordController.clear();
    }

    setBusy(false);
    notifyListeners();
  }

  void navigateToSignUpView() {
    _navigationService.navigateToSignupView();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
