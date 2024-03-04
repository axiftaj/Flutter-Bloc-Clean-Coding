import 'package:bloc_clean_coding/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_clean_coding/data/response/response.dart';
import 'package:bloc_clean_coding/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<MoviesBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<MoviesBloc>().add(PostFetched());
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Popular Shows'),
        actions: const [
          SizedBox(width: 20,)
        ],
      ),
      body: BlocBuilder<MoviesBloc , MoviesState>(
        builder: (BuildContext context, state) {
            switch(state.moviesList.status){
              case Status.loading:
                return const Center(child:  CircularProgressIndicator());
              case Status.error:
                return Center(child: Text( state.moviesList.message.toString()));
              case Status.completed:
                if(state.moviesList.data! == null){
                  return const Text('No Data Found');
                }
                final movieList = state.moviesList.data! ;
                return ListView.builder(
                    itemCount: movieList.tvShow.length,
                    itemBuilder: (context, index){
                      final tvShow = movieList.tvShow[index] ;
                      return ListTile(
                        title: Text(tvShow.status),
                      );
                    }
                );
              default:
                return const SizedBox();
            }

        },
        
      ),
    );
  }
}

