import 'package:flutter/material.dart';

class CircularTextCardImage extends StatelessWidget {
  /// Show a circular image and a text below it.
  ///
  /// [borderRadius] : radius of the circular image.
  /// [image] : image value (might be icon, url)
  /// [title] : title for the widget.
  CircularTextCardImage(this.borderRadius, this.title, this.image);

  final double borderRadius;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: borderRadius * 2,
      child: Column(
        children: [
          SizedBox(
            height: borderRadius * 2,
            width: borderRadius * 2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
              ),
              color: Colors.purple,
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius,
                  ),
                ),
                child: Image.network(
                  image
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
