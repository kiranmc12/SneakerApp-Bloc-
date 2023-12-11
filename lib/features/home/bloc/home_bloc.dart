import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_shopping/data/grocery_data.dart';
import 'package:bloc_practice_shopping/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWhishListButtonClickedEvent>(
        homeProductWhishListButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState
    (products: GroceryData.groceryProducts.map((e) => ProductDataModel(
      id: e['id'],
      name: e['name'],
       description: e['description'], 
       price: e['price'],
        imageUrl: e['imageUrl'])).toList()));
  }

  FutureOr<void> homeProductWhishListButtonClickedEvent(
      HomeProductWhishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Clicked");
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Navigate clicked");
    emit(NavigateToCartPageActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wish list Navigate");
    emit(NavigateToWishlistPageActionState());
  }
}
