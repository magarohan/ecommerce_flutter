import 'package:ecommerce/home.dart';
import 'package:ecommerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage
    extends
        StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<
    CartPage
  >
  createState() =>
      _CartPageState();
}

class _CartPageState
    extends
        State<
          CartPage
        > {
  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F9F9,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            20.w,
          ),
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
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(
                  12.w,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFFFFFFF,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
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
                    SizedBox(
                      height: 8.h,
                    ),
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
                            color: const Color(
                              0xFF004BFE,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _cartProduct(
                'https://i.pinimg.com/1200x/08/e7/0a/08e70a94d43b007efda8ef04962e4895.jpg',
                'Watch 1',
                'Rs 1500',
              ),
              SizedBox(
                height: 16.h,
              ),
              _cartProduct(
                'https://i.pinimg.com/736x/e8/d6/77/e8d6771805bf84efe55b70a92091119c.jpg',
                'Watch 2',
                'Rs 2500',
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: RS 4000',
                    style: TextStyle(
                      fontFamily: 'Railway',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                        0xFF000000,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 128.w,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF004BFE,
                        ),
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 16.sp,
                          color: const Color(
                            0xFFF3F3F3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap:
            (
              index,
            ) {
              if (index ==
                  0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) => const HomePage(),
                  ),
                );
              }
              if (index ==
                  2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) => const ProfilePage(),
                  ),
                );
              }
            },
        selectedItemColor: const Color(
          0xFF004CFF,
        ),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget
  _cartProduct(
    String
    image,
    String
    name,
    String
    price,
  ) {
    return Container(
      padding: EdgeInsets.all(
        12.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xFFFFFFFF,
        ),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            child: Image.network(
              image,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                price,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(
                    0xFF202020,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
