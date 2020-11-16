
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:text1/model/api_res_model.dart';

abstract class FoodsState extends Equatable {}

class FoodsInitialState extends FoodsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ArticleLoadingState extends FoodsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FoodsLoadedState extends FoodsState {

  List<Foods> foods;

  FoodsLoadedState({@required this.foods});

  @override
  // TODO: implement props
  List<Object> get props => [foods];
}

class FoodsErrorState extends FoodsState {

  String message;

  FoodsErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}