import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:maxmovement/impactmate/im_login.dart'; // Ganti dengan import yang sesuai

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistic Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildChartTypeDropdown(),
            SizedBox(height: 20),
            _buildBarChartWidget(),
            SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChartTypeDropdown() {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem(child: Text('Bar Chart'), value: ChartType.bar),
        // Tambahkan jenis grafik lain di sini sesuai kebutuhan
      ],
      onChanged: (ChartType? value) {
        // Tambahkan logika untuk memilih jenis grafik
      },
      decoration: InputDecoration(
        labelText: 'Choose chart type',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildBarChartWidget() {
    // Dummy data untuk grafik, ganti dengan data yang sesuai
    final List<BarChartGroupData> chartData = [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(y: 5)]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(y: 10)]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(y: 3)]),
      BarChartGroupData(x: 3, barRods: [BarChartRodData(y: 7)]),
      BarChartGroupData(x: 4, barRods: [BarChartRodData(y: 9)]),
      BarChartGroupData(x: 5, barRods: [BarChartRodData(y: 6)]),
    ];

    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: chartData,
          borderData: FlBorderData(
            border: const Border(bottom: BorderSide(), left: BorderSide()),
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true, // Tampilkan angka kiri
                getTitlesWidget: (value, meta) {
                  // Sesuaikan dengan data yang ingin ditampilkan
                  return Text('${value.toInt()}');
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Hilangkan angka kanan
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Hilangkan angka atas
          ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          const monthNames = {
            0: 'Jan',
            1: 'Feb',
            2: 'Mar',
            3: 'Apr',
            4: 'May',
            5: 'Jun',
            6: 'Jul',
            7: 'Aug',
            8: 'Sep',
            9: 'Oct',
            10: 'Nov',
            11: 'Dec'
          };
          final text = monthNames[value.toInt()] ?? '';
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(text, style: TextStyle(color: Colors.black)),
          );
        },
      );

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Tambahkan logika untuk mengunduh file
          },
          icon: Icon(Icons.download),
          label: Text('Download File'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Tambahkan logika untuk berbagi
          },
          icon: Icon(Icons.share),
          label: Text('Share'),
        ),
      ],
    );
  }
}

enum ChartType {
  bar,
  // Tambahkan jenis grafik lain di sini sesuai kebutuhan
}

void main() {
  runApp(MaterialApp(
    home: StatisticPage(),
  ));
}
