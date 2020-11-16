import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text1/bloc/produit_bloc.dart';
import 'package:text1/bloc/produit_state.dart';
import 'package:text1/bloc/produit_event.dart';
import 'package:text1/model/api_res_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FoodsBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<FoodsBloc>(context);
    articleBloc.add(FetchFoodsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("NeuralNeon"),
                leading:
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      articleBloc.add(FetchFoodsEvent());
                    },
                  ),


              ),
              body: Container(
                child: BlocListener<FoodsBloc, FoodsState>(
                  listener: (context, state) {
                    if (state is FoodsErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<FoodsBloc, FoodsState>(
                    builder: (context, state) {
                      if (state is FoodsInitialState) {
                        return buildLoading();
                      } else if (state is ArticleLoadingState) {
                        return buildLoading();
                      } else if (state is FoodsLoadedState) {
                        return buildFoodsList(state.foods);
                      } else if (state is FoodsErrorState) {
                        return buildErrorUi(state.message);
                      }else{
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildFoodsList(List<Foods> Foods) {
    return ListView.builder(
      itemCount: Foods.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ListTile(
              leading: ClipOval(
                child:Image.network(
                 // "https://kathalog.net/admin/images/f3d4e15d88079e37457d740ff8db343d.jpeg",
                    "https://bbeep.co.il/images/food/"+Foods[pos].image,
                    fit: BoxFit.contain,
                    height: 70.0,
                    width: 70.0,
                  ),

              ),
              title: Text(Foods[pos].title['ar']),
              subtitle: Text(Foods[pos].description["ar"]),

            ),

          ),
        );
      },
    );
  }

}