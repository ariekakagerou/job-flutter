import 'package:flutter/material.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi CV & Portfolio'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  Icon(Icons.computer, size: 80, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Rekomendasi CV & Portfolio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Inspirasi CV & Portfolio untuk dunia komputer dan teknologi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Content section
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    'Rekomendasi CV',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCvRecommendationTile(
                    context,
                    'CV untuk Pengembang Perangkat Lunak',
                    'Tampilkan keterampilan coding, pengalaman proyek, dan sertifikasi.',
                    Icons.code,
                    Colors.blue,
                  ),
                  _buildCvRecommendationTile(
                    context,
                    'CV untuk Administrator Jaringan',
                    'Fokus pada pengalaman mengelola jaringan dan keamanan data.',
                    Icons.network_wifi,
                    Colors.cyan,
                  ),
                  _buildCvRecommendationTile(
                    context,
                    'CV untuk Data Analyst',
                    'Soroti kemampuan analisis data, alat statistik, dan hasil riset.',
                    Icons.bar_chart,
                    Colors.green,
                  ),
                  _buildCvRecommendationTile(
                    context,
                    'CV untuk Desainer UI/UX',
                    'Tampilkan proyek desain antarmuka yang responsif dan kreatif.',
                    Icons.design_services,
                    Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Rekomendasi Portfolio',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildPortfolioTile(
                    context,
                    'Portfolio untuk Pengembang Web',
                    'Cocok untuk menampilkan proyek berbasis web dengan desain responsif.',
                    Icons.web,
                    Colors.orange,
                  ),
                  _buildPortfolioTile(
                    context,
                    'Portfolio untuk Desain Grafis Digital',
                    'Tampilkan karya kreatif dalam bentuk desain visual.',
                    Icons.brush,
                    Colors.redAccent,
                  ),
                  _buildPortfolioTile(
                    context,
                    'Portfolio untuk Pengembangan Aplikasi Mobile',
                    'Cocok untuk menunjukkan aplikasi yang Anda buat untuk Android/iOS.',
                    Icons.phone_android,
                    Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk rekomendasi CV
  Widget _buildCvRecommendationTile(BuildContext context, String title,
      String subtitle, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
        onTap: () {
          // Logika ketika item CV diklik
        },
      ),
    );
  }

  // Widget untuk rekomendasi Portfolio
  Widget _buildPortfolioTile(BuildContext context, String title,
      String subtitle, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
        onTap: () {
          // Logika ketika item Portfolio diklik
        },
      ),
    );
  }
}
