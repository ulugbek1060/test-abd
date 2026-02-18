import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: 15,
        separatorBuilder: (_, __) => const Divider(
          color: Color(0xFF1E1E1E),
          height: 1,
        ),
        itemBuilder: (context, index) {
          return NotificationItem(
            name: "User ${index + 1}",
            message: "answered your question correctly 🎉",
            coins: (index + 1) * 5,
            time: "${index + 1}h ago",
          );
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String name;
  final String message;
  final int coins;
  final String time;

  const NotificationItem({
    super.key,
    required this.name,
    required this.message,
    required this.coins,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      /// Name + Message
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "$name ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: message,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

      /// Time
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ),

      /// Coin Badge
      trailing: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.monetization_on,
              color: Colors.amber,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              "+$coins",
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
