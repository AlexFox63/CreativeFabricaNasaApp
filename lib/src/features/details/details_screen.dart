import 'package:flutter/material.dart';

import '../../domain/entities/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  const DetailScreen({
    required this.photo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo ${photo.id}'),
      ),
      body: Center(
        child: Hero(
          tag: photo.id,
          child: Image.network(photo.imgUrl),
        ),
      ),
    );
  }
}
