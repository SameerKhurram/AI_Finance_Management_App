import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Goal Planner', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            Text('اہداف کی منصوبہ بندی', style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq')),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF00BFA5),
              radius: 16,
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 16),
                padding: EdgeInsets.zero,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Active Goals Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00BFA5), Color(0xFF2196F3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.track_changes, color: Colors.white70, size: 24),
                      SizedBox(width: 8),
                      Text('3 Active Goals', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Total Target: PKR 1,700,000', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Total Saved', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text('PKR 1,120,000', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Overall Progress', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text('66%', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // AI Suggestion Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2196F3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.smart_toy, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "If you save PKR 20,000/month, you'll reach your car goal in 12 months.",
                          style: TextStyle(color: Color(0xFF1E88E5), fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "اگر آپ 20,000 روپے ماہانہ بچائیں تو 12 مہینوں میں اپنے گاڑی کے ہدف تک پہنچ جائیں گے۔",
                          style: TextStyle(color: Color(0xFF1E88E5), fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Goal Items
            _buildGoalItem(
              title: 'Buy a Car',
              titleUrdu: 'گاڑی خریدنا',
              icon: Icons.directions_car,
              iconColor: Colors.redAccent,
              targetAmount: 'PKR 1,000,000',
              savedAmount: 'PKR 650,000 saved',
              remainingAmount: 'PKR 350,000 remaining',
              timeLeft: '5 months left',
              progress: 0.65,
              monthlyContribution: 'PKR 20,000/month',
            ),
            const SizedBox(height: 24),
            _buildGoalItem(
              title: 'Emergency Fund',
              titleUrdu: 'ایمرجنسی فنڈ',
              icon: Icons.shield,
              iconColor: Colors.blueAccent,
              targetAmount: 'PKR 500,000',
              savedAmount: 'PKR 320,000 saved',
              remainingAmount: 'PKR 180,000 remaining',
              timeLeft: '12 months left',
              progress: 0.64,
              monthlyContribution: 'PKR 10,000/month',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalItem({
    required String title,
    required String titleUrdu,
    required IconData icon,
    required Color iconColor,
    required String targetAmount,
    required String savedAmount,
    required String remainingAmount,
    required String timeLeft,
    required double progress,
    required String monthlyContribution,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(titleUrdu, style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq')),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(targetAmount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(timeLeft, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(savedAmount, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text('${(progress * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(iconColor == Colors.redAccent ? const Color(0xFF1E293B) : const Color(0xFF1E293B)),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(remainingAmount, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(monthlyContribution, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Adjust Goal', style: TextStyle(fontSize: 12, color: Colors.black)),
              )
            ],
          )
        ],
      ),
    );
  }
}
