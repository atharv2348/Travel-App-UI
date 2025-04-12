import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/custom_colors.dart';
import 'package:travel_app/constants/raw_data.dart';
import 'package:travel_app/utils/custom_animations.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier _selectedIndex = ValueNotifier<int>(0);

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
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                        fontSize: 32.sp, color: CustomColors.neutral3),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: CustomColors.primary1,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/icons/filter.svg',
                        width: 16.w, height: 16.h),
                  ).scaleBounceAniation(),
                ],
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: CustomColors.neutral7),
                    borderRadius: BorderRadius.circular(37.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: CustomColors.primary1),
                    borderRadius: BorderRadius.circular(37.r),
                  ),
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
                    child: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      height: 16.h,
                      width: 16.w,
                      colorFilter: const ColorFilter.mode(
                          CustomColors.primary1, BlendMode.srcIn),
                    ),
                  ),
                  hintText: 'Seach something...',
                  hintStyle:
                      TextStyle(fontSize: 14.sp, color: CustomColors.neutral5),
                ),
              ).fadeInSlideUp(),
              SizedBox(height: 28.h),
              ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context, value, child) {
                  return Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: searchList
                        .asMap()
                        .entries
                        .map(
                          (entry) => GestureDetector(
                            onTap: () => _selectedIndex.value = entry.key,
                            child: searchCard(
                                entry.value, _selectedIndex.value == entry.key),
                          ).fadeInSlideUp(
                              delay: Duration(milliseconds: 100 * entry.key)),
                        )
                        .toList(),
                  );
                },
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recently search",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: CustomColors.neutral1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: CustomColors.primary2,
                      fontWeight: FontWeight.w600,
                    ),
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
                     padding: EdgeInsets.only(top: 10.h),
                    itemCount: recentSearchList.length,
                    itemBuilder: (context, index) {
                      return recentSearchTile(recentSearchList[index])
                          .fadeInSlideUp(
                              delay: Duration(milliseconds: 300 * index));
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

  Widget searchCard(Map<String, dynamic> data, bool isSelected) {
    return Container(
      width: 100.w,
      height: 85.h,
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.secondary2 : CustomColors.neutral8,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            data['image'],
            colorFilter: ColorFilter.mode(
                isSelected ? CustomColors.neutral10 : CustomColors.neutral1,
                BlendMode.srcIn),
          ),
          SizedBox(height: 10.h),
          Text(
            data['title'],
            style: TextStyle(
              fontSize: 12.sp,
              color:
                  isSelected ? CustomColors.neutral10 : CustomColors.neutral1,
            ),
          ),
        ],
      ),
    );
  }

  Widget recentSearchTile(Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.neutral8,
          borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 12.w),
      child: Row(
        children: [
          Image.asset(
            data['image'],
            height: 64.h,
            width: 81.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['place_name'],
                style: TextStyle(
                    color: CustomColors.neutral1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                data['country_name'],
                style: TextStyle(color: CustomColors.neutral5, fontSize: 14.sp),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 64.h,
            width: 81.w,
            decoration: BoxDecoration(
              color: CustomColors.neutral10,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['rating'],
                      style: TextStyle(
                          color: CustomColors.neutral3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4.w),
                    const Icon(Icons.star_rounded,
                        color: CustomColors.primary1),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  data['review'],
                  style:
                      TextStyle(color: CustomColors.neutral5, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
