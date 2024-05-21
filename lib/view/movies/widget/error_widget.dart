import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../configs/components/internet_exception_widget.dart'; // Importing the InternetExceptionWidget

/// A widget for displaying error messages related to movies.
class MoviesErrorWidget extends StatelessWidget {
  const MoviesErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.moviesList != current.moviesList,
      builder: (context, state) {
        // Checking if the error message indicates no internet connection
        if (state.moviesList.message.toString() == AppLocalizations.of(context)!.noInternetConnection) {
          // Displaying InternetExceptionWidget if there's no internet connection
          return InterNetExceptionWidget(onPress: () {
            // Dispatching PostFetched event to trigger fetching movies data
            context.read<MoviesBloc>().add(MoviesFetch());
          });
        } else {
          // Displaying error message as a clickable text if it's not related to internet connection
          return InkWell(
            onTap: () {
              // Dispatching PostFetched event to trigger fetching movies data
              context.read<MoviesBloc>().add(MoviesFetch());
            },
            child: Center(
              child: Text(state.moviesList.message.toString()),
            ),
          );
        }
      },
    );
  }
}
