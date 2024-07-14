import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user = 'admin';
  final TextEditingController _userController = TextEditingController();

  void update() async {
    setState(() {
      user = _userController.text;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  void loadinit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('user') ?? 'admin';
    });
  }

  @override
  void initState() {
    super.initState();
    loadinit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Log In',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                  child: Icon(
                    Icons.person,
                    size: 32,
                  ),
                ),
                label: Text('UserName'),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 15, 8),
                  child: Icon(
                    Icons.password,
                    size: 32,
                  ),
                ),
                label: Text('PassWord'),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        username: _userController.text,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
