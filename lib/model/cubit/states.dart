abstract class FoodState {}

class FoodIntiatialState extends FoodState {}

class FoodBottomnavBarState extends FoodState {}
class FoodGetDataLoadingState extends FoodState {}

class FoodGetDataSuccessState extends FoodState {
  final List<dynamic> food;
  FoodGetDataSuccessState(this.food);
}

class FoodGetDataErrorState extends FoodState {
  final String error;
  FoodGetDataErrorState(this.error);
}