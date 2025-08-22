import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_roulette/feature/data/model/category/category_model.dart';


class CuisineSelectionField extends StatelessWidget {
  const CuisineSelectionField({
    super.key,
    this.location,
    required this.availableCuisines,
    required this.onCuisineSelected,
  });

  final String? location;
  final List<CategoryModel> availableCuisines;
  final ValueChanged<CategoryModel> onCuisineSelected;

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
            // Title
            Row(
              children: [
                Icon(Icons.restaurant_menu_outlined),
                8.horizontalSpace,
                Text(
                  "What are you in the mood for?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            10.verticalSpace,

            // Location info
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: 15.sp,
                ),
                5.horizontalSpace,
                Text(
                  location == null || location == ""
                      ? "Select Location"
                      : location!,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),

            15.verticalSpace,

            if (location == null)
              Text(
                "Please select a location",
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
              ),

            if (location != null && availableCuisines.isEmpty)
              Text(
                "No cuisines available for your location",
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
              ),

            // Grid of cuisines
            if (location != null && availableCuisines.isNotEmpty)
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 2 per row
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 2.5,
                ),
                itemCount: availableCuisines.length,
                itemBuilder: (context, index) {
                  final cuisine = availableCuisines[index];
                  final chipColor = cuisine.color;
                  return ChoiceChip(
                    label: Text(
                      cuisine.title,
                      style: TextStyle(
                        color: Colors.white, // contrast text
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    selected: cuisine.isSelected,
                    onSelected: (bool selected) => onCuisineSelected(cuisine),
                    backgroundColor: chipColor.withAlpha(200),
                    selectedColor: chipColor,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
