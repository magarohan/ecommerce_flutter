import 'dart:convert';

import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductModel? product;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final prefs = await SharedPreferences.getInstance();
    final productString = prefs.getString('selected_product');
    if (productString != null) {
      setState(() {
        product = ProductModel.fromJson(jsonDecode(productString));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(product!.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 439.h,
                  child: Image.network(product!.image, fit: BoxFit.cover),
                ),
                SizedBox(height: 18.h),
                Text(
                  'Rs ${product!.price}',
                  style: TextStyle(
                    fontFamily: 'Railway',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  product!.description,
                  style: TextStyle(fontFamily: 'NunitoSans', fontSize: 15.sp),
                ),
                SizedBox(height: 17.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 128.w,
                      height: 40.h,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF202020),
                          foregroundColor: const Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                    ),
                    SizedBox(
                      width: 128.w,
                      height: 40.h,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF004CFF),
                          foregroundColor: const Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
