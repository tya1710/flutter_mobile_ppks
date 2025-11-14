import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrafikTBSPage extends StatelessWidget {
  const GrafikTBSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Harga TBS'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Harga TBS per Bulan (Rp/Kg)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
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
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1800, color: Colors.green)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 1900, color: Colors.green)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 1850, color: Colors.green)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 1950, color: Colors.green)]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 2000, color: Colors.green)]),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 2100, color: Colors.green)]),
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
