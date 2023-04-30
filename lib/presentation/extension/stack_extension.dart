import 'package:flutter/material.dart';

enum LoadingState {
  loaded,
  loading,
}

extension ProgressLoader on Stack {
  // ignore: missing_return
  Widget fullScreenLoader({
    required LoadingState state,
    loadingWidget,
    child,
  }) {
    switch (state) {
      case LoadingState.loaded:
        return Stack(
          children: [
            child,
          ],
        );
      case LoadingState.loading:
        return Stack(
          children: [
            child,
            loadingWidget,
          ],
        );
    }
  }
}
