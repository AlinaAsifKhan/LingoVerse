import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

// ---------------- MAIN ----------------
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const LingoVerseApp(),
    ),
  );
}

// ---------------- APP ----------------
class LingoVerseApp extends StatelessWidget {
  const LingoVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'LingoVerse',
      theme: ThemeData(
        primaryColor: const Color(0xFFAACEE1),
        scaffoldBackgroundColor: const Color(0xFFAACEE1),
        fontFamily: 'Poppins',
      ),
      home: const GetStartedScreen(),
    );
  }
}

// ---------------- GET STARTED ----------------
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LingoVerse',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E0B4E),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Learn languages, your way',
              style: TextStyle(color: Color(0xFF534545)),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF0E0B4E),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Color(0xFF0E0B4E)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Color(0xFF0E0B4E)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- LOGIN SCREEN ----------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 28, color: Color(0xFF0E0B4E)),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF0E0B4E),
              ),
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message ?? 'Login failed')),
                  );
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- SIGNUP SCREEN ----------------
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 28, color: Color(0xFF0E0B4E)),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF0E0B4E),
              ),
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (!isValidEmail(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter a valid email!')),
                  );
                  return;
                }

                try {
                      UserCredential userCredential =
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  await userCredential.user!.updateDisplayName(
                    nameController.text.trim(),
                  );


                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message ?? 'Signup failed')),
                  );
                }
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- HOME ----------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFlag = '🇯🇵';
  final List<String> flags = ['🇯🇵', '🇰🇷', '🇵🇰', '🇬🇧', '🇮🇹'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserProfileScreen(
                          selectedFlag: selectedFlag,
                        ),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            )
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'LingoVerse',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E0B4E)),
                ),
                DropdownButton<String>(
                  value: selectedFlag,
                  underline: const SizedBox(),
                  items: flags
                      .map((flag) => DropdownMenuItem(
                          value: flag,
                          child: Text(flag,
                              style: const TextStyle(fontSize: 24))))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFlag = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Learn languages, your way',
                style: TextStyle(color: Color(0xFF534545))),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  FeatureCard(title: 'Learn', icon: Icons.menu_book),
                  FeatureCard(title: 'Quiz', icon: Icons.quiz),
                  FeatureCard(title: 'Progress', icon: Icons.show_chart),
                  FeatureCard(title: 'Community', icon: Icons.groups),
                ],
            ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- FEATURE CARD ----------------
class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color(0xFF0E0B4E)),
          const SizedBox(height: 12),
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ---------------- USER PROFILE ----------------
class UserProfileScreen extends StatelessWidget {
  final String selectedFlag;

  const UserProfileScreen({super.key, required this.selectedFlag});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'No email';
    final name = user?.displayName ?? 'User';


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0E0B4E)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Icon
            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFAACEE1),
              child: Icon(Icons.person, size: 48, color: Color(0xFF0E0B4E)),
            ),

            const SizedBox(height: 16),

            // Hi Name
            Text(
              'Hi, $name 👋',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E0B4E),
              ),
            ),

            const SizedBox(height: 6),

            // Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF534545),
              ),
            ),

            const SizedBox(height: 32),

            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _profileRow(
                    icon: Icons.language,
                    title: 'Language',
                    value: selectedFlag,
                  ),
                  const Divider(height: 32),
                  _profileRow(
                    icon: Icons.settings,
                    title: 'Settings',
                    value: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF0E0B4E)),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (value.isNotEmpty)
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
      ],
    );
  }
}
