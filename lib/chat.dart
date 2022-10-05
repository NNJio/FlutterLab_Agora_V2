import 'package:agora/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'message.dart';
import 'message_test_field.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const VideoCallScreen())),
              icon: const Icon(Icons.video_call))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              reverse: true,
              itemCount: _message.length,
              itemBuilder: (_, index) => _message[index],
              separatorBuilder: (_, __) => const SizedBox(
                height: 16,
              ),
            ),
          ),
          const MessageTextField()
        ],
      ),
    );
  }
}

const _message = <MessageBubble>[
  MessageBubble(
    message: 'Hello.',
    date: '10 / 4 / 2022 : 17:03',
    profileImageUrl:
        'https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru.jpg',
  ),
  MessageBubble(
    message: 'Hi.',
    date: '10 / 4 / 2022 17:03',
    profileImageUrl:
        'https://www.greenscene.co.id/wp-content/uploads/2021/07/Vegeta-1.jpg',
  ),
  MessageBubble(
    message: 'How old are You.',
    date: '10 / 4 / 2022 17:04',
    profileImageUrl:
        'https://dragonball.guru/wp-content/uploads/2021/01/goku-dragon-ball-guru.jpg',
  ),
  MessageBubble(
    message: 'I m 23 Year old.',
    date: '10 / 4 / 2022 17:04',
    profileImageUrl:
        'https://www.greenscene.co.id/wp-content/uploads/2021/07/Vegeta-1.jpg',
  ),
];
