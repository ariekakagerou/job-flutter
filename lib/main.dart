import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/register_page.dart';
import 'screens/login_page.dart';
import 'screens/job_seeker_dashboard.dart';

void main() => runApp(const JobComApp());

class JobComApp extends StatelessWidget {
  const JobComApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobCom',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => const JobSeekerDashboard(),
      },
    );
  }
}
