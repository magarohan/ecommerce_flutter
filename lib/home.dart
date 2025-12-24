import 'dart:convert';
import 'package:ecommerce/cart.dart';
import 'package:ecommerce/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final String
  image;
  final String
  name;
  final int
  price;
  final String?
  description;

  const Product({
    required this.image,
    required this.name,
    required this.price,
    this.description,
  });

  Map<
    String,
    dynamic
  >
  toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'description': description,
    };
  }
}

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

  Future<
    void
  >
  _saveProduct(
    Product
    product,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();
    await prefs.setString(
      'selected_product',
      jsonEncode(
        product.toJson(),
      ),
    );
  }

  final List<
    Product
  >
  hoodies = const [
    Product(
      image: 'https://i.pinimg.com/736x/ea/eb/67/eaeb67227e5d6db3e79f62f2b6162bf0.jpg',
      name: 'Hoodie 1',
      price: 2000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/04/3b/4f/043b4fa5b4de839beb5ff5d6f7119a3c.jpg',
      name: 'Hoodie 2',
      price: 2500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/44/78/f9/4478f9b1d1added360fc2c95047af4be.jpg',
      name: 'Hoodie 3',
      price: 2000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/44/78/f9/4478f9b1d1added360fc2c95047af4be.jpg',
      name: 'Hoodie 4',
      price: 2200,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  final List<
    Product
  >
  shoes = const [
    Product(
      image: 'https://images.pexels.com/photos/19090/pexels-photo.jpg',
      name: 'Shoe 1',
      price: 3000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg',
      name: 'Shoe 2',
      price: 3500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg',
      name: 'Shoe 3',
      price: 3000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://images.pexels.com/photos/19090/pexels-photo.jpg',
      name: 'Shoe 4',
      price: 3500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  final List<
    Product
  >
  shirts = const [
    Product(
      image: 'https://i.pinimg.com/1200x/d4/08/b4/d408b4642bd57481ac5e3e972fb8d8e6.jpg',
      name: 'Shirt 1',
      price: 2000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/97/f6/1b/97f61b80dc2b0ad8858a681a0d0c4597.jpg',
      name: 'Shirt 2',
      price: 2500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/77/27/76/772776f5b6209709a2b989d411965487.jpg',
      name: 'Shirt 3',
      price: 2000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/20/7e/87/207e874313d2822ecb5fbe4123297e47.jpg',
      name: 'Shirt 4',
      price: 2500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  final List<
    Product
  >
  pants = const [
    Product(
      image: 'https://i.pinimg.com/1200x/a9/24/1c/a9241cd927deec3e8797426c03f541e3.jpg',
      name: 'Pant 1',
      price: 3000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/25/9b/f2/259bf2e9bc4d1b85535ee8d947007a65.jpg',
      name: 'Pant 2',
      price: 3500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/db/a5/2a/dba52a6e2cd2f5832b748214291075ee.jpg',
      name: 'Pant 3',
      price: 3000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/ea/88/51/ea885190bf37c9b2152e8141447e46bc.jpg',
      name: 'Pant 4',
      price: 3500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  final List<
    Product
  >
  watches = const [
    Product(
      image: 'https://i.pinimg.com/1200x/08/e7/0a/08e70a94d43b007efda8ef04962e4895.jpg',
      name: 'Watch 1',
      price: 5000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/e8/d6/77/e8d6771805bf84efe55b70a92091119c.jpg',
      name: 'Watch 2',
      price: 6500,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/ae/b3/ff/aeb3ff0194b7b3fd98e59c0f82f9dffe.jpg',
      name: 'Watch 3',
      price: 7000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    Product(
      image: 'https://i.pinimg.com/736x/a2/ec/05/a2ec056d4e14add4b5dc248f61c949d0.jpg',
      name: 'Watch 4',
      price: 6000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
  ];

  final List<
    Product
  >
  bags = const [
    Product(
      image: 'https://i.pinimg.com/736x/0e/6a/24/0e6a24a0524c589f60c758c851ebdcd7.jpg',
      name: 'Bag 1',
      price: 4000,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/8e/cf/15/8ecf15ebc1a4329334b033e8cea40217.jpg',
      name: 'Bag 2',
      price: 5500,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/c3/67/8f/c3678fc8e2353f67156a64dac290e37d.jpg',
      name: 'Bag 3',
      price: 6000,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/fe/f0/5e/fef05effedef8cb23e7348736d3fd74a.jpg',
      name: 'Bag 4',
      price: 4500,
    ),
  ];

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          children: [
            SizedBox(
              height: 12.h,
            ),
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
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.r,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(
                        0xFFF8F8F8,
                      ),
                    ),
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
                CategoryGridWidget(
                  title: 'Hoodies',
                  products: hoodies,
                ),
                CategoryGridWidget(
                  title: 'Shoes',
                  products: shoes,
                ),
                CategoryGridWidget(
                  title: 'Shirts',
                  products: shirts,
                ),
                CategoryGridWidget(
                  title: 'Pants',
                  products: pants,
                ),
                CategoryGridWidget(
                  title: 'Bags',
                  products: bags,
                ),
                CategoryGridWidget(
                  title: 'Watches',
                  products: watches,
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            _sectionTitle(
              'Top Products',
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _circleIcon(
                    hoodies[0],
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  _circleIcon(
                    shoes[1],
                  ),
                  _circleIcon(
                    watches[2],
                  ),
                  _circleIcon(
                    bags[3],
                  ),
                  _circleIcon(
                    pants[3],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            _sectionTitle(
              'New Arrivals',
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _itemCard(
                    hoodies[0],
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  _itemCard(
                    shoes[1],
                  ),
                  _itemCard(
                    shirts[2],
                  ),
                  _itemCard(
                    pants[3],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
                        ) => CartPage(),
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
  _itemCard(
    Product
    product,
  ) {
    return InkWell(
      onTap: () async {
        await _saveProduct(
          product,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (
                  _,
                ) => const ProductPage(),
          ),
        );
      },
      child: SizedBox(
        width: 140.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.r,
              ),
              child: Image.network(
                product.image,
                height: 120.h,
                width: 140.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              product.description ??
                  '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Rs ${product.price}',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget
  _circleIcon(
    Product
    product,
  ) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
              0.2,
            ),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(
              0,
              3,
            ),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 28.w,
        backgroundImage: NetworkImage(
          product.image,
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
        fontSize: 21.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CategoryGridWidget
    extends
        StatelessWidget {
  final String
  title;
  final List<
    Product
  >
  products;

  const CategoryGridWidget({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
              0.2,
            ),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(
              0,
              3,
            ),
          ),
        ],
        color: Colors.white,
      ),
      padding: EdgeInsets.all(
        8.w,
      ),
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
              itemCount:
                  products.length >=
                      4
                  ? 4
                  : products.length,
              itemBuilder:
                  (
                    _,
                    i,
                  ) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                      child: Image.network(
                        products[i].image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
