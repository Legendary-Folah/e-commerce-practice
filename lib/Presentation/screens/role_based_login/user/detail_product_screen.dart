import 'package:e_commerce_app/models/app_model.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.appModel});
  final AppModel appModel;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Product', style: TextStyle(letterSpacing: 2)),
      ),
    );
  }
}
