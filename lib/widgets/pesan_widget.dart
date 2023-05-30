import 'package:flutter/material.dart';
import '../screens/chat_detail_screen.dart';

class PesanWidget extends StatelessWidget {
  final List<Chat> chats = const [
    Chat(
      name: 'John Doe',
      avatarUrl: 'https://example.com/avatar1.jpg',
      message: 'Hello',
      time: '10:00 AM',
      unreadCount: 2,
      messages: [
        Message(
          text: 'Hi',
          time: '10:01 AM',
          isMe: true,
        ),
        Message(
          text: 'Hello',
          time: '10:02 AM',
          isMe: false,
        ),
      ],
    ),
    Chat(
      name: 'Jane Smith',
      avatarUrl: 'https://example.com/avatar2.jpg',
      message: 'Hi there!',
      time: '9:30 AM',
      unreadCount: 1,
      messages: [
        Message(
          text: 'Hey',
          time: '9:31 AM',
          isMe: false,
        ),
        Message(
          text: 'How are you?',
          time: '9:32 AM',
          isMe: true,
        ),
      ],
    ),
    // Tambahkan lebih banyak chat di sini
  ];

  const PesanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          Chat chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.avatarUrl),
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(chat.time),
                if (chat.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF5D3891),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
