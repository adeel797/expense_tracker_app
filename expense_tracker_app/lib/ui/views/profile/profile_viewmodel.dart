import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';
import '../../../services/hive_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _hiveService = locator<HiveService>();
  final _firestore = FirebaseFirestore.instance;

  String? _userEmail;
  String? get userEmail => _userEmail;

  String? _userName;
  String? get userName => _userName;

  ProfileViewModel() {
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    setBusy(true);
    try {
      final currentUser = _authService.getCurrentUser(); // Get current user from AuthService
      if (currentUser == null) {
        _userEmail = 'No user logged in';
        _userName = null;
      } else {
        final userId = currentUser.uid; // Adapt as per your AuthService user model

        // Fetch user document from Firestore
        final userDoc = await _firestore.collection('users').doc(userId).get();

        if (userDoc.exists) {
          final data = userDoc.data()!;
          _userEmail = data['email'] ?? 'No email';
          _userName = data['name'] ?? 'No name';
        } else {
          _userEmail = currentUser.email;
          _userName =  currentUser.displayName ?? 'No name';
        }
      }
    } catch (e) {
      _userEmail = 'Error fetching user details';
      Fluttertoast.showToast(
        msg: 'Failed to load user details: $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setBusy(false);
    notifyListeners();
  }


  void signOut() async {
    try {
      await _authService.signOut();
      _hiveService.closeUserBoxes();
      _navigationService.replaceWithLoginView();
    } catch (e) {
      locator<DialogService>().showDialog(
        title: 'Error',
        description: 'Sign out failed: ${e.toString()}',
      );
    }
  }

}
