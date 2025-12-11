import 'package:flutter/foundation.dart';
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

  List<
    String
  >
  hoodies = [
    'https://i.pinimg.com/736x/ea/eb/67/eaeb67227e5d6db3e79f62f2b6162bf0.jpg',
    'https://i.pinimg.com/736x/ea/eb/67/eaeb67227e5d6db3e79f62f2b6162bf0.jpg',
    'https://i.pinimg.com/736x/04/3b/4f/043b4fa5b4de839beb5ff5d6f7119a3c.jpg',
    'https://i.pinimg.com/736x/44/78/f9/4478f9b1d1added360fc2c95047af4be.jpg',
  ];

  List<
    String
  >
  shoes = [
    'https://images.pexels.com/photos/19090/pexels-photo.jpg',
    'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg',
    'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg',
    'https://images.pexels.com/photos/19090/pexels-photo.jpg',
  ];

  List<
    String
  >
  shirts = [
    'https://i.pinimg.com/1200x/d4/08/b4/d408b4642bd57481ac5e3e972fb8d8e6.jpg',
    'https://i.pinimg.com/1200x/97/f6/1b/97f61b80dc2b0ad8858a681a0d0c4597.jpg',
    'https://i.pinimg.com/1200x/77/27/76/772776f5b6209709a2b989d411965487.jpg',
    'https://i.pinimg.com/1200x/20/7e/87/207e874313d2822ecb5fbe4123297e47.jpg',
  ];

  List<
    String
  >
  pants = [
    'https://i.pinimg.com/1200x/a9/24/1c/a9241cd927deec3e8797426c03f541e3.jpg',
    'https://i.pinimg.com/736x/25/9b/f2/259bf2e9bc4d1b85535ee8d947007a65.jpg',
    'https://i.pinimg.com/1200x/db/a5/2a/dba52a6e2cd2f5832b748214291075ee.jpg',
    'https://i.pinimg.com/1200x/ea/88/51/ea885190bf37c9b2152e8141447e46bc.jpg',
  ];

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 36.h,
                      width: 240.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFF8F8F8,
                        ),
                        borderRadius: BorderRadius.circular(
                          18.r,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 16.sp,
                              color: const Color(
                                0xFFC7C7C7,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 20.sp,
                            color: const Color(
                              0xFF0042E0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                _sectionTitle(
                  'Categories',
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 335.w,
                  height: 636.h,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _gridCategory(
                        'Hoodies',
                        hoodies,
                      ),
                      _gridCategory(
                        'Shoes',
                        shoes,
                      ),
                      _gridCategory(
                        'Shirts',
                        shirts,
                      ),
                      _gridCategory(
                        'Pants',
                        pants,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 24.h,
                ),
                _sectionTitle(
                  'Top Products',
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(
                      "https://i.pinimg.com/736x/0e/6a/24/0e6a24a0524c589f60c758c851ebdcd7.jpg",
                    ),
                    _circleIcon(
                      "https://i.pinimg.com/1200x/08/e7/0a/08e70a94d43b007efda8ef04962e4895.jpg",
                    ),
                    _circleIcon(
                      "https://i.pinimg.com/1200x/a5/22/90/a52290bfc7b6ed20e7da47719ae362a3.jpg",
                    ),
                    _circleIcon(
                      "https://i.pinimg.com/1200x/a1/7d/9a/a17d9a900eea4d103ca31d2a3d25483c.jpg",
                    ),
                    _circleIcon(
                      "https://i.pinimg.com/1200x/d4/08/b4/d408b4642bd57481ac5e3e972fb8d8e6.jpg",
                    ),
                  ],
                ),
              ],
            ),
          ),
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
    link,
  ) {
    return Container(
      height: 55.w,
      width: 55.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          0xFFF8F8F8,
        ),
      ),
      padding: EdgeInsets.all(
        8.w,
      ),
      child: ClipOval(
        child: Image.network(
          link,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget
  _sectionTitle(
    String
    text,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 21.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget
  _gridCategory(
    String
    title,
    List<
      String
    >
    images,
  ) {
    return SizedBox(
      width: 165.w,
      height: 192.h,
      child: Column(
        children: [
          SizedBox(
            height: 150.h,
            child: GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              children: List.generate(
                4,
                (
                  index,
                ) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.r,
                    ),
                  ),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
