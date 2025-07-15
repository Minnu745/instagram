import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> messages = [];
TextEditingController controller = TextEditingController();
TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();

class Login {
  // Signup — Save username and password
  Future<void> signup(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs == null) {
      print("SharedPreferences instance is null!");
      return;
    }
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    if (username == savedUsername && password == savedPassword) {
      return true;
    } else {
      return false;
    }
  }
}

// class SharedPreferences {
//   static Future getInstance() async {}
// }

class Stories {
  final String name;
  final String dp;
  final String caption;

  Stories({required this.name, required this.dp, required this.caption});
}

List<Stories> story = [
  Stories(name: 'Your story', dp: 'img3.jpg', caption: "h"),
  Stories(name: 'call_meh_fam', dp: 'img1.png', caption: " Freedom!!!"),
  Stories(
    name: 'die.hrader_sie',
    dp: 'img2.jpg',
    caption: " This is an Amazing post",
  ),
  Stories(name: 'verxin_ig', dp: 'img4.jpg', caption: "h"),
  Stories(name: 'king_leo', dp: 'img5.jpg', caption: "h"),
  Stories(name: 'wreck.it_half', dp: 'img6.jpg', caption: "h"),
  Stories(name: 'i_am_ken', dp: 'img7.jpg', caption: "h"),
];

List<String> usernames = [
  'Your story',
  'james',
  'elena',
  'rohit',
  'maria',
  'ahmed',
  'olivia',
  'lucas',
  'anika',
];

List<String> imageAssets = [
  'assets/img1.png',
  'assets/img4.jpg',
  'assets/img2.jpg',
  'assets/img5.jpg',
  'assets/img6.jpg',
  'assets/img7.jpg',
  'assets/img3.jpg',
  'assets/img1.jpg',
  'assets/img4.jpg',
];

List<String> postUsernames = ['john', 'maria', 'rohit'];

List<String> postProfilePics = [
  'assets/img1.png',
  'assets/img4.jpg',
  'assets/img2.jpg',
];

List<String> postImages = [
  'assets/post1.jpg',
  'assets/post3.jpg',
  'assets/post2.jpg',
];

List<String> postCaptions = [
  "Enjoying the sunny vibes!☀️",
  "Moments like these ✨",
  "Good times with friends!😎🤩",
];

// Chat List
List<String> chatNames = [
  'john',
  'susan',
  'james',
  'elena',
  'rohit',
  'maria',
  'anna',
];

List<String> chatImages = [
  'assets/img1.png',
  'assets/img2.jpg',
  'assets/img3.jpg',
  'assets/img4.jpg',
  'assets/img5.jpg',
  'assets/img6.jpg',
  'assets/post1.jpeg',
];

List<String> chatMessages = [
  'Hey, how are you?',
  'Did you see the story?',
  'Let\'s meet soon!',
  'Assignment done?',
  'Where are you?',
  'That was fun!',
  'Good morning!',
];

List<String> noteNames = ['your note', 'john', 'anna', 'maria', 'rohit'];
List<String> noteImages = [
  'assets/img1.png',
  'assets/img2.jpg',
  'assets/img3.jpg',
  'assets/img4.jpg',
  'assets/img5.jpg',
];

// True means message is unread
List<bool> isUnread = [true, false, true, false, true, false, true];

List<String> noteTexts = [
  'Share a note',
  'Feeling happy 😄',
  'Back to work 🧑‍💻',
  'Weekend plans?',
  'Don\'t forget to chill 🧊',
];
