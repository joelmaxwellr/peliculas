import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.4,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: 'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FadeInImage(
                  placeholder: AssetImage('img/no-image.jpg'),
                  image: AssetImage('img/no-image.jpg')),
            ),
          );
        },
      ),
    );
  }
}
