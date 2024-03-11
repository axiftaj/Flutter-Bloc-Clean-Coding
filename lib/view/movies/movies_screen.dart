import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_clean_coding/data/response/response.dart';
import 'package:bloc_clean_coding/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../configs/components/network_image_widget.dart';
import 'widget/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<MoviesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MoviesBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.popularShows),
        actions: const [
          LogoutButtonWidget(),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.moviesList != current.moviesList,
        builder: (BuildContext context, state) {
          switch (state.moviesList.status) {
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.error:
              return const MoviesErrorWidget();
            case Status.completed:
              if (state.moviesList.data == null) {
                return Text(AppLocalizations.of(context)!.noDataFound);
              }
              final movieList = state.moviesList.data!;

              return ListView.builder(
                  itemCount: movieList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movieList.tvShow[index];
                    return Card(
                      child: ListTile(
                        leading: NetworkImageWidget(
                          borderRadius: 5,
                          imageUrl: tvShow.imageThumbnailPath.toString(),
                        ),
                        title: Text(tvShow.name.toString()),
                        subtitle: Text(tvShow.network.toString()),
                        trailing: Text(tvShow.status.toString()),
                      ),
                    );
                  });
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}