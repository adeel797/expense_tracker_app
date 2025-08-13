import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/auth_button.dart';
import '../../components/auth_text_field.dart';
import '../../components/auth_toggle_text.dart';
import '../../components/divider_line.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      LoginViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf6f9ff), Color(0xFFE3EAFD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Login to continue",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email Field
                  AuthTextField(
                    label: "E-mail",
                    controller: viewModel.emailController,
                    obscureText: false,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  verticalSpaceMedium,

                  // Password Field
                  AuthTextField(
                    label: "Password",
                    controller: viewModel.passwordController,
                    obscureText: true,
                    icon: const Icon(Icons.lock_outline),
                  ),
                  const SizedBox(height: 20),

                  // Error message
                  if (viewModel.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        viewModel.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: AuthButton(
                      isBusy: viewModel.isBusy,
                      label: "LOGIN",
                      onPressed: () async {
                        await viewModel.login();
                      },
                    ),
                  ),
                  verticalSpaceSmall,
                  const DividerLine(),

                  // Sign Up Text
                  AuthToggleText(
                    msg: "Don't have an account?",
                    title: 'Register',
                    onPressed: viewModel.navigateToSignUpView,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
