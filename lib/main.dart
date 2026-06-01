import 'package:ecommerce/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bloc/products/product_bloc.dart';
import 'package:ecommerce/bloc/users/user_bloc.dart';
import 'package:ecommerce/data/repositories/auth_repository.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => ProductRepository()),
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(create: (context) => CartRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => ProductBloc(context.read<ProductRepository>()),
          ),
          BlocProvider(
            create: (context) => UserBloc(context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => CartBloc(context.read<CartRepository>()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Shopee',
              theme: ThemeData(
                primaryColor: const Color(0xFF004CFF),
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'NunitoSans',
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
