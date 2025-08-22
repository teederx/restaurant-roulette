import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/restaurant/restaurant_model.dart';
import 'restaurant_tile.dart';
import 'tile_animation.dart';
import 'wheel.dart';

class SpinWheelTab extends ConsumerStatefulWidget {
  const SpinWheelTab({super.key, required this.fetchRestaurantState});
  final AsyncValue<List<RestaurantModel>> fetchRestaurantState;

  @override
  ConsumerState<SpinWheelTab> createState() => _SpinWheelTabState();
}

class _SpinWheelTabState extends ConsumerState<SpinWheelTab> {
  final StreamController<int> controller = StreamController<int>.broadcast();
  int selectedRestaurantIndex = 0;
  bool animationStop = true;
  bool hasSpun = false; // 👈 track if user tapped at least once

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void toggleAnimation() {
    setState(() {
      animationStop = !animationStop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.fetchRestaurantState.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(
            child: Text(
              'Oops! No available data for your location.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        final restaurants = data.take(10).toList();

        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Only show the wheel once user has tapped spin
                if (hasSpun)
                  Wheel(
                    restaurants: restaurants,
                    controller: controller,
                    toggleAnimation: toggleAnimation,
                  )
                else
                  Container(
                    height: 250.h,
                    width: 250.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      "Tap Spin to start",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                10.verticalSpace,

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
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
                  onPressed:
                      animationStop
                          ? () {
                            setState(() {
                              hasSpun = true; // 👈 show wheel
                            });
                            toggleAnimation();

                            final index = Random().nextInt(restaurants.length);
                            controller.add(index);

                            setState(() {
                              selectedRestaurantIndex = index;
                            });
                          }
                          : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        animationStop ? "Spin" : "Spinning...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      5.horizontalSpace,
                      if (animationStop)
                        Icon(Icons.play_arrow_outlined, size: 20.sp),
                    ],
                  ),
                ),

                10.verticalSpace,

                if (animationStop && hasSpun) ...[
                  const Divider(),
                  TilesAnimation(
                    child: RestaurantTile(
                      restaurant: restaurants[selectedRestaurantIndex],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
      error:
          (error, st) => const Center(
            child: Text(
              'Oops! Could not find data for your location.',
              style: TextStyle(color: Colors.red),
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
