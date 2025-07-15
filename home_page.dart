import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/controller.dart';
import 'package:instagram/chatlist.dart';
import 'package:instagram/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) {
      // Navigate to ProfilePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else {
      // Do nothing or update index for other tabs if needed
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Instagram",
          style: TextStyle(fontSize: 40, fontFamily: 'Cookie'),
        ),
        actions: [
          Icon(Icons.favorite_border_rounded, color: Colors.black),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatListPage()),
              );
            },
            icon: Icon(Icons.messenger_outline_outlined, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 108,
            width: double.infinity,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: index != 0
                              ? LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.purple,
                                  ],
                                )
                              : null,
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/${story[index].dp}',
                                ),
                                radius: 33,
                              ),
                              if (index == 0)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Text(story[index].name, style: TextStyle(fontSize: 11)),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //posttitle
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/${story[index + 1].dp}',
                      ),
                    ),
                    title: Text(story[index + 1].name),
                    trailing: Icon(Icons.more_horiz),
                  ),
                  //post
                  Image.asset(
                    'assets/${story[index + 5].dp}',
                    fit: BoxFit.cover,
                    height: 450,
                    width: double.infinity,
                  ),
                  //post interactions
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.favorite_border, size: 30),
                      SizedBox(width: 20),
                      Icon(Icons.comment_outlined, size: 30),
                      SizedBox(width: 20),
                      Icon(Icons.send_rounded, size: 30),
                      Spacer(),
                      Icon(Icons.bookmark_outline_sharp, size: 30),
                    ],
                  ),
                  SizedBox(height: 10),
                  // caption
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        // SizedBox(
                        //   width: 12,

                        // ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Liked by ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "ig_kireyn",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "others",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: story[index + 1].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),

                        children: [
                          TextSpan(
                            text: story[index + 1].caption,
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    child: Text(
                      "3 hour ago",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
      ),
    );
  }
}
