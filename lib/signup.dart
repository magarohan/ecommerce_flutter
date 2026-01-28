import 'package:ecommerce/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage
    extends
        StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<
    SignupPage
  >
  createState() =>
      _SignupPageState();
}

class _SignupPageState
    extends
        State<
          SignupPage
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
                height: 79.h,
              ),
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
                            (
                              context,
                            ) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Done",
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
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 16.sp,
                    color: const Color(
                      0xFF202020,
                    ),
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
