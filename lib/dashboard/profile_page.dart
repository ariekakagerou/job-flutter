import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'John Doe';
  String email = 'johndoe@example.com';
  String phone = '08123456789';
  String profilePhoto = 'assets/profile_photo.png';

  List<String> portfolioLinks = ['https://github.com/johndoe', 'https://johndoe.com'];
  List<String> skills = ['Flutter Development', 'UI/UX Design', 'Database Management'];
  List<String> certifications = ['Sertifikat Flutter Developer', 'Sertifikat UI/UX Design'];
  List<String> experiences = [
    'Developer di Perusahaan A (2020 - 2022)',
    'Designer di Perusahaan B (2018 - 2020)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto Profil
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _changeProfilePhoto,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(profilePhoto),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => _editField('Nama', name, (value) {
                          setState(() => name = value);
                        }),
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _editField('Email', email, (value) {
                          setState(() => email = value);
                        }),
                        child: Text(
                          email,
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _editField('Telepon', phone, (value) {
                          setState(() => phone = value);
                        }),
                        child: Text(
                          phone,
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Biodata Diri
                _sectionTitle('Upload CV'),
                ElevatedButton.icon(
                  onPressed: () {
                    // Tambahkan logika untuk upload CV.
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload CV'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _sectionTitle('Portofolio'),
                ...portfolioLinks
                    .map((link) => _listItem(link, onDelete: () {
                          setState(() => portfolioLinks.remove(link));
                        }))
                    ,
                _addButton('Tambah Portofolio', () {
                  _editField('Portofolio Baru', '', (value) {
                    setState(() => portfolioLinks.add(value));
                  });
                }),
                const SizedBox(height: 16),
                _sectionTitle('Skill yang Dikuasai'),
                ...skills
                    .map((skill) => _listItem(skill, onDelete: () {
                          setState(() => skills.remove(skill));
                        }))
                    ,
                _addButton('Tambah Skill', () {
                  _editField('Skill Baru', '', (value) {
                    setState(() => skills.add(value));
                  });
                }),
                const SizedBox(height: 16),
                _sectionTitle('Sertifikasi'),
                ...certifications
                    .map((cert) => _listItem(cert, onDelete: () {
                          setState(() => certifications.remove(cert));
                        }))
                    ,
                _addButton('Tambah Sertifikasi', () {
                  _editField('Sertifikasi Baru', '', (value) {
                    setState(() => certifications.add(value));
                  });
                }),
                const SizedBox(height: 16),
                _sectionTitle('Pengalaman Kerja'),
                ...experiences
                    .map((exp) => _listItem(exp, onDelete: () {
                          setState(() => experiences.remove(exp));
                        }))
                    ,
                _addButton('Tambah Pengalaman', () {
                  _editField('Pengalaman Baru', '', (value) {
                    setState(() => experiences.add(value));
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk judul tiap bagian
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Widget untuk item dalam daftar
  Widget _listItem(String text, {required VoidCallback onDelete}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(text),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }

  // Tombol tambah data
  Widget _addButton(String label, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Fungsi untuk mengganti foto profil
  void _changeProfilePhoto() {
    // Implementasikan logika untuk mengunggah atau memilih foto profil.
  }

  // Fungsi untuk mengedit data
  void _editField(String title, String initialValue, Function(String) onSave) {
    final controller = TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
