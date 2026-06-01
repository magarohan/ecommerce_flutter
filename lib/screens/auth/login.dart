import 'package:ecommerce/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/bloc/auth/auth_event.dart';
import 'package:ecommerce/bloc/auth/auth_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.userLoggedStatus == AppStatus.success) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        } else if (state.userLoggedStatus == AppStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login Failed. Please try again.')),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Railway',
                          fontSize: 50.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Good to see you again!',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 18.sp,
                          color: const Color(0xFF202020),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      border: InputBorder.none,
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.sp,
                        color: const Color(0xFFB2B2B2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.sp,
                        color: const Color(0xFFB2B2B2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          backgroundColor: const Color(0xFF004CFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        onPressed: state.userLoggedStatus == AppStatus.loading
                            ? null
                            : () {
                                context.read<AuthBloc>().add(
                                  UserLogin(
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                        child: state.userLoggedStatus == AppStatus.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 19.sp,
                                  color: const Color(0xFFF3F3F3),
                                ),
                              ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 16.sp,
                      color: const Color(0xFF202020),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
