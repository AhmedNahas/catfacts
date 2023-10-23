import 'package:catfacts/components/reusable_component.dart';
import 'package:catfacts/model/fact_model.dart';
import 'package:catfacts/screens/home_cubit.dart';
import 'package:catfacts/screens/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (ctx, state) {
        if (state is HomeCubitErrorState) {
          showToast(msg: 'Success', backGround: Colors.green);
        }
      },
      builder: (ctx, state) {
        var cubit = HomeCubit.get(ctx);
        return Scaffold(
          backgroundColor: Colors.amber,
          appBar: defaultAppBar(
              context: context, showLeading: false, title: 'Cat facts'),
          body: RefreshIndicator(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  state is HomeCubitLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (ctx, i) =>
                              factWidgetItem(cubit.facts[i]),
                          separatorBuilder: (ctx, i) => const SizedBox(
                                height: 10.0,
                              ),
                          itemCount: cubit.facts.length),
                ],
              ),
              onRefresh: () {
                return cubit.getFacts();
              }),
        );
      },
    );
  }

  Widget factWidgetItem(Fact fact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '${fact.text}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 2,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
