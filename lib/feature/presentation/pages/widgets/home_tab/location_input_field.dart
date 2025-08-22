import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationInputField extends StatelessWidget {
  const LocationInputField({
    super.key,
    required this.locationController,
    required this.onSave,
  });

  final TextEditingController locationController;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                2.horizontalSpace,
                Text("Your Location", style: TextStyle(color: Colors.black)),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    controller: locationController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Enter your state or city here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                    ),
                  ),
                ),
                8.horizontalSpace,
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Colors.blueGrey[300],
                    ),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                  onPressed: onSave,
                  icon: Icon(Icons.save_alt_rounded),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Icon(Icons.my_location, size: 15.sp, color: Colors.red),
                2.horizontalSpace,
                Text(
                  "Location is used to find nearby restaurants",
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.lock, size: 15.sp, color: Colors.amber),
                2.horizontalSpace,
                Text(
                  "Your location data is never stored or shared",
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.warning_rounded, size: 15.sp, color: Colors.amber),
                2.horizontalSpace,
                Text(
                  "This app does not cover all countries",
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
