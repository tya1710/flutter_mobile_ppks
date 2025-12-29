import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikCPOPage extends StatelessWidget {
  const GrafikCPOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik CPO Internasional'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Harga CPO Dunia (USD/ton)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Jan');
                            case 1:
                              return const Text('Feb');
                            case 2:
                              return const Text('Mar');
                            case 3:
                              return const Text('Apr');
                            case 4:
                              return const Text('Mei');
                            case 5:
                              return const Text('Jun');
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 900),
                        FlSpot(1, 920),
                        FlSpot(2, 950),
                        FlSpot(3, 940),
                        FlSpot(4, 970),
                        FlSpot(5, 990),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      belowBarData: BarAreaData(show: true, color: Colors.greenAccent.withOpacity(0.3)),
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
