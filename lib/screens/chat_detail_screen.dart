import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatDetailScreen extends StatefulWidget {
  final Chat chat;

  const ChatDetailScreen({Key? key, required this.chat}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _recording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name),
        backgroundColor: const Color(0xFF5D3891),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF6869AC), // Ubah dengan warna yang diinginkan
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/bg-chat.png'), // Ubah dengan path ke gambar yang diinginkan
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: widget.chat.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message = widget.chat.messages[index];
                    return Container(
                      alignment: message.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: message.isMe
                              ? Colors.purple.shade50
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.text,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              message.time,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildInputArea(),
            ],
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      Message message = Message(
        text: messageText,
        time: DateTime.now().toString(),
        isMe: true,
      );
      setState(() {
        widget.chat.messages.add(message);
        _messageController.clear();
      });
    }
  }

  void _startRecording() {
    setState(() {
      _recording = true;
    });
  }

  void _stopRecording() {
    setState(() {
      _recording = false;
    });

    Fluttertoast.showToast(msg: 'Voice note recorded!');
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Send Message',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: Icon(_recording ? Icons.stop : Icons.keyboard_voice_rounded),
            onPressed: () {
              if (_recording) {
                _stopRecording();
              } else {
                _startRecording();
              }
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send_rounded),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String avatarUrl;
  final String message;
  final String time;
  final int unreadCount;
  final List<Message> messages;

  const Chat({
    required this.name,
    required this.avatarUrl,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.messages,
  });
}

class Message {
  final String text;
  final String time;
  final bool isMe;

  const Message({
    required this.text,
    required this.time,
    required this.isMe,
  });
}
