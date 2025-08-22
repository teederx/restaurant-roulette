import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_roulette/feature/data/model/category/category_model.dart';

import '../../../../data/model/restaurant/restaurant_model.dart';
import '../../../providers/fetch_restaurants/fetch_restaurants_provider.dart';
import 'dialog_body.dart';

class RestaurantTile extends ConsumerWidget {
  const RestaurantTile({
    super.key,
    required this.restaurant,
    this.type = 1,
    this.onFavoriteToggle,
  });

  final RestaurantModel restaurant;
  final int type;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        customDialog(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.blueGrey[100],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
          child: Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                width: 150.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 15.sp),
                        Text('${restaurant.rating}/5'),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  restaurant.isFavorite || type == 2
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  color:
                      restaurant.isFavorite || type == 2
                          ? Colors.red
                          : Colors.black54,
                ),
                onPressed:
                    type == 2
                        ? onFavoriteToggle
                        : () => ref
                            .read(fetchRestaurantsProvider.notifier)
                            .toggleFavorite(restaurant.id),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Object?> customDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "View Restaurant",
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (_, animation, _, child) {
        final tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOutBack),
          ),
          child: child,
        );
      },
      pageBuilder:
          (context, _, _) => Center(
            child: Container(
              constraints: BoxConstraints(maxHeight: 500.h, maxWidth: 300.w),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: DialogBody(restaurant: restaurant),
            ),
          ),
    );
  }
}
