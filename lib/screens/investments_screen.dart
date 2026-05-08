import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({super.key});

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
            Text('Investments', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            Text('سرمایہ کاری', style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq')),
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
            // Portfolio Card
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Total Portfolio Value', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      Icon(Icons.remove_red_eye, color: Colors.white70, size: 20),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('PKR 630,750', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(Icons.trending_up, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text('+8.5% today   +PKR 37,250', style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Today's Market Graph
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Today's Market", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text("آج کی مارکیٹ", style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq')),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0: return const Text('11AM', style: TextStyle(color: Colors.grey, fontSize: 10));
                                  case 1: return const Text('1PM', style: TextStyle(color: Colors.grey, fontSize: 10));
                                  case 2: return const Text('3PM', style: TextStyle(color: Colors.grey, fontSize: 10));
                                  case 3: return const Text('5PM', style: TextStyle(color: Colors.grey, fontSize: 10));
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 1),
                              FlSpot(1, 1.5),
                              FlSpot(2, 1.4),
                              FlSpot(3, 3.4),
                            ],
                            isCurved: true,
                            color: const Color(0xFF00BFA5),
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: const Color(0xFF00BFA5).withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Market Items
            _buildMarketItem(
              title: 'Gold',
              titleUrdu: 'سونا',
              subtitle: '50g',
              price: 'PKR 15,800/10g',
              change: '+2.1%',
              changeColor: Colors.green,
              totalValue: 'PKR 79,000',
              icon: Icons.monetization_on,
              iconColor: Colors.orange,
            ),
            const SizedBox(height: 16),
            _buildMarketItem(
              title: 'KSE-100 Index',
              titleUrdu: 'کراچی اسٹاک ایکسچینج',
              subtitle: '25 shares',
              price: '42,450',
              change: '-0.8%',
              changeColor: Colors.red,
              totalValue: 'PKR 125,000',
              icon: Icons.show_chart,
              iconColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketItem({
    required String title,
    required String titleUrdu,
    required String subtitle,
    required String price,
    required String change,
    required Color changeColor,
    required String totalValue,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(titleUrdu, style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Jameel Noori Nastaleeq')),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  Icon(changeColor == Colors.green ? Icons.trending_up : Icons.trending_down, color: changeColor, size: 14),
                  const SizedBox(width: 4),
                  Text(change, style: TextStyle(color: changeColor, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Text(totalValue, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
