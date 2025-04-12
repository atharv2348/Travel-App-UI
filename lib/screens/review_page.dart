import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/raw_data.dart';
import 'package:travel_app/constants/custom_colors.dart';
import 'package:travel_app/utils/custom_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: CustomColors.neutral3,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 200,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 184.h,
                          width: 204.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.r),
                            child: Image.asset(
                              'assets/images/leaves.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  color: CustomColors.neutral10,
                                  fontSize: 32.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Rating for Pura Tirta Empul from Malaysia",
                                style: TextStyle(
                                  color: CustomColors.neutral9,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                    color: CustomColors.primary1,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: const Text(
                                  "Write your review",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.neutral10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).fadeInSlideRight(),
                  SizedBox(width: 12.w),
                  Expanded(
                    flex: 125,
                    child: Container(
                      height: 184.h,
                      decoration: BoxDecoration(
                        color: CustomColors.neutral7,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "3,5",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: CustomColors.neutral1,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(Icons.star_rounded,
                                  size: 40, color: CustomColors.secondary3)
                            ],
                          ),
                          SizedBox(height: 14.h),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star_rounded,
                                  color: CustomColors.primary2),
                              Icon(Icons.star_rounded,
                                  color: CustomColors.primary2),
                              Icon(Icons.star_rounded,
                                  color: CustomColors.primary2),
                              Icon(Icons.star_half_rounded,
                                  color: CustomColors.primary2),
                              Icon(Icons.star_outline_rounded,
                                  color: CustomColors.primary2),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Great",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: CustomColors.neutral1,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "1000+ traveller love this place",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: CustomColors.neutral5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).fadeInSlideLeft(delay: const Duration(milliseconds: 300)),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 8.w,
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    decoration: BoxDecoration(
                        color: CustomColors.neutral7,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Newest",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: CustomColors.neutral1)),
                        const Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 30,
                        ),
                      ],
                    ),
                  ).scaleBounceAniation(
                      delay: const Duration(milliseconds: 300)),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: CustomColors.primary1,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/icons/filter.svg',
                        width: 16.w, height: 16.h),
                  ).scaleBounceAniation(
                      delay: const Duration(milliseconds: 500)),
                ],
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(color: CustomColors.neutral7),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return buildComment(comments[index]).fadeInSlideUp(
                        delay: Duration(milliseconds: 500 * (index % 10)));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildComment(Map<String, dynamic> comment) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h, top: 12.h),
      child: Column(
        key: ValueKey(comment['_id']),
        children: [
          Row(
            children: [
              Image.asset(
                comment['userProfileImage'],
                width: 38.w,
                height: 38.h,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment['name'],
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.neutral3),
                  ),
                  Text(
                    comment['date'],
                    style: TextStyle(
                        fontSize: 12.sp, color: CustomColors.neutral5),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    color: CustomColors.neutral8,
                    padding: EdgeInsets.all(4.w),
                    child: const Icon(
                      Icons.thumb_up_alt_rounded,
                      color: CustomColors.primary2,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    comment['like_count'],
                    style:
                        TextStyle(color: CustomColors.neutral1, fontSize: 8.sp),
                  )
                ],
              ),
              SizedBox(width: 8.w),
              Column(
                children: [
                  Container(
                    color: CustomColors.neutral8,
                    padding: EdgeInsets.all(4.w),
                    child: const Icon(
                      Icons.thumb_down_alt_rounded,
                      color: CustomColors.neutral5,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    comment['dislike_count'],
                    style:
                        TextStyle(color: CustomColors.neutral1, fontSize: 8.sp),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.neutral7,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                    child: Row(
                      children: [
                        for (int i = 0; i < comment['rating']; i++)
                          const Icon(Icons.star_rounded,
                              color: CustomColors.secondary3),
                        for (int i = 0; i < 5 - comment['rating']; i++)
                          const Icon(Icons.star_rounded,
                              color: CustomColors.neutral5),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    comment['title'],
                    style: TextStyle(
                        color: CustomColors.neutral1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < comment['pics'].length; i++)
                    Image.asset(
                      comment['pics'][i],
                      width: 40.w,
                      height: 40.h,
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            comment['description'],
            style: TextStyle(fontSize: 12.sp, color: CustomColors.neutral1),
          )
        ],
      ),
    );
  }
}
