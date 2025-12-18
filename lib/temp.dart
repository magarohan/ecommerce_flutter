import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product {
  final String
  image;
  final String
  name;
  final int
  price;

  Product({
    required this.image,
    required this.name,
    required this.price,
  });
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

  final List<
    Product
  >
  hoodies = [
    Product(
      image: 'https://i.pinimg.com/736x/ea/eb/67/eaeb67227e5d6db3e79f62f2b6162bf0.jpg',
      name: 'Hoodie 1',
      price: 2000,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/04/3b/4f/043b4fa5b4de839beb5ff5d6f7119a3c.jpg',
      name: 'Hoodie 2',
      price: 2500,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/44/78/f9/4478f9b1d1added360fc2c95047af4be.jpg',
      name: 'Hoodie 3',
      price: 2000,
    ),
  ];

  final List<
    Product
  >
  shoes = [
    Product(
      image: 'https://images.pexels.com/photos/19090/pexels-photo.jpg',
      name: 'Shoe 1',
      price: 3000,
    ),
    Product(
      image: 'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg',
      name: 'Shoe 2',
      price: 3500,
    ),
    Product(
      image: 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg',
      name: 'Shoe 3',
      price: 3000,
    ),
    Product(
      image: 'https://images.pexels.com/photos/19090/pexels-photo.jpg',
      name: 'Shoe 4',
      price: 3500,
    ),
  ];

  final List<
    Product
  >
  shirts = [
    Product(
      image: 'https://i.pinimg.com/1200x/d4/08/b4/d408b4642bd57481ac5e3e972fb8d8e6.jpg',
      name: 'Shirt 1',
      price: 2000,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/97/f6/1b/97f61b80dc2b0ad8858a681a0d0c4597.jpg',
      name: 'Shirt 2',
      price: 2500,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/77/27/76/772776f5b6209709a2b989d411965487.jpg',
      name: 'Shirt 3',
      price: 2000,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/20/7e/87/207e874313d2822ecb5fbe4123297e47.jpg',
      name: 'Shirt 4',
      price: 2500,
    ),
  ];

  final List<
    Product
  >
  pants = [
    Product(
      image: 'https://i.pinimg.com/1200x/a9/24/1c/a9241cd927deec3e8797426c03f541e3.jpg',
      name: 'Pant 1',
      price: 3000,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/25/9b/f2/259bf2e9bc4d1b85535ee8d947007a65.jpg',
      name: 'Pant 2',
      price: 3500,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/db/a5/2a/dba52a6e2cd2f5832b748214291075ee.jpg',
      name: 'Pant 3',
      price: 3000,
    ),
    Product(
      image: 'https://i.pinimg.com/1200x/ea/88/51/ea885190bf37c9b2152e8141447e46bc.jpg',
      name: 'Pant 4',
      price: 3500,
    ),
  ];

  final List<
    Product
  >
  watches = [
    Product(
      image: 'https://i.pinimg.com/1200x/08/e7/0a/08e70a94d43b007efda8ef04962e4895.jpg',
      name: 'Watch 1',
      price: 5000,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/e8/d6/77/e8d6771805bf84efe55b70a92091119c.jpg',
      name: 'Watch 2',
      price: 6500,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/ae/b3/ff/aeb3ff0194b7b3fd98e59c0f82f9dffe.jpg',
      name: 'Watch 3',
      price: 7000,
    ),
    Product(
      image: 'https://i.pinimg.com/736x/a2/ec/05/a2ec056d4e14add4b5dc248f61c949d0.jpg',
      name: 'Watch 4',
      price: 6000,
    ),
  ];

  final List<
    Product
  >
  bags = [
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Shop',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
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
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
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
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(
                    bags[0],
                  ),
                  _circleIcon(
                    watches[0],
                  ),
                  _circleIcon(
                    shirts[0],
                  ),
                  _circleIcon(
                    pants[0],
                  ),
                  _circleIcon(
                    hoodies[0],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              _sectionTitle(
                'New Items',
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 200.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: shoes
                      .take(
                        3,
                      )
                      .map(
                        _itemWidget,
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (
              i,
            ) => setState(
              () => _currentIndex = i,
            ),
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
    Product
    product,
  ) {
    return CircleAvatar(
      radius: 28.w,
      backgroundImage: NetworkImage(
        product.image,
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

  Widget
  _itemWidget(
    Product
    product,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 140.h,
            width: 140.w,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            product.name,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          Text(
            'Rs ${product.price}',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              children: products
                  .take(
                    4,
                  )
                  .map(
                    (
                      p,
                    ) => Image.network(
                      p.image,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
