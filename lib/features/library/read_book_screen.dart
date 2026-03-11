import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/library/read_book_cubit.dart';
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
  String? _localPdfPath;
  PdfViewerController? _controller;
  int _totalPages = 0;
  int _currentPage = 1;
  bool _isLoading = true;
  String? _error;

  static const int _pagesPerChunk = 10;

  @override
  void initState() {
    _controller = PdfViewerController();
    BlocProvider.of<ReadBookCubit>(context).load();
    super.initState();
    _loadPdf();
  }

  @override
  void dispose() {
    _controller = null;
    super.dispose();
  }

  Future<void> _loadPdf() async {
    // try {
    //   setState(() => _isLoading = true);
    //
    //   final tempDir = await getTemporaryDirectory();
    //   final fileName = Uri.parse(widget.pdfUrl).pathSegments.last;
    //   final file = File('${tempDir.path}/$fileName');
    //
    //   if (!await file.exists()) {
    //     final response = await http.get(Uri.parse(widget.pdfUrl));
    //     if (response.statusCode != 200)
    //       throw Exception('Failed to download PDF');
    //     await file.writeAsBytes(response.bodyBytes);
    //   }
    //
    //   setState(() {
    //     _localPdfPath = file.path;
    //     _isLoading = false;
    //   });
    // } catch (e) {
    //   setState(() {
    //     _error = e.toString();
    //     _isLoading = false;
    //   });
    // }
  }

  void _onPageChanged(int? page) {
    // if (page == null) return;
    // setState(() => _currentPage = page);
    //
    // final chunkStart = widget.initialStartPage;
    // final chunkEnd = chunkStart + _pagesPerChunk - 1;
    //
    // if (page >= chunkEnd) {
    //   // User reached or passed the limit → go to chat
    //   // context.push(
    //   //   '/chat-after-read',
    //   //   extra: {
    //   //     'pdfUrl': widget.pdfUrl,
    //   //     'nextStartPage': chunkEnd + 1,
    //   //     'totalPages': _totalPages,
    //   //   },
    //   // );
    //
    //   context.pushReplacement(
    //     AppRouter.chatAfterRead,
    //     extra: {'pdfUrl': widget.pdfUrl, 'initialStartPage': 2},
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
    //
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Pages $chunkStart–${_totalPages < chunkEnd ? _totalPages : chunkEnd}',
    //     ),
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.only(right: 16),
    //         child: Text('$_currentPage / $_totalPages'),
    //       ),
    //     ],
    //   ),
    //   body: PdfViewer.file(
    //     _localPdfPath!,
    //     controller: _controller,
    //     // Optional: gestureSettings, renderer, etc.
    //     params: PdfViewerParams(
    //       // calculateInitialZoom: (_, __, ___, ____){
    //       //   // return null;
    //       // },
    //       onPageChanged: (page) => _onPageChanged(page),
    //       onDocumentLoadFinished: (document, load) {
    //         setState(() {
    //           // _totalPages = document..length;
    //         });
    //         // Jump to allowed start if needed
    //         // if (widget.initialStartPage > 1) {
    //           // _controller?.jumpToPage(widget.initialStartPage);
    //         // }
    //       },
    //       // You can restrict gestures / zoom if desired
    //       scrollPhysics: const BouncingScrollPhysics(),
    //     ),
    //   ),
    // );
  }
}
