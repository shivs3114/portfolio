import 'dart:ui';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:PortfolioPage()
    );
  }
}



class PortfolioPage extends StatelessWidget {
  final String profileImage = 'assets/images/shivs.jpg';
  final String name = 'Shivangi Singh';
  final String description = 'Flutter Developer | Mobile App Enthusiast';
  final String email = 'shivangi31012004@gmail.com';
  final String linkedInUrl = 'https://www.linkedin.com/in/shivangi2021/';
  final String githubUrl = 'https://github.com/shivs3114';

  Future<void> _launchEmail(String toemail) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toemail,
      query: 'subject=Contact from Portfolio App&body=Hello Shivangi,',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email client';
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB388FF), Color(0xFF8C9EFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Glassmorphic body
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _glassCard(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(profileImage),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center
                          ,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GlowContainer(
                              containerOptions: ContainerOptions(borderRadius: 20),
                              gradientColors: [
                                Colors.orange.withOpacity(0.5),
                                Colors.orange.withOpacity(0.3),
                              ],
                              child: ElevatedButton.icon(
                                onPressed: () => _launchEmail(email) ,
                                // creates a function to be called later, GOOD
                              
                                icon: const Icon(Icons.email),
                                label: const Text('Contact Me'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 237, 121, 234),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                ),
                            ),
                              SizedBox(width: 20),
                              GlowContainer(
                                  containerOptions: ContainerOptions(borderRadius: 20),
                              gradientColors: [
                                Colors.orange.withOpacity(0.5),
                                Colors.orange.withOpacity(0.3),
                              ],
                                child: ElevatedButton.icon(
                                   style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 237, 121, 234),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                  onPressed:(){_launchURL('https://drive.google.com/file/d/1xPZ5S7gWsP7KJnmpK5aAJEgPDa55cF5C/view?usp=sharing');}, label:Text('Download CV'), icon: const Icon(Icons.download)),
                              ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  _glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Skills',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                       Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    _sectionTitle('Languages'),
    const SizedBox(height: 10),
    Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Python')),
        Chip(label: Text('C++')),
        Chip(label: Text('C')),
        Chip(label: Text('Dart')),
        Chip(label: Text('JavaScript')),
        Chip(label: Text('Java')),
      ],
    ),
    const SizedBox(height: 20),

    _sectionTitle('Databases'),
    const SizedBox(height: 10),
    Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Firebase')),
        Chip(label: Text('Cloud Firestore')),
        Chip(label: Text('MongoDB')),
        Chip(label: Text('MySQL')),
      ],
    ),
    const SizedBox(height: 20),

    _sectionTitle('Frameworks & State Management'),
    const SizedBox(height: 10),
    Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Flutter')),
        Chip(label: Text('Provider')),
        Chip(label: Text('GetX')),
        Chip(label: Text('REST APIs')),
      ],
    ),
    const SizedBox(height: 20),

    _sectionTitle('Programming Paradigms'),
    const SizedBox(height: 10),
    Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Object-Oriented Programming')),
        Chip(label: Text('Functional Programming')),
      ],
    ),
    const SizedBox(height: 20),

    _sectionTitle('Tools'),
    const SizedBox(height: 10),
    Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Git & GitHub')),
        Chip(label: Text('Postman')),
      ],
    ),
  ],
)
                      ])
                        ),
                      
                    
                  
                  const SizedBox(height: 30),
                  _glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle('Projects'),
                        _projectTile('Portfolio App', 'Beautiful personal portfolio made in Flutter.'),
                        _projectTile('Weather App', 'Real-time weather updates using APIs.'),
                        _projectTile('Todo App', 'Offline task management app with Hive DB.'),
                      ],
                    ),
                  ),
               
                  
                  const SizedBox(height: 50),
                  const SizedBox(height: 30),
                  _glassCard(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _sectionTitle('Experience'),
      const SizedBox(height: 20),
      Wrap(
        spacing: 20, // horizontal space between cards
        runSpacing: 20, // vertical space between cards if needed
        children: [
          SizedBox(
            width: 180,
            child: GlowContainer(
              containerOptions: ContainerOptions(borderRadius: 16),
              gradientColors: [
                Colors.purple.withOpacity(0.5),
                Colors.purple.withOpacity(0.3),
              ],
              child: FlipCard(
                speed: 300,
                direction: FlipDirection.HORIZONTAL,
                front: _experienceFrontCard(
                  company: 'Neonex Steam',
                  position: 'Junior Flutter Developer',
                  duration: 'April 2025 - Present',
                ),
                back: _experienceBackCard(
                  description: '• Developing robust Flutter apps for Android .\n'
                      '• Ensuring app performance, responsiveness, and cross-platform compatibility.',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: GlowContainer(
              glowRadius: 5,
              containerOptions: ContainerOptions(borderRadius: 16,),
              gradientColors: [
                Colors.purple.withOpacity(0.5),
                Colors.purple.withOpacity(0.3),
              ],
              child: FlipCard(
                speed: 300,
                direction: FlipDirection.HORIZONTAL,
                front: _experienceFrontCard(
                  company: 'Apna Software',
                  position: 'Flutter Developer Intern',
                  duration: 'Oct 2024 - March 2025',
                ),
                back: _experienceBackCard(
                  description: '• Collaborated with the team to build, test, and deploy scalable Flutter apps for Android & Windows.\n'
                      '• Implemented responsive UI designs across various devices.',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 180,
            child: GlowContainer(
              containerOptions: ContainerOptions(borderRadius: 16),
              gradientColors: [
                Colors.purple.withOpacity(0.5),
                Colors.purple.withOpacity(0.3),
              ],
              child: FlipCard(
                speed: 300,
                direction: FlipDirection.HORIZONTAL,
                front: _experienceFrontCard(
                  company: 'Banaras Locomotive Works',
                  position: 'Summer Intern',
                  duration: 'June,July 2024',
                ),
                back: _experienceBackCard(
                  description: '• Gained hands-on experience in industrial software practices.\n'
                      '• Worked on practical application development and optimization techniques.',
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),
SizedBox(height: 30,)
,
_glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _sectionTitle('Connect with Me'),
                        const SizedBox(height: 10),
                        Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    TextButton.icon(
      onPressed: () => _launchURL(linkedInUrl),
      icon: Image.asset(
        'assets/icons/linkedin.png', // your LinkedIn logo here
        height: 24,
        width: 24,
       // remove this line if you want original colors
      ),
      label: const Text('LinkedIn'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // replaces "primary" in latest Flutter
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
    const SizedBox(width: 20),
    TextButton.icon(
      onPressed: () => _launchURL(githubUrl),
      icon: Image.asset(
        'assets/icons/github.png', // your GitHub logo here
        height: 24,
        width: 24,
         // remove if you want black GitHub logo
      ),
      label: const Text('GitHub'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
  ],
),

                      ],
                    ),
                  ),




                
                ],
            ),
          
            )
      ),]
    ));
  }

  // Glassmorphism Card
  Widget _glassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        const Icon(Icons.arrow_forward, color: Colors.indigo),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _projectTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _experienceFrontCard({required String company, required String position, required String duration}) {
  return Container(
    height: Get.height * 0.3,
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          company,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          ),
        ),
        const SizedBox(height: 10),
        Text(
          position,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          duration,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 20),
        Text('Click to flip for details',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    ),
  );
}

Widget _experienceBackCard({required String description}) {
  return Container(
    width: double.infinity,
    height: Get.height * 0.3,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      description,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white.withOpacity(0.9),
      ),
    ),
  );
}

}

