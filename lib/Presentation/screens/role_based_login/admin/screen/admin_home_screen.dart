import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Presentation/screens/login_screen/login_screen.dart';
import 'package:e_commerce_app/Presentation/screens/role_based_login/admin/screen/add_item.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeScreen extends ConsumerStatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  ConsumerState<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends ConsumerState<AdminHomeScreen> {
  final AuthService _authService = AuthService();
  final CollectionReference items = FirebaseFirestore.instance.collection(
    'items',
  );
  final CollectionReference categoriesCollection = FirebaseFirestore.instance
      .collection('category');
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? selectedCategory;
  List<String> category = [];

  @override
  void initState() {
    fetchCategories();
    super.initState();
  }

  Future<void> fetchCategories() async {
    final snapshot = await categoriesCollection.get();
    final categories = snapshot.docs
        .map((doc) => doc['name'] as String)
        .toList();
    setState(() {
      category = categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Uploaded Items',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.receipt_long_sharp),
                      ),
                      Positioned(
                        top: 5,
                        right: 8,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: ColorsConst.kRed,
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                color: ColorsConst.kWhite,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DropdownButton(
                    value: selectedCategory,
                    hint: Icon(Icons.list_alt_outlined),
                    items: category.map((String categoryy) {
                      return DropdownMenuItem(
                        value: categoryy,
                        child: Text(categoryy),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
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
                  stream: (selectedCategory == null)
                      ? _authService.getItemStream(uid)
                      : items
                            .where('uid', isEqualTo: uid)
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
                          child: Column(
                            spacing: 10,
                            children: [
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(10),
                                child: ListTile(
                                  leading: ClipRect(
                                    child: Icon(Icons.image, size: 40),
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
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsConst.kRed,
                                            ),
                                          ),
                                          Text(
                                            item['category'] ?? 'N/A',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: ColorsConst.kGrey),
                            ],
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
        child: Icon(Icons.add, color: ColorsConst.kWhite, size: 17),
      ),
    );
  }
}
