import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:otto_gallery/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: viewModel.refresh,
          child: Padding(
            padding: horizontalInsetsBase,
            child: Column(
              children: [
                Image.network(
                    "https://mlr3bpqgyrr9.i.optimole.com/cb:ULdh.5db64/w:1746/h:366/q:90/f:avif/https://ottoint.com/wp-content/uploads/2020/12/logo_transparentBG-white@4x.png"),
                Expanded(
                    child: viewModel.loading && viewModel.photos.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : MasonryGridView.count(
                            controller: viewModel.scrollController,
                            crossAxisCount: 2,
                            crossAxisSpacing: base,
                            mainAxisSpacing: base,
                            itemCount: viewModel.photos.length,
                            itemBuilder: (context, index) {
                              final photo = viewModel.photos[index];
                              final width = photo.width;
                              final height = photo.height;
                              final revisedWidth =
                                  (halfScreenWidth(context) - (base * 1.5));
                              final revisedHeight =
                                  (revisedWidth * height / width);
                              final url = photo.downloadUrl
                                  .replaceAll(
                                      "$width", "${revisedWidth.round()}")
                                  .replaceAll(
                                      "$height", "${revisedHeight.round()}");
                              return SizedBox(
                                width: revisedWidth,
                                height: revisedHeight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(xs),
                                  child: InkWell(
                                    onTap: () => viewModel.openPhoto(photo),
                                    child: Hero(
                                      tag: "photo_${photo.id}",
                                      child: Image.network(
                                        url,
                                        cacheHeight: revisedHeight.round(),
                                        cacheWidth: revisedWidth.round(),
                                        loadingBuilder:
                                            (context, child, loadingProgress) =>
                                                loadingProgress != null
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : child,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                if (viewModel.loadingMore)
                  Container(
                    padding: verticalInsetsBase,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.init());
}
