import 'package:carousel_slider/carousel_slider.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';

class SpecialsSlider extends StatelessWidget {
  const SpecialsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        carouselController: CarouselSliderController(),
        options: CarouselOptions(
          height: getSize(180),
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOutCubic,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          padEnds: false,
          clipBehavior: Clip.none,
          enlargeFactor: 0,
        ),
        items: List.generate(
          5,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: getSize(20)),
            decoration: BoxDecoration(
              color: const Color(0xffdddddd),
              borderRadius: BorderRadius.circular(getSize(10)),
            ),
          ),
        )
      )
    );
  }
}