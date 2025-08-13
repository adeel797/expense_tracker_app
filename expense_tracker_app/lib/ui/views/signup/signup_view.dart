import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../components/auth_button.dart';
import '../../components/auth_text_field.dart';
import '../../components/auth_toggle_text.dart';
import '../../components/divider_line.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      SignupViewModel viewModel,
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
            child: _signUpForm(viewModel),
          ),
        ),
      ),
    );
  }

  Widget _signUpForm(SignupViewModel viewModel) {
    return Container(
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
          verticalSpaceSmall,
          const Text(
            "Create Account 📝",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          verticalSpaceSmall,
          Text(
            "Sign up to get started",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          verticalSpaceMedium,

          // Name
          AuthTextField(
            label: 'Name',
            controller: viewModel.nameController,
            obscureText: false,
            icon: const Icon(Icons.person_outline),
          ),
          verticalSpaceMedium,

          // Email
          AuthTextField(
            label: 'E-mail',
            controller: viewModel.emailController,
            obscureText: false,
            icon: const Icon(Icons.email_outlined),
          ),
          verticalSpaceMedium,

          // Password
          AuthTextField(
            label: 'Password',
            controller: viewModel.passwordController,
            obscureText: true,
            icon: const Icon(Icons.lock_outlined),
          ),
          verticalSpaceMedium,

          // Error
          if (viewModel.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: AuthButton(
              isBusy: viewModel.isBusy,
              label: 'SIGN UP',
              onPressed: () async {
                await viewModel.signup();
              },
            ),
          ),
          verticalSpaceSmall,
          const DividerLine(),

          // Login Text
          AuthToggleText(
            msg: "Already have an account?",
            title: 'Login',
            onPressed: viewModel.navigateToLogin,
          ),
        ],
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();
}
