import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      ProfileViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator(color: Colors.blueAccent))
          : Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Avatar with Gradient Border
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      color: Colors.black,
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name
              Text(
                viewModel.userName ?? 'No Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),

              // Email
              Text(
                viewModel.userEmail ?? 'No Email',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildProfileTile(
                      icon: Icons.person,
                      color: Colors.blueAccent,
                      title: "Username",
                      subtitle: viewModel.userName ?? 'No Name',
                    ),
                    _divider(),
                    _buildProfileTile(
                      icon: Icons.email,
                      color: Colors.purpleAccent,
                      title: "Email",
                      subtitle: viewModel.userEmail ?? 'No Email',
                    ),
                    _divider(),
                    _buildProfileTile(
                      icon: Icons.logout,
                      color: Colors.redAccent,
                      title: "Logout",
                      subtitle: "Sign out from account",
                      onTap: viewModel.signOut,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, thickness: 0.5);

  Widget _buildProfileTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
      onTap: onTap,
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
