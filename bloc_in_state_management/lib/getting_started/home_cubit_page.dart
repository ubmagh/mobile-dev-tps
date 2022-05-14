
import 'package:bloc_in_state_management/getting_started/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitExamplePage extends StatelessWidget{
  const CubitExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Cubit example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
              builder: (context,state){
                return Text("Value => $state",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18));
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                  context.read<CounterCubit>().increment();
              }, child: const Text("Increment +")),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                context.read<CounterCubit>().decrement();
              }, child: const Text("Decrement -"))
            ],
          )
        ],
      ),
    );
  }
}
