import 'package:alzilzal/Core/constatnts/colors.dart';
import 'package:alzilzal/Core/constatnts/variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'banner_loading_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key, required this.banners}) : super(key: key);

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppVariables.appSize(context).height * 0.24,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            width: 65,
            imageUrl: banners[index],
            placeholder: (context, url) => const BannerLoadingWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
        itemCount: banners.length,
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: MyColors.buttonsColor,
            )),
      ),
    );
  }
}
