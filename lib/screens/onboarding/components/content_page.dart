import 'package:flutter/material.dart';

AnimatedContainer page(int? index, int? currentPage) {
  return AnimatedContainer(
    duration: kThemeAnimationDuration,
    margin: const EdgeInsets.only(right: 15.0),
    height: 6,
    width: currentPage == index ? 24 : 15,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: currentPage == index
            ? const Color.fromARGB(255, 255, 75, 75)
            : Colors.grey),
  );
}
