import 'package:ecommerce/bloc/users/user_bloc.dart';
import 'package:ecommerce/bloc/users/user_event.dart';
import 'package:ecommerce/bloc/users/user_state.dart';
import 'package:ecommerce/core/constants/enums.dart';
import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.userAddedStatus == AppStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Created Successfully! Please login.'),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else if (state.userAddedStatus == AppStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup Failed. Please try again.')),
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
                  child: Text(
                    'Create\n Account',
                    style: TextStyle(
                      fontFamily: 'Railway',
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      border: InputBorder.none,
                      hintText: 'Email',
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
                BlocBuilder<UserBloc, UserState>(
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
                        onPressed: state.userAddedStatus == AppStatus.loading
                            ? null
                            : () {
                                context.read<UserBloc>().add(
                                  UserAdded(
                                    model: UserModel(
                                      username: _usernameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                              },
                        child: state.userAddedStatus == AppStatus.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Done",
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
