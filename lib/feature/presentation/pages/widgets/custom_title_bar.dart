import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 15.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(color: Colors.blueGrey[300]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon.png', width: 80.w, height: 80.h),
              Text(
                'Restaurant Roulette',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Text(
            'Select a cuisine, spin the wheel, discover your next wonderful experience!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
