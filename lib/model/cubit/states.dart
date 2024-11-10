abstract class RecipeState {}

class RecipeInitialState extends RecipeState {}

class RecipeBottomnavBarState extends RecipeState {}

class RecipeGetDataLoadingState extends RecipeState {}

class RecipeGetDataSuccessState extends RecipeState {
  final List<dynamic> Recipe;
  RecipeGetDataSuccessState(this.Recipe);
}

class RecipeGetDataErrorState extends RecipeState {
  final String error;
  RecipeGetDataErrorState(this.error);
}

class NewsGetSearchLodingState extends RecipeState {}

class NewsGetSearchSuccessState extends RecipeState {}

class RecipeErrorState extends RecipeState {
  final String error;

  RecipeErrorState({required this.error});
}
