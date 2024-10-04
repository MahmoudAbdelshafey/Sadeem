import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../manager/calculating_results/calculation_result_cubit.dart';
import '../../manager/calculating_results/calculation_result_state.dart';


class ProgresssAnimation extends StatefulWidget {
  const ProgresssAnimation({super.key,required this.progRadius, required this.loadCount, required this.state, this.showData = false, required this.progressFun, required this.animationChild});
  final double loadCount;
  final state;
  final bool showData;
  final VoidCallback progressFun;
  final Widget animationChild;
  final double progRadius;
  @override
  State<ProgresssAnimation> createState() => _ProgresssAnimationState();
}

class _ProgresssAnimationState extends State<ProgresssAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: widget.loadCount  ),
        duration: const Duration(seconds: 7),
        builder: (context, value, child) {

          if(widget.showData){
            if(widget.state is CalculatingResultLoading || widget.state is CalculatingResultInitial){
              if(value*100 <100){

                BlocProvider.of<CalculationResultCubit>(context).startAnimation(value);
              }else{
                print('the second else');

              }
            }else{
              print('the first else');

            }
          }

          // return SquareProgressIndicator(
          //   value: value,
          //   width: MediaQuery.of(context).size.width*0.5,
          //   height: MediaQuery.of(context).size.width*0.5,
          //   borderRadius: 100,
          //   startPosition: StartPosition.topCenter,
          //   strokeCap: StrokeCap.round,
          //   clockwise: true,
          //   color: Theme.of(context).primaryColor,
          //   emptyStrokeColor: Theme.of(context).disabledColor,
          //   strokeWidth: 3,
          //   emptyStrokeWidth: 3,
          //   strokeAlign: SquareStrokeAlign.inside,
          //   child: widget.animationChild,
          // );
          return  CircularPercentIndicator(
            radius: widget.progRadius,
            animation: true,
            animationDuration: 7000,
            lineWidth: 15.0,
            percent: widget.loadCount,
            center: widget.animationChild,
            circularStrokeCap: CircularStrokeCap.butt,
            progressColor: Theme.of(context).primaryColor,
          );

        },
        onEnd: widget.progressFun

    );
  }
}
