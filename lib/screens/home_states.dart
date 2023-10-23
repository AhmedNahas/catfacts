
abstract class HomeStates {}

class HomeCubitInitialState extends HomeStates{}

class HomeCubitLoadingState extends HomeStates{}

class HomeCubitSuccessState extends HomeStates{}

class HomeCubitErrorState extends HomeStates{
  final String error;
  HomeCubitErrorState(this.error);
}