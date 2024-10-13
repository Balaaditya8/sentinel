import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityPressureGraph extends StatelessWidget {
  final List<ActivityPressureData> data;

  ActivityPressureGraph({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heart Rate vs Cervical Pressure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 500,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 20,
                    verticalInterval: 10,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey[300]!,
                      strokeWidth: 1,
                    ),
                    getDrawingVerticalLine: (value) => FlLine(
                      color: Colors.grey[300]!,
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false, reservedSize: 22, getTitlesWidget: (value, _) {
                        return Text(value.toInt().toString());
                      }),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false, reservedSize: 22, getTitlesWidget: (value, _) {
                        return Text(value.toInt().toString());
                      }),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false, reservedSize: 22, getTitlesWidget: (value, _) {
                        return Text(value.toInt().toString());
                      }),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false, reservedSize: 28, getTitlesWidget: (value, _) {
                        return Text(value.toInt().toString());
                      }),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 100,
                  minY: 40,
                  maxY: 150, // Adjust based on your heart rate scale
                  lineBarsData: [
                    LineChartBarData(
                      spots: data.asMap().entries.map((entry) {
                        return FlSpot(entry.value.pressure, entry.value.activityLevel);
                      }).toList(),
                      isCurved: true,
                      color: Colors.transparent,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                          radius: 4,
                          color: Colors.blueAccent,
                          strokeWidth: 0,
                        ),
                      ),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.black.withOpacity(0.8),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((touchedSpot) {
                          return LineTooltipItem(
                            'Pressure: ${touchedSpot.x}, Heart Rate: ${touchedSpot.y}',
                            TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {},
                    handleBuiltInTouches:
                    true, // This allows the tooltip to be shown
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityPressureData {
  final double pressure;
  final double activityLevel; // Heart rate

  ActivityPressureData({required this.pressure, required this.activityLevel});
}
