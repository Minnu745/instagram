import 'dart:io';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:instagram/controller.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String img;

  const ChatPage({super.key, required this.name, required this.img});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> message = [];
  final TextEditingController controller = TextEditingController();
  bool _showEmojiPicker = false;

  void toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(widget.img), radius: 20),
            const SizedBox(width: 10),
            Text(
              widget.name,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call_outlined, color: Colors.black, size: 28),
          SizedBox(width: 20),
          Icon(Icons.videocam_outlined, color: Colors.black, size: 28),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                if (msg.endsWith('.jpg') || msg.endsWith('.png')) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(File(msg), width: 200),
                      ),
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 84, 38, 190),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        msg,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          /// Emoji Picker
          if (_showEmojiPicker)
            SizedBox(
              height: 250,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  setState(() {
                    controller.text += emoji.emoji;
                  });
                },
                config: Config(
                  emojiViewConfig: EmojiViewConfig(
                    emojiSizeMax: 28,
                    columns: 7,
                    backgroundColor: const Color(0xFFF2F2F2),
                  ),
                  categoryViewConfig: CategoryViewConfig(
                    indicatorColor: const Color.fromARGB(255, 71, 20, 192),
                    iconColor: Colors.grey,
                    iconColorSelected: const Color.fromARGB(255, 71, 20, 192),
                    backspaceColor: const Color.fromARGB(255, 71, 20, 192),
                  ),
                ),
              ),
            ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 71, 20, 192),
                        radius: 20,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextField(
                          controller: controller,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: "  Message...",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.keyboard_voice_outlined,
                          color: Colors.black54,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.image, color: Colors.black54),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.black54,
                        ),
                        onPressed: toggleEmojiPicker,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 71, 20, 192),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        messages.add(controller.text);
                        controller.clear();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
