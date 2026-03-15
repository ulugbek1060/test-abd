import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/library/read_book_cubit.dart';
import 'package:testabd/features/library/read_book_state.dart';
import 'package:testabd/main.dart';
import 'package:testabd/router/app_router.dart';

class ReadBookScreen extends StatelessWidget {
  final int? bookId;

  const ReadBookScreen({super.key, this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ReadBookCubit>(param1: bookId),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  PdfViewerController? _controller;
  static const int _pagesPerChunk = 10;

  @override
  void initState() {
    _controller = PdfViewerController();
    BlocProvider.of<ReadBookCubit>(context).load();
    super.initState();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return const Scaffold(body: Center(child: CircularProgressIndicator()));
    // }
    //
    // if (_error != null || _localPdfPath == null) {
    //   return Scaffold(body: Center(child: Text('Error loading PDF: $_error')));
    // }
    //
    // final chunkStart = widget.initialStartPage;
    // final chunkEnd = chunkStart + _pagesPerChunk - 1;

    return BlocBuilder<ReadBookCubit, ReadBookState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.book?.title ?? ""),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text('${state.currentPage} / ${state.totalPages}'),
                ),
              ),
            ],
          ),
          body:
              state.isLoading ||
                  state.localFilePath == null ||
                  state.localFilePath == ""
              ? ProgressView.medium()
              : PdfViewer.file(
                  state.localFilePath ?? "",
                  initialPageNumber: state.initialPage,
                  controller: _controller,
                  params: PdfViewerParams(
                    // calculateInitialZoom: (_, __, ___, ____){
                    //   // return null;
                    // },
                    onPageChanged: (page) =>
                        context.read<ReadBookCubit>().onPageChanged(
                          page: page,
                          onNavigate: () {
                            // context.push(
                            //   '/chat-after-read',
                            //   extra: {
                            //     'pdfUrl': widget.pdfUrl,
                            //     'nextStartPage': chunkEnd + 1,
                            //     'totalPages': _totalPages,
                            //   },
                            // );
                          },
                        ),
                    onDocumentLoadFinished: (document, load) {},
                    // You can restrict gestures / zoom if desired
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                ),
        );
      },
    );
  }
}
