import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/login_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/screen/add_item.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? selectedCategory;
  List<String> category = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Uploaded Items',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      _authService.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.logout_rounded, color: ColorsConst.kBlack),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: items
                      .where('uploadedBy', isEqualTo: uid)
                      .where('category', isEqualTo: selectedCategory)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorsConst.kPurple,
                        ),
                      );
                    }
                    final document = snapshot.data?.docs ?? [];
                    if (document.isEmpty) {
                      return Center(
                        child: Text(
                          'No items uploaded yet',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: document.length,
                      itemBuilder: (_, index) {
                        final item =
                            document[index].data() as Map<String, dynamic>;
                        return Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 10),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              leading: ClipRect(
                                child: Icon(Icons.image, size: 30),
                              ),
                              title: Text(
                                item['name'] ?? 'N/A',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Column(
                                spacing: 5,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Text(
                                        item['price'] != null
                                            ? '\$${item['price'].toStringAsFixed(2)}'
                                            : 'N/A',
                                        style: TextStyle(
                                          fontSize: 15,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConst.kRed,
                                        ),
                                      ),
                                      Text(item['category'] ?? 'N/A'),
                                      Text(item['category'] ?? 'N/A'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsConst.kPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddItem();
              },
            ),
          );
        },
        child: Icon(Icons.add, color: ColorsConst.kBlack, size: 16),
      ),
    );
  }
}
