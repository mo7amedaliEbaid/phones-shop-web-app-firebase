import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class DesktopImageListView extends StatefulWidget {
  final int starIndex;
  DesktopImageListView({super.key, required this.starIndex});

  @override
  State<DesktopImageListView> createState() => _DesktopImageListViewState();
}

class _DesktopImageListViewState extends State<DesktopImageListView> {
  final _scrollController = ScrollController();
  List<String> assetspics=[
    "assets/images/mobile9.jpg",
    "assets/images/mobile8.jpg",
    "assets/images/mobile2.jpeg",
    "assets/images/mobile9.jpg",
    "assets/images/mobile8.jpg",
  ];
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        _autoScroll();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.93 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height ,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Image.asset(
              assetspics[index],
              fit: BoxFit.contain,
              /*imageBuilder: (context, imageProvider) {
                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                );
              },*/
            );
          },
        ),
      ),
    );
  }
}
