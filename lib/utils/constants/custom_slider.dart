import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImages extends StatefulWidget {
   SliderImages({Key? key,required this.imagesList}) : super(key: key);
List<String> imagesList;
  @override
  State<SliderImages> createState() => _SliderImagesState();
}

class _SliderImagesState extends State<SliderImages> {


 
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      // margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: CarouselSlider(
        carouselController: controller,
        items: List.generate(widget.imagesList.length, (index) {
          String image = widget.imagesList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal:2.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                width: 250.w,
                fit: BoxFit.fill,
              ),
            ),
          );
        }),
        options: CarouselOptions(
            height: 170,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            onPageChanged: (val, _) {
              setState(() {
                controller.jumpToPage(val);
              });
            }),
      ),
    );
  }
}
