import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_roulette/feature/presentation/providers/cuisine_list/cuisine_list_provider.dart';
import 'package:restaurant_roulette/feature/presentation/providers/fetch_restaurants/fetch_restaurants_provider.dart';

import '../../../../data/model/category/category_model.dart';
import 'chip_selection_field.dart';
import 'location_input_field.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  TextEditingController locationController = TextEditingController();
  String? selectedCuisine;

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        shrinkWrap: true,
        children: [
          Text(
            "Location",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          5.verticalSpace,
          //Location Input Field
          LocationInputField(
            locationController: locationController,
            onSave: () {
              locationController.text.isNotEmpty
                  ? FocusScope.of(context).unfocus()
                  : null;
            },
          ),
          15.verticalSpace,
          Text(
            "Select Cuisine",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          5.verticalSpace,

          // Cuisine selection field
          CuisineSelectionField(
            location: locationController.text,
            availableCuisines: ref.watch(cuisineListProvider),
            onCuisineSelected: (CategoryModel value) {
              ref.read(cuisineListProvider.notifier).toggleSelected(value);
              setState(() {
                selectedCuisine = value.alias;
              });
            },
          ),

          15.verticalSpace,

          // Go to Spin Screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Colors.blueGrey[300],
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            onPressed:
                locationController.text.isNotEmpty && selectedCuisine != null
                    ? () async {
                      await ref
                          .read(fetchRestaurantsProvider.notifier)
                          .fetchRestaurants(
                            term: selectedCuisine!,
                            location: locationController.text,
                          );
                      if (!mounted) return;
                      final tabController = DefaultTabController.of(context);
                      tabController.animateTo(1);
                    }
                    : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Proceed to spin wheel",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                5.horizontalSpace,
                Icon(Icons.arrow_right_alt_outlined, size: 25.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
