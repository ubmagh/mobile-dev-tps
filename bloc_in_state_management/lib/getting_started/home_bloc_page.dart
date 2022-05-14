
import 'package:bloc_in_state_management/getting_started/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExamplePage extends StatelessWidget{
  const BlocExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("bloc example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state){
                return Text("Value => ${state.counterValue}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18));
              }),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(CounterIncrementEvent());
              }, child: const Text("Increment +")),
              const SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(CounterDecrementEvent());
              }, child: const Text("Decrement -"))
            ],
          )
        ],
      ),
    );
  }
}
