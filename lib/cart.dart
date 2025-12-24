import 'package:ecommerce/home.dart';
import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'Railway',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(
                  12,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFFFFFFF,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontFamily: 'Railway',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Text(
                            '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 10,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 14,
                          child: Icon(
                            Icons.edit,
                            size: 16,
                            color: Color(
                              0xFF004BFE,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _cartProduct(
                'https://i.pinimg.com/1200x/08/e7/0a/08e70a94d43b007efda8ef04962e4895.jpg',
                'Watch 1',
                'Rs 1500',
              ),
              const SizedBox(
                height: 16,
              ),
              _cartProduct(
                'https://i.pinimg.com/736x/e8/d6/77/e8d6771805bf84efe55b70a92091119c.jpg',
                'Watch 2',
                'Rs 2500',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: RS 4000',
                    style: TextStyle(
                      fontFamily: 'Railway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xFF000000,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        2,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF004BFE,
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 16,
                          color: Color(
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
                        ) => HomePage(),
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
      padding: const EdgeInsets.all(
        12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xFFFFFFFF,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8,
            ),
            child: Image.network(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(
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
