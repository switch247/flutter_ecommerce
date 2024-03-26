import 'package:flutter/material.dart';
import 'package:t_store/widgets/appbar.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Reviews and Rattings'),
      ),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
