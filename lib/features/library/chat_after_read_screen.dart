import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/library/chat_after_read_cubit.dart';
import 'package:testabd/features/library/chat_after_read_state.dart';

class ChatAfterReadScreen extends StatelessWidget {
  final String pdfUrl;
  final int nextStartPage;
  final int totalPages;

  const ChatAfterReadScreen({
    super.key,
    required this.pdfUrl,
    required this.nextStartPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<ChatAfterReadCubit>()..connect(),
    child: _View(
      pdfUrl: pdfUrl,
      nextStartPage: nextStartPage,
      totalPages: totalPages,
    ),
  );
}

class _View extends StatelessWidget {
  final String pdfUrl;
  final int nextStartPage;
  final int totalPages;

  const _View({
    super.key,
    required this.pdfUrl,
    required this.nextStartPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final hasMorePages = nextStartPage <= totalPages;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discussion after reading'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: BlocBuilder<ChatAfterReadCubit, ChatAfterReadState>(
              builder: (context, state) {
                if (state.isConnecting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null) {
                  return Center(
                    child: Text(
                      'Connection error: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (state.messages.isEmpty) {
                  return const Center(
                    child: Text(
                      'No messages yet.\nBe the first to write!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final msg = state.messages[index];
                    final isMe =
                        msg.senderId == 'user_123'; // replace with real check
                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[700] : Colors.grey[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          msg.content,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Input field + send
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    onSubmitted: (text) {
                      context.read<ChatAfterReadCubit>().sendMessage(text);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // You can add text controller and clear after send
                  },
                ),
              ],
            ),
          ),

          // Big Skip button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: FilledButton.icon(
                icon: const Icon(Icons.skip_next_rounded, size: 28),
                label: Text(
                  hasMorePages
                      ? 'Skip chatting → Next 10 pages'
                      : 'Skip → Finish book',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (hasMorePages) {
                    context.pushReplacement(
                      '/read',
                      extra: {
                        'pdfUrl': pdfUrl,
                        'initialStartPage': nextStartPage,
                      },
                    );
                  } else {
                    // Book finished - go home or show congratulations
                    context.go('/');
                    // or show dialog: "You have completed the book!"
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
