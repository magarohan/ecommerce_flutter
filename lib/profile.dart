import 'package:ecommerce/cart.dart';
import 'package:ecommerce/temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage
    extends
        StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<
    ProfilePage
  >
  createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends
        State<
          ProfilePage
        > {
  Widget
  _recentlyViewed() {
    return Container(
      height: 200.h,
      width: 100.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(
              alpha: 0.5,
            ),
            spreadRadius: 2.r,
            blurRadius: 5.r,
            offset: Offset(
              0,
              3.h,
            ),
          ),
        ],
      ),
      child: Image(
        image: NetworkImage(
          'https://i.pinimg.com/736x/b3/0e/c0/b30ec0d84dbc76e453d74554c796d9de.jpg',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget
  _orders(
    String
    type,
  ) {
    return Container(
      height: 35.h,
      width: 86.w,
      decoration: BoxDecoration(
        color: const Color(
          0xFFE5EBFC,
        ),
        borderRadius: BorderRadius.circular(
          18.r,
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            fontFamily: 'Railway',
            fontSize: 16.sp,
            color: const Color(
              0xFF0042E0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const NetworkImage(
                      'https://i.pinimg.com/1200x/76/ba/59/76ba5989c19fd1dcb2efc73368cd91d8.jpg',
                    ),
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 22.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 80.h,
                width: 335.w,
                padding: EdgeInsets.all(
                  8.w,
                ),
                color: const Color(
                  0xFFF8F8F8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Announcements',
                            style: TextStyle(
                              fontFamily: 'Railway',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 14.r,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16.sp,
                        color: const Color(
                          0xFF004BFE,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recently Viewed Items',
                  style: TextStyle(
                    fontFamily: 'Railway',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _recentlyViewed(),
                  _recentlyViewed(),
                  _recentlyViewed(),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Orders',
                  style: TextStyle(
                    fontFamily: 'Railway',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _orders(
                    'To Pay',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  _orders(
                    'To Receive',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  _orders(
                    'To Review',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap:
            (
              index,
            ) {
              if (index ==
                  1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) => const CartPage(),
                  ),
                );
              }
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
}
