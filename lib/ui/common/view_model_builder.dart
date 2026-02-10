import 'package:flutter/material.dart';
import '../../core/locator.dart';
import '../../core/viewmodels/base_view_model.dart';

class ViewModelBuilder<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) builder;
  final Function(T)? onModelReady;

  const ViewModelBuilder({
    super.key,
    required this.builder,
    this.onModelReady,
  });

  @override
  State<ViewModelBuilder<T>> createState() => _ViewModelBuilderState<T>();
}

class _ViewModelBuilderState<T extends BaseViewModel> extends State<ViewModelBuilder<T>> {
  late final T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = locator<T>();

    if (widget.onModelReady != null) {
      widget.onModelReady!(viewModel);
    }
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, viewModel);
  }
}
