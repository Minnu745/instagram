import 'package:flutter/material.dart';
import 'package:instagram/logout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'okay_kaiden_459',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Icon(Icons.add_box_outlined, color: Colors.black),
          const SizedBox(width: 15),
          //Icon(Icons.menu, color: Colors.black),
          //SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstagramSettingsPage(),
                ),
              );
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Profile Section with image and bio
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile + Text Column
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        // backgroundImage: AssetImage('assets/pic12.jpeg'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'user',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('✌️', style: TextStyle(color: Colors.black)),
                      Text('....', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Stats
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ProfileStat(title: '1', subtitle: 'Posts'),
                        ProfileStat(title: '877', subtitle: 'Followers'),
                        ProfileStat(title: '813', subtitle: 'Following'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Edit profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Share profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.person_add_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Story Highlights
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: const [
                  StoryCircle(label: "New", image: 'assets/profile.png'),
                  StoryCircle(label: "🙂", image: 'assets/story1.png'),
                ],
              ),
            ),

            const Divider(color: Colors.black),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.grid_on, color: Colors.black),
                Icon(Icons.video_call, color: Colors.black),
                Icon(Icons.person_pin_outlined, color: Colors.black),
              ],
            ),

            const SizedBox(height: 10),

            //posts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return Image.asset('assets/grid1.png', fit: BoxFit.cover);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfileStat({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(subtitle, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}

class StoryCircle extends StatelessWidget {
  final String label;
  final String image;

  const StoryCircle({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    final bool isNew = label == "New";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          isNew
              ? const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.add, color: Colors.black, size: 30),
                )
              : CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
