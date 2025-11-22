import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1)),
        backgroundColor: const Color(0xFF161B22),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey.shade600),
                const SizedBox(width: 10),
                Text('Search messages...', style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildModernMessageBubble(
                  'Sarah Johnson',
                  'Hey! Are you free for a meeting tomorrow?',
                  '10:30 AM',
                  Colors.teal.shade400,
                  true,
                ),
                _buildModernMessageBubble(
                  'Team Flutter',
                  'New update available for the project',
                  '9:15 AM',
                  Colors.blue.shade400,
                  false,
                ),
                _buildModernMessageBubble(
                  'Alex Smith',
                  'Thanks for your help yesterday!',
                  'Yesterday',
                  Colors.purple.shade400,
                  true,
                ),
                _buildModernMessageBubble(
                  'Project Manager',
                  'Please submit your weekly report',
                  'Yesterday',
                  Colors.orange.shade400,
                  false,
                ),
                _buildModernMessageBubble(
                  'Emily Davis',
                  'Can you review my code changes?',
                  '2 days ago',
                  Colors.pink.shade400,
                  true,
                ),
              ],
            ),
          ),
          // Floating Back Button
          Container(
            margin: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade600, Colors.teal.shade400],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'BACK',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernMessageBubble(
    String name,
    String message,
    String time,
    Color accentColor,
    bool isUnread,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isUnread ? accentColor.withOpacity(0.5) : Colors.grey.shade800,
          width: isUnread ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar with gradient
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: accentColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
