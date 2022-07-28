import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carouselslider extends StatefulWidget {
  const carouselslider({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  State<carouselslider> createState() => _carouselsliderState();
}

class _carouselsliderState extends State<carouselslider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        items: widget.imgList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF232333),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$i ',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                          ),
                        ),
                        Text(
                          '₹ 23220.0',
                          style: TextStyle(
                            color: Colors.white,
                            height: 2.0,
                            fontSize: 28.0,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Color.fromARGB(255, 255, 255, 255))
                    .withOpacity(
                  _current == entry.key ? 0.9 : 0.4,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ]);

    // const Text(
    //   "Hello back",
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    // );
  }
}
