import 'package:flutter/material.dart';
import 'package:otto_gallery/models/photo_model.dart';
import 'package:stacked/stacked.dart';
import 'package:photo_view/photo_view.dart' as photo_view;

import 'photo_viewmodel.dart';

class PhotoView extends StackedView<PhotoViewModel> {
  final PhotoModel photo;

  const PhotoView({Key? key, required this.photo}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PhotoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      appBar: AppBar(
        title: Text(photo.author),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Hero(
              tag: "photo_${photo.id}",
              child: photo_view.PhotoView(
                imageProvider: NetworkImage(photo.downloadUrl),
              ))),
    );
  }

  @override
  PhotoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PhotoViewModel();
}
