import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/login_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/screen/admin_home_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/user/user_app_first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AuthStateHandler(),
    );
  }
}

// AuthStateHandler to manage authentication state which will keep users logged in until they log out and navigate accordingly
class AuthStateHandler extends StatefulWidget {
  const AuthStateHandler({super.key});

  @override
  State<AuthStateHandler> createState() => _AuthStateHandlerState();
}

class _AuthStateHandlerState extends State<AuthStateHandler> {
  User? currentUser;
  String? userRole;
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    initializeState();
    super.initState();
  }

  void initializeState() {
    auth.authStateChanges().listen((user) async {
      if (!mounted) return;
      setState(() {
        currentUser = user;
      });
      if (user != null) {
        final userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();
        if (!mounted) return;
        if (userDoc.exists) {
          setState(() {
            userRole = userDoc['role'];
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return LoginScreen();
    }
    if (userRole == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return userRole == 'Admin' ? AdminHomeScreen() : UserAppFirstScreen();
  }
}
