import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../configs/components/internet_exception_widget.dart';

class MoviesErrorWidget extends StatelessWidget {
  const MoviesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc , MoviesState>(
        buildWhen: (previous, current) => previous.moviesList != current.moviesList,
        builder: (context, state,){
          if(state.moviesList.message.toString() == 'No Internet Connection'){
            return InterNetExceptionWidget(onPress: (){
              context.read<MoviesBloc>().add(PostFetched());
            });
          }else {
            return InkWell(
                onTap: (){
                  context.read<MoviesBloc>().add(PostFetched());
                },
                child: Center(child: Text(state.moviesList.message.toString())));
          }
        }
    );
  }
}
