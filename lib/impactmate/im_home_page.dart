import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:maxmovement/impactmate/im_login.dart';
import 'package:maxmovement/impactmate/new_project.dart';
import 'package:maxmovement/impactmate/new_report.dart';
import 'package:maxmovement/impactmate/profile_page.dart';
import 'package:maxmovement/impactmate/projects.dart';
import 'package:maxmovement/impactmate/report_page.dart';
import 'package:maxmovement/impactmate/statistic.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

class Sector {
  final double value;
  final Color color;

  Sector({required this.value, required this.color});
}

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> chartData;

  BarChartWidget({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatisticPage()), // Ganti StatisticPage dengan halaman yang sesuai
        );
      },
      child: AspectRatio(
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
}


class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: PieChart(PieChartData(
        sections: _chartSections(),
        centerSpaceRadius: 40.0,
      )),
    );
  }

  List<PieChartSectionData> _chartSections() {
    return [
      PieChartSectionData(
        color: const Color(0xFFCAD32C),
        value: 70,
        title: '70%',
      ),
      PieChartSectionData(
        color: const Color(0xFF86A524),
        value: 20,
        title: '20%',
      ),
    ];
  }
}

class IMHomePage extends StatefulWidget {
  const IMHomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<IMHomePage> {
  int _selectedIndex = 0;

  final List<PricePoint> points = [
    PricePoint(x: 0, y: 5),
    PricePoint(x: 2, y: 10),
    PricePoint(x: 4, y: 3),
    PricePoint(x: 6, y: 7),
    PricePoint(x: 8, y: 9),
    PricePoint(x: 10, y: 6),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IMLoginPage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MaxMovement',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                            child: BarChartWidget(chartData: _chartGroups()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Your Projects',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  height: 180,
                                  child: PieChartWidget(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Finance',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  'Funding',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 13),
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [Color(0xFF88A525), Color(0xFFCAD32C)],
                                    stops: [0.0, 1.0], // Menggunakan stops dari 0.0 hingga 1.0
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ).createShader(bounds),
                                  child: Text(
                                    '53%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: Colors.white, // Teks akan diberi gradient, jadi warna aslinya bisa diabaikan
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13),
                                Text(
                                  'You have used 53% of the funding.',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '\$1754',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF82881F),
                                  ),
                                ),
                                Text(
                                  'left to maximize your impact!',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Project',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildRecentProjectCard(
                            title: 'Materials translation quality',
                            subtitle: 'SDG Focus',
                            image: AssetImage('assets/sdg1.png'),
                            amountUsed: '4500',
                            startingDate: '22/02/2024',
                            endDate: '22/06/2024',
                          ),
                        ], 
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Impact File Template',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          _buildImpactFileTemplateCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            items: [
              _bottomNavigationBarItem(Icons.home_outlined, 'Home', 0),
              _bottomNavigationBarItem(Icons.library_books_outlined, 'Projects', 1),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    _showPopupMenu(context);
                  },
                  child: Transform.translate(
                    offset: Offset(0, -30),
                    child: Icon(Icons.control_point_outlined, size: 70),
                  ),
                ),
                label: '',
              ),
              _bottomNavigationBarItem(Icons.line_axis, 'Reports', 3),
              _bottomNavigationBarItem(Icons.perm_identity, 'Profile', 4),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF273526),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose what you want to create',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF517D5A),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewProject()),
                        );
                      },
                      child: Container(
                        width: 500,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Row(
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'New Project',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF517D5A),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(  
                          context,
                            MaterialPageRoute(builder: (context) => NewReport()),
                        );
                      },
                    child: Container(
                      width: 500,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.report, color: Colors.white),
                        SizedBox(width: 10),
                          Text(
                            'Report Impact',
                              style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points.where((point) => point.y > 0).map((point) {
    return BarChartGroupData(
      x: point.x.toInt(),
        barRods: [
          BarChartRodData(
      toY: point.y,
        color: Color(0xFF46605A),
          )
        ],
      );
    }).toList();
  }

  Widget _buildRecentProjectCard({
    required String title,
    required String subtitle,
    required ImageProvider<Object> image,
    required String amountUsed,
    required String startingDate,
    required String endDate,
    double avatarRadius = 30.0,
  }) {
  return Card(
    elevation: 2,
      child: ListTile(
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: avatarRadius * 2,
                  height: avatarRadius * 2,
                  decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10), // Adjust border radius here
                  image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subtitle),
                    SizedBox(height: 4),
                  Text(
                    '$amountUsed are used in this project',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                    SizedBox(height: 4),
                  Text('Starting Date: $startingDate'),
                  Text('Ends by: $endDate (Ending in 43 days)'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildImpactFileTemplateCard() {
  return Card(
    elevation: 2,
    child: ListTile(
      leading: Icon(Icons.insert_drive_file, size: 50,),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To ensure that you fulfill the data we need, please follow the template below.',
            style: TextStyle(color: Color(0xFF286924)),
          ),
          SizedBox(height: 8), // Tambahkan jarak antara teks dan baris berikutnya
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Download Here',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.download),
            ],
          ),
        ],
      ),
    ),
  );
}
}

void main() {
runApp(MaterialApp(
home: IMHomePage(),
));
}
                         

