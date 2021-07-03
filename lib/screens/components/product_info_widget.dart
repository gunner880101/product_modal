import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_modal/models/product_info.dart';
import 'package:product_modal/utils/size_config.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductInfo productInfo;
  const ProductInfoWidget({Key? key, required this.productInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: productInfo.images!.full_size!,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.3,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 500),
          fadeOutDuration: Duration(milliseconds: 500),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig().getHeight(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig().getHeight(4),
              ),
              Text(
                productInfo.name!,
                style: TextStyle(fontSize: SizeConfig().getHeight(24)),
              ),
              SizedBox(
                height: SizeConfig().getHeight(12),
              ),
              Text(
                productInfo.full_description!,
                style: TextStyle(
                    fontSize: SizeConfig().getHeight(14),
                    color: Colors.black45),
              ),
            ],
          ),
        )
      ],
    );
  }
}
