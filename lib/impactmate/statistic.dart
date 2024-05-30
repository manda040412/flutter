import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MaterialApp(home: StatisticPage()));

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  String _selectedChartType = 'Choose Chart Types'; // Set default value to 'Choose Chart Types'
  String _selectedDataFormat = 'Select Format'; // Default value for data format dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistic Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF46605A),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedChartType,
                        items: <String>[
                          'Choose Chart Types',
                          'Bar Chart',
                          'Line Chart',
                          'Pie Chart'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        dropdownColor: Color(0xFF46605A),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedChartType = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          'Statistics - \$ USD',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          'Income to Expenditure',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 300,
                          child: _buildChart(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _showDownloadDialog(context);
                        },
                        icon: Icon(Icons.download, color: Colors.white),
                        label: Text(
                          'Download File',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF46605A),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showShareDialog(context);
                        },
                        icon: Icon(Icons.share, color: Colors.white),
                        label: Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF46605A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add more widgets here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    switch (_selectedChartType) {
      case 'Bar Chart':
        return BarChartWidget(chartData: _convertToBarChartGroupData(points));
      // Implementasi untuk jenis grafik lainnya bisa ditambahkan di sini
      // case 'Line Chart':
      //   return LineChartWidget(chartData: points); // contoh
      // case 'Pie Chart':
      //   return PieChartWidget(chartData: points); // contoh
      default:
        return Center(child: Text('Please select a chart type')); // Placeholder
    }
  }

  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose the data format!'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return DropdownButton<String>(
                value: _selectedDataFormat,
                items: <String>['Select Format', 'PDF', 'CSV', 'XLS']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDataFormat = newValue!;
                  });
                },
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Implementasi confirm & download
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Confirm & Download',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF46605A),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Title of the file.jpeg'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Who can access?', style: TextStyle(fontSize: 18),),
              SizedBox(height: 8),
              _buildAccessBox('Jake (You) \njakee02@gmail.com'),
              SizedBox(height: 8),
              _buildAccessBox('Add people'),
              SizedBox(height: 8),
              Text('Copy Link',),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAccessBox(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> chartData;

  const BarChartWidget({Key? key, required this.chartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: chartData,
        borderData: FlBorderData(
          show: false, // Menghilangkan garis tepi
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: _bottomTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: _leftTitles,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Menghilangkan label di atas
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Menghilangkan label di sebelah kanan
          ),
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipPadding: EdgeInsets.all(8),
            getTooltipItem: _getTooltipItem,
          ),
        ),
      ),
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
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
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5.0,
      child: Text(monthNames[value.toInt()] ?? ''),
    );
  }

  Widget _leftTitles(double value, TitleMeta meta) {
    return Text(value.toInt().toString());
  }

  BarTooltipItem _getTooltipItem(BarChartGroupData group, int groupIndex,
      BarChartRodData rod, int rodIndex) {
    return BarTooltipItem(
      '${group.x.toInt()}\n',
      TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      children: <TextSpan>[
        TextSpan(
          text: (rod.toY - 1).toString(),
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

List<BarChartGroupData> _convertToBarChartGroupData(List<PricePoint> points) {
  return points.map((point) {
    return BarChartGroupData(
      x: point.x.toInt(),
      barRods: [
        BarChartRodData(
          toY: point.y,
          color: Color(0xFF46605A), // Warna batang
        ),
      ],
    );
  }).toList();
}

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

// Data yang Anda berikan
final List<PricePoint> points = [
  PricePoint(x: 0, y: 5),
  PricePoint(x: 2, y: 10),
  PricePoint(x: 4, y: 3),
  PricePoint(x: 6, y: 7),
  PricePoint(x: 8, y: 9),
  PricePoint(x: 10, y: 6),
];
