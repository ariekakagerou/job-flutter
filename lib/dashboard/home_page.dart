import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  // Daftar gambar banner
  List<String> _banners = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
    'assets/images/banner5.jpg',
  ];

  // Daftar tipe pekerjaan
  final List<Map<String, dynamic>> jobTypes = [
    {'icon': Icons.work, 'label': 'Full-time'},
    {'icon': Icons.timelapse, 'label': 'Part-time'},
    {'icon': Icons.assignment, 'label': 'Freelance'},
    {'icon': Icons.home, 'label': 'Work From Home'},
    {'icon': Icons.school, 'label': 'Magang'},
    {'icon': Icons.assignment_ind, 'label': 'Kontrak'},
    {'icon': Icons.calendar_today, 'label': 'Harian'},
    {'icon': Icons.work, 'label': 'Full-time'},
    {'icon': Icons.timelapse, 'label': 'Part-time'},
    {'icon': Icons.assignment, 'label': 'Freelance'},
    {'icon': Icons.home, 'label': 'Work From Home'},
    {'icon': Icons.school, 'label': 'Magang'},
    {'icon': Icons.assignment_ind, 'label': 'Kontrak'},
    {'icon': Icons.calendar_today, 'label': 'Harian'},
  ];

  // Daftar rekomendasi pekerjaan
  final List<Map<String, dynamic>> jobRecommendations = [
    {
      'title': 'Software Engineer',
      'pemempatan': 'Jakarta',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 8.000.000 - Rp 12.000.000',
      'icon': Icons.computer
    },
    {
      'title': 'Full Stack Developer',
      'pemempatan': 'Bandung',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 7.000.000 - Rp 11.000.000',
      'icon': Icons.code
    },
    {
      'title': 'AI Engineer',
      'pemempatan': 'Surabaya',
      'minimal_pendidikan': 'S2',
      'kisaran_gaji': 'Rp 15.000.000 - Rp 20.000.000',
      'icon': Icons.memory
    },
    {
      'title': 'Mobile Developer',
      'pemempatan': 'Yogyakarta',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 6.000.000 - Rp 10.000.000',
      'icon': Icons.app_blocking
    },
    {
      'title': 'Cybersecurity Specialist',
      'pemempatan': 'Bali',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 10.000.000 - Rp 15.000.000',
      'icon': Icons.security
    },
  ];

  // Daftar pekerjaan di sekitar
  final List<Map<String, dynamic>> nearbyJobs = [
    {
      'title': 'Frontend Developer',
      'pemempatan': 'Semarang',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 7.000.000 - Rp 11.000.000',
      'icon': Icons.laptop
    },
    {
      'title': 'Data Analyst',
      'pemempatan': 'Surabaya',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 8.000.000 - Rp 12.000.000',
      'icon': Icons.insert_chart
    },
    {
      'title': 'Project Manager',
      'pemempatan': 'Jakarta',
      'minimal_pendidikan': 'S2',
      'kisaran_gaji': 'Rp 12.000.000 - Rp 18.000.000',
      'icon': Icons.business
    },
    {
      'title': 'HR Specialist',
      'pemempatan': 'Bali',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 6.000.000 - Rp 9.000.000',
      'icon': Icons.person
    },
    {
      'title': 'UX/UI Designer',
      'pemempatan': 'Bandung',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 7.500.000 - Rp 10.500.000',
      'icon': Icons.design_services
    },
  ];

  // Daftar loker tanpa pengalaman
  final List<Map<String, dynamic>> noExperienceJobs = [
    {
      'title': 'Customer Service',
      'pemempatan': 'Jakarta',
      'minimal_pendidikan': 'SMA',
      'kisaran_gaji': 'Rp 4.000.000 - Rp 6.000.000',
      'icon': Icons.contact_mail
    },
    {
      'title': 'Data Entry',
      'pemempatan': 'Bandung',
      'minimal_pendidikan': 'SMA',
      'kisaran_gaji': 'Rp 3.500.000 - Rp 5.500.000',
      'icon': Icons.input
    },
    {
      'title': 'Sales Assistant',
      'pemempatan': 'Surabaya',
      'minimal_pendidikan': 'SMA',
      'kisaran_gaji': 'Rp 3.000.000 - Rp 5.000.000',
      'icon': Icons.sell
    },
    {
      'title': 'Admin Support',
      'pemempatan': 'Yogyakarta',
      'minimal_pendidikan': 'SMA',
      'kisaran_gaji': 'Rp 4.000.000 - Rp 6.500.000',
      'icon': Icons.admin_panel_settings
    },
    {
      'title': 'Receptionist',
      'pemempatan': 'Bali',
      'minimal_pendidikan': 'SMA',
      'kisaran_gaji': 'Rp 3.500.000 - Rp 5.000.000',
      'icon': Icons.person_pin
    },
  ];

  // Daftar loker dengan gaji menarik
  final List<Map<String, dynamic>> highSalaryJobs = [
    {
      'title': 'Data Scientist',
      'pemempatan': 'Jakarta',
      'minimal_pendidikan': 'S2',
      'kisaran_gaji': 'Rp 18.000.000 - Rp 25.000.000',
      'icon': Icons.scatter_plot
    },
    {
      'title': 'Blockchain Developer',
      'pemempatan': 'Bali',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 15.000.000 - Rp 20.000.000',
      'icon': Icons.block
    },
    {
      'title': 'Cloud Architect',
      'pemempatan': 'Surabaya',
      'minimal_pendidikan': 'S2',
      'kisaran_gaji': 'Rp 20.000.000 - Rp 30.000.000',
      'icon': Icons.cloud
    },
    {
      'title': 'Machine Learning Engineer',
      'pemempatan': 'Bandung',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 18.000.000 - Rp 24.000.000',
      'icon': Icons.language
    },
    {
      'title': 'Cybersecurity Consultant',
      'pemempatan': 'Jakarta',
      'minimal_pendidikan': 'S1',
      'kisaran_gaji': 'Rp 16.000.000 - Rp 22.000.000',
      'icon': Icons.shield
    },
  ];

  @override
  void initState() {
    super.initState();
    _banners = _banners.sublist(_banners.length > 5 ? _banners.length - 5 : 0);
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Cari Loker',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),

              // Banner
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _banners.length,
                  itemBuilder: (context, index) {
                    return _buildBanner(_banners[index]);
                  },
                ),
              ),

              // Tipe Pekerjaan
              const SizedBox(height: 16),
              Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jobTypes.length,
                  itemBuilder: (context, index) {
                    var job = jobTypes[index];
                    return _buildJobType(job['icon'], job['label']);
                  },
                ),
              ),

              // Rekomendasi Pekerjaan
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Rekomendasi Pekerjaan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: jobRecommendations.map((job) {
                    return _buildJobRecommendation(
                      job['title'],
                      job['pemempatan'],
                      job['minimal_pendidikan'],
                      job['kisaran_gaji'],
                      job['icon'],
                    );
                  }).toList(),
                ),
              ),

              // Pekerjaan di Sekitar
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pekerjaan di Sekitar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: nearbyJobs.map((job) {
                    return _buildJobRecommendation(
                      job['title'],
                      job['pemempatan'],
                      job['minimal_pendidikan'],
                      job['kisaran_gaji'],
                      job['icon'],
                    );
                  }).toList(),
                ),
              ),

              // Loker Tanpa Pengalaman
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Loker Tanpa Pengalaman',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: noExperienceJobs.map((job) {
                    return _buildJobRecommendation(
                      job['title'],
                      job['pemempatan'],
                      job['minimal_pendidikan'],
                      job['kisaran_gaji'],
                      job['icon'],
                    );
                  }).toList(),
                ),
              ),

              // Loker dengan Gaji Menarik
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Loker dengan Gaji Menarik',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: highSalaryJobs.map((job) {
                    return _buildJobRecommendation(
                      job['title'],
                      job['pemempatan'],
                      job['minimal_pendidikan'],
                      job['kisaran_gaji'],
                      job['icon'],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk banner
  Widget _buildBanner(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget untuk tipe pekerjaan
  Widget _buildJobType(IconData icon, String label) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(icon, size: 40, color: Colors.blueAccent),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Widget untuk rekomendasi pekerjaan dan pekerjaan di sekitar
  Widget _buildJobRecommendation(String title, String pemempatan,
      String minimalPendidikan, String kisaranGaji, IconData icon) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text('Pemempatan: $pemempatan',
                        style: const TextStyle(fontSize: 14)),
                    Text('Minimal Pendidikan: $minimalPendidikan',
                        style: const TextStyle(fontSize: 14)),
                    Text('Kisaran Gaji: $kisaranGaji',
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
