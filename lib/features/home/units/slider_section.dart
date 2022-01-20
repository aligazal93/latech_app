import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/home/cubit/cubit.dart';

class SliderSection extends StatelessWidget {
  // final List<String> imagesList = [
  //   "https://i.ytimg.com/vi/XBKzpTz65Io/maxresdefault.jpg",
  //   "https://www.heavytask.com/wp-content/uploads/2021/04/flutter-banner-1080x675.png",
  //   "https://i.ytimg.com/vi/XBKzpTz65Io/maxresdefault.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    final imagesList = HomeCubit.get(context).homeModel!.data!.banners!;
    return SizedBox(
      height: sizeFromHeight(3),
      child: CarouselSlider(
        items: imagesList
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        e.image!,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
        ),
      ),
    );
  }
}
