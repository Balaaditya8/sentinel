import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/patient.dart';
import 'package:intl/intl.dart';
import '../widgets/pressure_gauge.dart';
import '../widgets/cervix_health_score.dart';
import '../widgets/pregnancy_progress_bar.dart';
import '../widgets/activity_pressure_graph.dart';
class PatientDetailPage extends StatelessWidget {
  final Patient patient;
  final bool isPatientView;

  const PatientDetailPage({Key? key, required this.patient, this.isPatientView = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ActivityPressureData> sampleData = [
      ActivityPressureData(pressure: 7, activityLevel: 70),
      ActivityPressureData(pressure: 20, activityLevel: 77),
      ActivityPressureData(pressure: 30, activityLevel: 83),
      ActivityPressureData(pressure: 40, activityLevel: 120),
      ActivityPressureData(pressure: 42, activityLevel: 99),
      ActivityPressureData(pressure: 70, activityLevel: 135),
      ActivityPressureData(pressure: 73, activityLevel: 78),
      ActivityPressureData(pressure: 55, activityLevel: 110)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(isPatientView ? 'My Details' : patient.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isPatientView) _buildCervixHealthScore(),
            _buildInfoCard(),
            _buildPregnancyProgressBar(),
            _buildMonitoringCard(),
            _buildPressureGauge(),
            if (!isPatientView) ActivityPressureGraph(data: sampleData),
            if (!isPatientView) _buildCervicalLengthChart(),
            if (!isPatientView) _buildDoctorNotes(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildInfoRow('Age', '${patient.age} years'),
            _buildInfoRow('Gestational Age', '${patient.gestationalAge} weeks'),
            _buildInfoRow('Cerclage Date', '${_formatDate(patient.cerclageDate)}'),
            _buildInfoRow('Cerclage Type', patient.cerclageType),
            _buildInfoRow('Due Date', '${_formatDate(patient.dueDate)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildMonitoringCard() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Real-time Monitoring', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildMonitoringItem('Cervical Length', '3.2 cm', Icons.straighten),
            _buildMonitoringItem('Cervical Pressure', 'Normal', Icons.speed),
            _buildMonitoringItem('Contractions', '0 / hour', Icons.favorite),
          ],
        ),
      ),
    );
  }

  Widget _buildCervicalLengthChart() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cervical Length Trend', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 3.2),
                        FlSpot(2, 3.1),
                        FlSpot(3, 3.3),
                        FlSpot(4, 3.2),
                        FlSpot(5, 3.4),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildMonitoringItem(String label, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Widget _buildPressureGauge() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cervical Pressure', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PressureGauge(
                pressure: patient.cervicalPressure,
                isPatientView: isPatientView,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCervixHealthScore() {
    double healthScore = 40.0; // Example score
    return CervixHealthScore(score: healthScore);
  }
  Widget _buildPregnancyProgressBar() {
    return PregnancyProgressBar(
      gestationalAge: patient.gestationalAge,
      dueDate: patient.dueDate,
    );
  }

  Widget _buildDoctorNotes() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Doctor Notes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Add notes here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text('Save Notes'),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}