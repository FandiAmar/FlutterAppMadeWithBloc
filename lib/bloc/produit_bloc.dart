import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text1/bloc/produit_event.dart';
import 'package:text1/bloc/produit_state.dart';
import 'package:text1/model/api_res_model.dart';
import 'package:text1/resources/produit_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class FoodsBloc extends Bloc<FoodsEvent, FoodsState> {

  FoodsRepository repository;

  FoodsBloc({@required this.repository});

  @override
  // TODO: implement initialState
  FoodsState get initialState => FoodsInitialState();

  @override
  Stream<FoodsState> mapEventToState(FoodsEvent event) async* {
    if (event is FetchFoodsEvent) {
      yield ArticleLoadingState();
      try {
        List<Foods> foods = await repository.getFoods();
        yield FoodsLoadedState(foods: foods);
      } catch (e) {
        yield FoodsErrorState(message: e.toString());
      }
    }
  }

}