import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderSyncDemo extends StatefulWidget {
  final List<String> largeImageUrls;
  final List<String> smallImageUrls;

  const SliderSyncDemo({
    Key? key,
    required this.largeImageUrls,
    required this.smallImageUrls,
  }) : super(key: key);

  @override
  _SliderSyncDemoState createState() => _SliderSyncDemoState();
}

class _SliderSyncDemoState extends State<SliderSyncDemo> {
  int _current = 0;
  final CarouselController _largeController = CarouselController();
  final CarouselController _smallController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _largeController,
          options: CarouselOptions(
            height: 250.0,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2994),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
              _smallController.animateToPage(index);
            },
          ),
          items: widget.largeImageUrls.map((item) {
            return Opacity(
              opacity: 0.6,
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),

        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: CarouselSlider(
            carouselController: _smallController,
            options: CarouselOptions(
              height: 190.0,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
                _largeController.animateToPage(index);
              },
            ),
            items: widget.smallImageUrls.map((item) {
              return GestureDetector(
                onTap: () {
                  _largeController.animateToPage(_current);
                },
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
