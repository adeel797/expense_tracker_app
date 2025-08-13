import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:expense_tracker_app/ui/common/app_colors.dart';
import 'package:expense_tracker_app/ui/common/ui_helpers.dart';

import '../../components/bottom_nav.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFf6f9ff), Color(0xFFE3EAFD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Expense Tracker",
            style: TextStyle(color: Colors.black),
          ),
          actions: viewModel.currentIndex == 2
              ? null
              : viewModel.currentIndex == 1
                  ? [
                      IconButton(
                        icon: const Icon(
                          Icons.cloud_upload,
                          color: Colors.black,
                        ),
                        onPressed: viewModel.syncDataFromHome,
                      ),
                    ]
                  : null,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: viewModel.currentView,
        bottomNavigationBar: BottomNav(
          onTap: viewModel.setIndex,
          currentIndex: viewModel.currentIndex,
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
