import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bloc/cart/cart_event.dart';
import 'package:ecommerce/bloc/cart/cart_state.dart';
import 'package:ecommerce/bloc/products/product_bloc.dart';
import 'package:ecommerce/bloc/products/product_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartFetchedById(id: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            if (cartState.cartFetchedStatus == AppStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (cartState.cartFetchedStatus == AppStatus.failure) {
              return const Center(child: Text('Failed to load cart'));
            }

            return BlocBuilder<ProductBloc, ProductState>(
              builder: (context, productState) {
                final cart = cartState.cartModel;
                if (cart == null || cart.products.isEmpty) {
                  return const Center(child: Text('Your cart is empty'));
                }

                double total = 0;
                final cartItems = cart.products.map((cp) {
                  final product = productState.products.firstWhere(
                    (p) => p.id == cp.productId,
                    orElse: () => ProductModel(
                      id: cp.productId,
                      title: 'Unknown Product',
                      price: 0,
                      description: '',
                      category: Category.electronics,
                      image: '',
                    ),
                  );
                  total += product.price * cp.quantity;
                  return _cartProduct(
                    product.image,
                    product.title,
                    'Rs ${product.price}',
                    cp.quantity,
                  );
                }).toList();

                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cart',
                        style: TextStyle(
                          fontFamily: 'Railway',
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                fontFamily: 'Railway',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 14.r,
                                  child: Icon(
                                    Icons.edit,
                                    size: 16.sp,
                                    color: const Color(0xFF004BFE),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ...cartItems,
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total: RS ${total.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontFamily: 'Railway',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            width: 128.w,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF004BFE),
                              ),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 16.sp,
                                  color: const Color(0xFFF3F3F3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
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

  Widget _cartProduct(String image, String name, String price, int quantity) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 80.h,
                    width: 80.w,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image),
                  ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF202020),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Quantity: $quantity',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
