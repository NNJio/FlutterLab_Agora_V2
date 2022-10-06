import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

import 'chat.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: '9fd8b7df312a40df8986f39bd3b45cd5',
          channelName: 'Test',
          tempToken:
              '007eJxTYKjfuv6haE3k9kTLrNCFNtwOIm8nG66YXfDt69K9yh+Pn+lVYLBMS7FIMk9JMzY0SjQxSEmzsLQwSzO2TEoxTjIxTU4xlRa0SZ6VZJusUVHEwsgAgSA+C0NIanEJAwMApAQhFQ=='));
  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  @override
  Widget build(BuildContext context) {
    return PIPView(builder: (context, isFloating) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChatScreen())),
                  icon: const Icon(Icons.arrow_back_ios))
            ],
            title: const Text('Video Call'),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
              child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: const [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                  BuiltInButtons.switchCamera,
                ],
              ),
              ElevatedButton(
                child: const Text('EiEi'),
                onPressed: () {
                  PIPView.of(context)?.presentBelow(const ChatScreen());
                },
              ),
            ],
          )),
        ),
      );
    });
  }
}
