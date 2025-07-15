import 'package:flutter/material.dart';
import 'package:instagram/login_page.dart';
import 'package:instagram/sign_up.dart';

class InstagramSettingsPage extends StatelessWidget {
  const InstagramSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings and activity"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),

          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: const Color.fromARGB(20, 0, 0, 0),
            ),
          ),

          const SizedBox(height: 16),

          // Account Center
          const SectionTitle(title: "Your account"),
          SettingsTile(
            icon: Icons.person,
            title: "Accounts Center",
            subtitle: "Password, security, personal details, ad preferences",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color.fromARGB(179, 0, 0, 0),
            ),
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // How you use Instagram
          const SectionTitle(title: "How you use Instagram"),
          SettingsTile(icon: Icons.bookmark_border, title: "Saved"),
          SettingsTile(icon: Icons.archive, title: "Archive"),
          SettingsTile(icon: Icons.bar_chart, title: "Your activity"),
          SettingsTile(icon: Icons.notifications_none, title: "Notifications"),
          SettingsTile(icon: Icons.access_time, title: "Time management"),

          const SizedBox(height: 24),

          // For professionals
          const SectionTitle(title: "For professionals"),
          SettingsTile(icon: Icons.insights, title: "Insights"),
          SettingsTile(
            icon: Icons.verified_outlined,
            title: "Meta Verified",
            subtitle: "Not subscribed",
          ),

          const SizedBox(height: 24),

          // Also from Meta
          const SectionTitle(title: "Also from Meta"),
          SettingsTile(icon: Icons.chat, title: "WhatsApp"),
          SettingsTile(icon: Icons.edit, title: "Edits", showDot: true),
          SettingsTile(icon: Icons.camera, title: "Threads"),
          SettingsTile(icon: Icons.facebook, title: "Facebook"),
          SettingsTile(icon: Icons.message, title: "Messenger"),
          SettingsTile(
            icon: Icons.brightness_1_outlined,
            title: "Meta AI",
            showDot: true,
          ),
          SettingsTile(icon: Icons.remove_red_eye, title: "Ray-Ban Meta"),

          const SizedBox(height: 24),

          // Login options
          const SectionTitle(title: "Login"),
          SettingsTile(
            title: "Add account",
            textColor: Colors.blueAccent,
            onTap: () {},
          ),
          SettingsTile(
            title: "Log out",
            textColor: Colors.redAccent,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          SettingsTile(
            title: "Log out all accounts",
            textColor: Colors.redAccent,
            onTap: () {},
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final bool showDot;
  final Color? textColor;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.showDot = false,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: const Color.fromARGB(179, 0, 0, 0))
          : null,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: textColor ?? const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          if (showDot)
            Container(
              margin: const EdgeInsets.only(left: 6),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(color: Color.fromARGB(137, 0, 0, 0)),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(179, 0, 0, 0),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
