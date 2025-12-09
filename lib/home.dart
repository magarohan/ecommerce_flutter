import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage
    extends
        StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<
    HomePage
  >
  createState() =>
      _HomePageState();
}

class _HomePageState
    extends
        State<
          HomePage
        > {
  int
  _currentIndex =
      0;

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage: const NetworkImage(
                    'https://i.pinimg.com/736x/25/33/8f/25338f488af2c45912c15ebab325e363.jpg',
                  ),
                  radius: 20.r,
                ),
                Container(
                  width: 115.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                    color: const Color(
                      0xFF004CFF,
                    ),
                  ),
                  child: Text(
                    'My Activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _circleIcon(
                  'assets/icons/vouchers.png',
                ),
                _circleIcon(
                  'assets/icons/menu.png',
                ),
                _circleIcon(
                  'assets/icons/settings.png',
                ),
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello, User!',
                style: TextStyle(
                  color: const Color(
                    0xFF202020,
                  ),
                  fontFamily: 'Raleway',
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              color: const Color(
                0xFFF8F8F8,
              ),
              height: 70.h,
              width: 335.w,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Announcements',
                      style: TextStyle(
                        fontFamily: 'Raileway',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing \n elit. Maecenas hendrerit luctus libero ac vulputate.',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 10.sp,
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          color: Color(
                            0xFF0C54FF,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.sp,
                          color: const Color(
                            0xFFFFFFFF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            _sectionTitle(
              'Recently viewed',
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (
                  index,
                ) => CircleAvatar(
                  backgroundImage: const NetworkImage(
                    'https://i.pinimg.com/736x/25/33/8f/25338f488af2c45912c15ebab325e363.jpg',
                  ),
                  radius: 25.r,
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            _sectionTitle(
              'My Orders',
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _OrderChip(
                  text: 'To Pay',
                ),
                _OrderChip(
                  text: 'To Receive',
                ),
                _OrderChip(
                  text: 'To Review',
                ),
              ],
            ),
            SizedBox(
              height: 28.h,
            ),
            _sectionTitle(
              'Stories',
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 175.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder:
                    (
                      context,
                      index,
                    ) {
                      return Container(
                        height: 175.h,
                        width: 104.w,
                        margin: EdgeInsets.only(
                          right: 8.w,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://i.pinimg.com/736x/25/33/8f/25338f488af2c45912c15ebab325e363.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(
          0xFF004CFF,
        ),
        unselectedItemColor: Colors.grey,
        onTap:
            (
              index,
            ) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Wishlist',
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
  _circleIcon(
    String
    asset,
  ) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          0xFFF8F8F8,
        ),
      ),
      child: Image.asset(
        asset,
      ),
    );
  }

  Widget
  _sectionTitle(
    String
    text,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _OrderChip
    extends
        StatelessWidget {
  final String
  text;

  const _OrderChip({
    required this.text,
  });

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Container(
      margin: EdgeInsets.only(
        right: 8.w,
      ),
      decoration: BoxDecoration(
        color: const Color(
          0xFFE5EBFC,
        ),
        borderRadius: BorderRadius.circular(
          35.r,
        ),
      ),
      height: 35.h,
      width: 86.w,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 16.sp,
          color: const Color(
            0xFF0042E0,
          ),
        ),
      ),
    );
  }
}
