import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/restaurant/restaurant_model.dart';

class Wheel extends StatelessWidget {
  const Wheel({
    super.key,
    required this.restaurants,
    required this.controller,
    required this.toggleAnimation,
  });
  final List<RestaurantModel> restaurants;
  final StreamController<int> controller;
  final VoidCallback toggleAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 250.h,
          width: 250.h,
          child: FortuneWheel(
            selected: controller.stream,
            onAnimationEnd: toggleAnimation,
            items: [
              for (var r in restaurants)
                FortuneItem(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image
                      Image.network(
                        r.imageUrl.isEmpty
                            ? "https://via.placeholder.com/300"
                            : r.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: const Icon(
                              Icons.restaurant,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      // Overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withAlpha(200),
                              Colors.black.withAlpha(76),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      // Restaurant name
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            r.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 3,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
            indicators: [
              FortuneIndicator(
                alignment: Alignment.topCenter,
                child: TriangleIndicator(
                  elevation: 5,
                  color: Colors.white,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
