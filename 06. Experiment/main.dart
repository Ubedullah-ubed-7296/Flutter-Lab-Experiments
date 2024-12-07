import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        cardTheme: CardTheme(
          elevation: 4.0,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Personal Portfolio"),
        centerTitle: true,
      ),
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section
            ProfileSection(),

            // Personal Information section
            PersonalDetailsSection(),

            // Resume-like sections: Education, Experience, Skills, Hobbies
            ResumeSection(
              title: "Education",
              content: "B.tech in computer science engineering, Sphoorthy Engineering College",
            ),
            ResumeSection(
              title: "Work Experience",
              content: "Software Engineer at Amazon",
            ),
            SkillsSection(),
            HobbiesSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/man.png', // Replace with your photo asset
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ubedullah", style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 4),
                Text("Software Engineer", style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Personal Details", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Text("Location: Hyderabad, Telangana", style: Theme.of(context).textTheme.bodyMedium),
            Text("Email: ubedullah192@gmail.com", style: Theme.of(context).textTheme.bodyMedium),
            Text("Phone: +91 7396650596", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class ResumeSection extends StatelessWidget {
  final String title;
  final String content;

  ResumeSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Text(content, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Skills", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Text("• Flutter Developer", style: Theme.of(context).textTheme.bodyMedium),
            Text("• Web Developer", style: Theme.of(context).textTheme.bodyMedium),
            Text("• Problem Solving", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class HobbiesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hobbies", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Text("• Traveling", style: Theme.of(context).textTheme.bodyMedium),
            Text("• Listening to Music", style: Theme.of(context).textTheme.bodyMedium),
            Text("• Playing Games", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}    
