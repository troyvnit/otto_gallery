import 'package:flutter/material.dart';
import 'package:otto_gallery/app/app.locator.dart';
import 'package:otto_gallery/app/app.router.dart';
import 'package:otto_gallery/models/photo_model.dart';
import 'package:otto_gallery/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();

  int page = 1;
  int limit = 12;
  bool hasNextPage = false;
  bool loading = false;
  bool get loadingMore => loading && page > 1;
  List<PhotoModel> photos = [];
  ScrollController? scrollController;

  void init() async {
    scrollController = ScrollController()..addListener(triggerLoadMore);
    await loadData();
  }

  void setLoading(bool loading) {
    this.loading = loading;

    notifyListeners();
  }

  void triggerLoadMore() async {
    if (scrollController != null &&
        scrollController!.position.extentAfter < 100 &&
        !loading &&
        hasNextPage) {
      await loadData();
    }
  }

  void addPhotos(List<PhotoModel> addPhotos) {
    photos.addAll(addPhotos);

    notifyListeners();
  }

  Future<void> loadData() async {
    setLoading(true);

    final photos = await _apiService.getPhotos(page, limit);
    page += 1;
    hasNextPage = photos.length == limit;

    addPhotos(photos);

    setLoading(false);
  }

  Future<void> refresh() async {
    page = 1;
    photos.clear();
    await loadData();
  }

  void openPhoto(PhotoModel photo) {
    _navigationService.navigateToPhotoView(photo: photo);
  }

  @override
  void dispose() {
    scrollController?.removeListener(triggerLoadMore);
    super.dispose();
  }
}
