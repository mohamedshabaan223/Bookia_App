import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double width ;
  final double height ;
  
  const CustomNetworkImage({super.key, required this.url, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
       imageUrl: url,
       width: width,
       height: height,
       fit: BoxFit.cover,
       progressIndicatorBuilder: (context, url, downloadProgress) => 
               Skeletonizer(
                enabled: true,
                 child: Container(
                  height: height,
                  width: width,
                  color: Colors.grey,
                 ),
               ),
       errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
