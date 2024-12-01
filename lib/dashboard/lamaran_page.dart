import 'package:flutter/material.dart';

class LamaranPage extends StatelessWidget {
  const LamaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lamaran Saya'),
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daftar Lamaran', icon: Icon(Icons.list_alt)),
              Tab(text: 'Hasil Seleksi', icon: Icon(Icons.check_circle)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Konten untuk tab Daftar Lamaran
            DaftarLamaranTab(),
            // Konten untuk tab Hasil Seleksi
            HasilSeleksiTab(),
          ],
        ),
      ),
    );
  }
}

class DaftarLamaranTab extends StatelessWidget {
  const DaftarLamaranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.lightGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Daftar Lamaran',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          _buildLamaranTile(
              'Lamaran 1', 'Status: Direview', Icons.pending, Colors.orange),
          _buildLamaranTile(
              'Lamaran 2', 'Status: Terseleksi', Icons.check_circle, Colors.green),
          _buildLamaranTile(
              'Lamaran 3', 'Status: Diundang Wawancara', Icons.mail, Colors.blue),
          _buildLamaranTile('Lamaran 4', 'Status: Wawancara Terjadwal',
              Icons.schedule, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildLamaranTile(
      String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
        onTap: () {
          // Logika ketika item diklik
        },
      ),
    );
  }
}

class HasilSeleksiTab extends StatelessWidget {
  const HasilSeleksiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightGreen, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Hasil Seleksi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          _buildHasilSeleksiTile(
              'Lamaran 1', 'Hasil: Diterima', Colors.greenAccent),
          _buildHasilSeleksiTile(
              'Lamaran 2', 'Hasil: Direkrut', Colors.green),
          _buildHasilSeleksiTile(
              'Lamaran 3', 'Hasil: Ditolak', Colors.redAccent),
        ],
      ),
    );
  }

  Widget _buildHasilSeleksiTile(String title, String subtitle, Color color) {
    return Card(
      color: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.black87),
        ),
        leading: Icon(Icons.check_circle, color: color),
        trailing: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
        onTap: () {
          // Logika ketika item diklik
        },
      ),
    );
  }
}
