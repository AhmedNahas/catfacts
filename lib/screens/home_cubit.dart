import 'package:catfacts/components/reusable_component.dart';
import 'package:catfacts/model/fact_model.dart';
import 'package:catfacts/network/dio_helper.dart';
import 'package:catfacts/screens/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeCubitInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  var facts = <Fact>[];

  Future<void> getFacts() async {
    emit(HomeCubitLoadingState());
    facts.clear();
    DioHelper.getRandomFacts().then(
      (value) {
        for (var fact in value?.data) {
          facts.add(Fact.fromJson(fact));
        }
        emit(HomeCubitSuccessState());
      },
    ).catchError((error) {
      showToast(msg: error.toString(), backGround: Colors.red);
      emit(HomeCubitErrorState(error));
    });
  }
}
