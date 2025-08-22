import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_roulette/feature/data/model/category/category_model.dart';
import 'package:restaurant_roulette/feature/data/model/location/location_model.dart';

import '../../../../data/model/restaurant/restaurant_model.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  String getPriceLabel(String? price) {
    switch (price) {
      case r"$":
        return "Budget";
      case r"$$":
        return "Moderate";
      case r"$$$":
        return "Expensive";
      case r"$$$$":
        return "Luxury";
      default:
        return "N/A";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              restaurant.name,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            5.verticalSpace,
            if (restaurant.categories.isNotEmpty)
              Wrap(
                spacing: 5.w,
                runSpacing: 3.h,
                children:
                    restaurant.categories
                        .map(
                          (category) => Chip(
                            label: Text(
                              category.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                            backgroundColor: category.color,
                          ),
                        )
                        .toList(),
              ),
            5.verticalSpace,
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20.sp),
                Text(
                  '${restaurant.rating}/5',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Spacer(),
                Text(
                  'Price: ${getPriceLabel(restaurant.price)}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Spacer(),
                Text(
                  '${restaurant.reviewCount} reviews',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Icon(Icons.link, color: Colors.blueGrey, size: 20.sp),
                5.horizontalSpace,
                Expanded(
                  child: SelectableText(
                    restaurant.url,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                    maxLines: 4,
                  ),
                ),
              ],
            ),

            if (restaurant.location.fullAddress != "") ...[
              5.verticalSpace,
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blueGrey, size: 20.sp),
                  Expanded(
                    child: Text(
                      restaurant.location.fullAddress,
                      style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.blueGrey[300],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
