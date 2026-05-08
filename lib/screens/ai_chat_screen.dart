import 'package:flutter/material.dart';

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF00BFA5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.smart_toy, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('AI Assistant', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    const Text('Online • اسسٹنٹ AI', style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'Jameel Noori Nastaleeq')),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.language, color: Colors.grey, size: 20),
              Switch(
                value: false,
                onChanged: (val) {},
                activeColor: const Color(0xFF00BFA5),
              ),
              const Text('اردو', style: TextStyle(color: Colors.black, fontFamily: 'Jameel Noori Nastaleeq')),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildAiMessage(
                  context,
                  "Hello! I'm your AI financial assistant. How can I help you today?",
                  "ہیلو! میں آپ کا مالیاتی اسسٹنٹ ہوں۔ آج میں آپ کی کیا مدد کر سکتا ہوں؟",
                  "10:30 AM",
                ),
                _buildUserMessage("Can I afford a new phone?", "10:32 AM"),
                _buildAiMessage(
                  context,
                  "Based on your current spending pattern, yes, but only if you skip extra shopping for 2 months. Your phone budget would be PKR 45,000.",
                  "آپ کے موجودہ خرچ کے انداز کے مطابق، ہاں، لیکن صرف اگر آپ 2 مہینے اضافی خریداری چھوڑ دیں۔ آپ کا فون بجٹ 45,000 روپے ہوگا۔",
                  "10:32 AM",
                ),
                _buildUserMessage("What's my biggest expense this month?", "10:35 AM"),
                _buildAiMessage(
                  context,
                  "Your biggest expense this month is Food at PKR 18,500 (35% of total spending). Consider meal planning to reduce costs.",
                  "اس مہینے آپ کا سب سے بڑا خرچ کھانا ہے جو 18,500 روپے (کل خرچ کا 35%) ہے۔ اخراجات کم کرنے کے لیے کھانے کی منصوبہ بندی پر غور کریں۔",
                  "10:35 AM",
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Quick Questions:', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildQuickQuestion("Track my budget"),
                      const SizedBox(width: 8),
                      _buildQuickQuestion("Analyze expenses"),
                      const SizedBox(width: 8),
                      _buildQuickQuestion("Set a goal"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type your message...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF00BFA5),
                      radius: 24,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiMessage(BuildContext context, String textEn, String textUr, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFF00BFA5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.smart_toy, color: Colors.white, size: 14),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textEn, style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B))),
                      const SizedBox(height: 8),
                      Text(textUr, style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Jameel Noori Nastaleeq'), textDirection: TextDirection.rtl),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 48), // Padding on right
        ],
      ),
    );
  }

  Widget _buildUserMessage(String text, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 48), // Padding on left
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00BFA5), Color(0xFF2196F3)],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.white)),
                ),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 12,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickQuestion(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12, color: Color(0xFF1E293B))),
    );
  }
}
