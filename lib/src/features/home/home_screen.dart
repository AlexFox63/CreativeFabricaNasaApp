import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/photo.dart';
import '../details/details_screen.dart';
import 'bloc/home_screen_bloc.dart';
import 'bloc/home_screen_events.dart';
import 'bloc/home_screen_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is HomeScreenInitialState) {
            context.read<HomeScreenBloc>().add(HomeScreenFetchPhotosEvent());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeScreenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeScreenLoadedState && state.photos != null && state.photos!.isNotEmpty) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Curiosity Photos'),
                    background: Image.network(
                      state.photos![0].imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _HomeScreenBody(photos: state.photos!),
              ],
            );
          }
          if (state is HomeScreenErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({
    required this.photos,
  });

  final List<Photo> photos;

  void _onItemPressed(
    BuildContext context,
    Photo photo,
  ) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => DetailScreen(photo: photo),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final photo = photos[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: InkWell(
              onTap: () => _onItemPressed(context, photo),
              child: ListTile(
                leading: Hero(
                  tag: photo.id,
                  child: Image.network(
                    photo.imgUrl,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(photo.camera.fullName),
                subtitle: Text(
                  'Earth date: ${photo.earthDate}\nRover status: ${photo.rover.status}',
                ),
              ),
            ),
          );
        },
        childCount: photos.length,
      ),
    );
  }
}
