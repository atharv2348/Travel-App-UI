import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/custom_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/raw_data.dart';
import 'package:travel_app/screens/review_page.dart';
import 'package:travel_app/screens/search_page.dart';
import 'package:travel_app/utils/custom_animations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning,';
    } else if (hour < 18) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                getGreetingMessage(),
                style: const TextStyle(
                    color: CustomColors.primary1,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.75),
              ).fadeInSlideUp(),
              SizedBox(height: 4.h),
              Text(
                "Harry Tran",
                style: TextStyle(
                    fontSize: 16.sp,
                    letterSpacing: -0.4,
                    color: CustomColors.neutral1),
              ).fadeInSlideUp(delay: const Duration(milliseconds: 400)),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Container(
                    width: 44.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset('assets/images/person.png'),
                  ).scaleBounceAniation(delay: const Duration(milliseconds: 700)),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harry Tan",
                        style: TextStyle(
                            color: CustomColors.neutral1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.4),
                      ),
                      Text(
                        "Premium User",
                        style: TextStyle(
                            color: CustomColors.neutral5,
                            fontSize: 12.sp,
                            letterSpacing: -0.3),
                      ),
                    ],
                  ).fadeInSlideUp(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        )),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: const BoxDecoration(
                        color: CustomColors.primary1,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        height: 16.h,
                        width: 16.w,
                        'assets/icons/search_icon.svg',
                      ),
                    ),
                  ).scaleBounceAniation(
                      delay: const Duration(milliseconds: 400)),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: CustomColors.neutral7,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: CustomColors.neutral1,
                    ),
                  ).scaleBounceAniation(
                      delay: const Duration(milliseconds: 800)),
                ],
              ),
              SizedBox(height: 30.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 152.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: CustomColors.neutral3,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "From",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: CustomColors.neutral5,
                                    letterSpacing: -0.3),
                              ),
                              Text(
                                "ChiangMai",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: CustomColors.neutral10,
                                    letterSpacing: -0.4),
                              ),
                              Text(
                                "15:23:05",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: CustomColors.neutral5,
                                    letterSpacing: -0.3),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 25.h),
                            SvgPicture.asset('assets/icons/airplane.svg',
                                width: 24.w),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "To",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: CustomColors.neutral5,
                                    letterSpacing: -0.3),
                              ),
                              Text(
                                "London",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: CustomColors.neutral10,
                                    letterSpacing: -0.4),
                              ),
                              Text(
                                "23:53:",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: CustomColors.neutral5,
                                    letterSpacing: -0.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).scaleBounceAniation(),
                  Positioned(
                    bottom: -45.h, // <-- this is the key!
                    left: 20.w,
                    right: 20.w,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF05C5A2), Color(0xFF06AE90)]),
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 20,
                                color: const Color(0xFF049C65).withOpacity(0.5),
                              )
                            ]),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "London",
                                  style: TextStyle(
                                      color: CustomColors.neutral10,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.75),
                                ),
                                Text(
                                  "UK",
                                  style: TextStyle(
                                      color: CustomColors.neutral9,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.3),
                                ),
                              ],
                            ),
                            Container(
                              width: 1.w,
                              height: 55.h,
                              color: CustomColors.neutral10,
                              margin: EdgeInsets.symmetric(horizontal: 16.w),
                            ),
                            Expanded(
                              flex: 173,
                              child: Text(
                                "About 2,000 miles from the U.S. mainland in the Pacific Ocean.",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    letterSpacing: -0.3,
                                    color: CustomColors.neutral9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).scaleBounceAniation(
                      delay: const Duration(milliseconds: 800))
                ],
              ),
              SizedBox(height: 75.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: CustomColors.neutral1),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: CustomColors.primary2),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      stops: [0.0, 0.08],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white10, Colors.white],
                    ).createShader(bounds);
                  },
                  child: ListView.builder(
                    itemCount: newsData.length,
                    padding: EdgeInsets.only(top: 10.h),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        key: ValueKey(index),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewPage(),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: Row(
                            children: [
                              Image.asset(newsData[index]['image'],
                                  fit: BoxFit.contain),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      newsData[index]['title'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: CustomColors.neutral1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      newsData[index]['date'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: CustomColors.neutral5,
                                      ),
                                    ),
                                    Text(
                                      newsData[index]['description'],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: CustomColors.neutral5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ).fadeInSlideUp(
                            delay: Duration(milliseconds: 500 * (index % 10))),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
