import 'package:ecommerce/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage
    extends
        StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<
    LoginPage
  >
  createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends
        State<
          LoginPage
        > {
  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 18.sp,
                        color: const Color(
                          0xFF202020,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 160.h,
              ),
              Container(
                height: 52.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF6F6F6,
                  ),
                  borderRadius: BorderRadius.circular(
                    60.r,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      color: const Color(
                        0xFFB2B2B2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 52.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF6F6F6,
                  ),
                  borderRadius: BorderRadius.circular(
                    60.r,
                  ),
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      color: const Color(
                        0xFFB2B2B2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                    ),
                    backgroundColor: const Color(
                      0xFF004CFF,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            ((
                              context,
                            ) => const HomePage()),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 19.sp,
                      color: const Color(
                        0xFFF3F3F3,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 16.sp,
                  color: const Color(
                    0xFF202020,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
