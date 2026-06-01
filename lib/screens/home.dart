import 'dart:convert';

import 'package:ecommerce/bloc/products/product_bloc.dart';
import 'package:ecommerce/bloc/products/product_event.dart';
import 'package:ecommerce/bloc/products/product_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/product.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(const ProductsFetched());
  }

  Future<void> _saveProduct(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_product', jsonEncode(product.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.productFetchedStatus == AppStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.productFetchedStatus == AppStatus.failure) {
              return const Center(child: Text('Failed to load products'));
            }

            final products = state.products;
            final electronics = products
                .where((p) => p.category == Category.electronics)
                .toList();
            final jewelery = products
                .where((p) => p.category == Category.jewelery)
                .toList();
            final menClothing = products
                .where((p) => p.category == Category.menClothing)
                .toList();
            final womenClothing = products
                .where((p) => p.category == Category.womenClothing)
                .toList();

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8F8F8),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _sectionTitle('Categories'),
                SizedBox(height: 16.h),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.9,
                  ),
                  children: [
                    if (menClothing.isNotEmpty)
                      CategoryGridWidget(
                        title: "Men's Clothing",
                        products: menClothing,
                      ),
                    if (womenClothing.isNotEmpty)
                      CategoryGridWidget(
                        title: "Women's Clothing",
                        products: womenClothing,
                      ),
                    if (electronics.isNotEmpty)
                      CategoryGridWidget(
                        title: 'Electronics',
                        products: electronics,
                      ),
                    if (jewelery.isNotEmpty)
                      CategoryGridWidget(title: 'Jewelery', products: jewelery),
                  ],
                ),
                SizedBox(height: 24.h),
                _sectionTitle('Top Products'),
                SizedBox(height: 10.h),
                if (products.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: products
                          .take(5)
                          .map(
                            (p) => Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: _circleIcon(p),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                SizedBox(height: 40.h),
                _sectionTitle('New Arrivals'),
                SizedBox(height: 10.h),
                if (products.isNotEmpty)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: products.reversed
                          .take(5)
                          .map(
                            (p) => Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: _itemCard(p),
                            ),
                          )
                          .toList(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
        selectedItemColor: const Color(0xFF004CFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _itemCard(ProductModel product) {
    return InkWell(
      onTap: () async {
        await _saveProduct(product);
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (_) => const ProductPage()),
        );
      },
      child: SizedBox(
        width: 140.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                product.image,
                height: 120.h,
                width: 140.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 2.h),
            Text('Rs ${product.price}', style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(ProductModel product) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 28.w,
        backgroundImage: NetworkImage(product.image),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold),
    );
  }
}

class CategoryGridWidget extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const CategoryGridWidget({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              itemCount: products.length >= 4 ? 4 : products.length,
              itemBuilder: (_, i) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(products[i].image, fit: BoxFit.cover),
                );
              },
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
