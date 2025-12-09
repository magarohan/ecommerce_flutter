import 'package:ecommerce/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage
    extends
        StatefulWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  State<
    OnboardingPage
  >
  createState() =>
      _OnboardingPageState();
}

class _OnboardingPageState
    extends
        State<
          OnboardingPage
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
                height: 150.h,
              ),
              Image.asset(
                'assets/images/logo.png',
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Shopee',
                style: TextStyle(
                  fontFamily: 'Railway',
                  fontSize: 52.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(
                    0xFF202020,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'A shopping platform for everyone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18.sp,
                  color: const Color(
                    0xFF202020,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
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
                            ) => SignupPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Let's get started",
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
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 16.sp,
                      color: const Color(
                        0xFF202020,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xFF004CFF,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
