import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget({
    this.photoLink,
  });
  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      photoLink,
      fit: BoxFit.cover,
      cache: true,
      enableSlideOutPage: true,
      shape: BoxShape.circle,
      filterQuality: FilterQuality.high,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Center(child: CircularProgressIndicator());
            break;
          case LoadState.completed:
            return null;
            break;
          case LoadState.failed:
            return GestureDetector(
              child: Center(child: Text("Reload")),
              onTap: () {
                state.reLoadImage();
              },
            );
            break;
        }

        return Text("");
      },
    );
  }
}
