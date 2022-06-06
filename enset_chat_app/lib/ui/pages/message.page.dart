import 'package:enset_chat_app/blocs/message/message.bloc.dart';
import 'package:enset_chat_app/blocs/message/message.state.dart';
import 'package:enset_chat_app/blocs/message/messages.event.dart';
import 'package:enset_chat_app/enums/requestState.enum.dart';
import 'package:enset_chat_app/models/contact.model.dart';
import 'package:enset_chat_app/models/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute
        .of(context)!
        .settings
        .arguments as Contact;

    TextEditingController editingController=TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: Center(
        child:
        BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
          if (state.requestState == RequestState.Loading) {
            return const CircularProgressIndicator();
          } else if (state.requestState == RequestState.Loaded) {
            return Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(
                                    margin:(state.messages[index].sent==true)?const EdgeInsets.only(left: 40, right:0) :const EdgeInsets.only(right: 40, left: 0),
                                    padding: const EdgeInsets.all(20),
                                    color: (state.messages[index].sent==true)?Colors.lightGreenAccent:Colors.orange[50],
                                    foregroundDecoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Text(state.messages[index].content,
                                    )),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.black, thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            controller: editingController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    )
                                )
                            ),
                          )
                      ),
                      IconButton(
                          onPressed: () {
                            Message message=Message(
                                id: 213,
                                idContact: contact.id,
                                content: editingController.text,
                                sent: true
                            );
                            context.read<MessageBloc>().add(NewMessageEvent(message: message));
                          },
                          icon:
                          const Icon(Icons.send, color: Colors.green))
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Title(
                      color: Colors.red,
                      child:
                      const Icon(Icons.error, size: 70, color: Colors.purple)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 17.0),
                    child: Center(
                        child: Title(
                            color: Colors.red,
                            child: Text(state.errorMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100,
                                  shadows: [
                                    Shadow(
                                        color: Colors.deepPurple,
                                        offset: Offset(2, 13),
                                        blurRadius: 20)
                                  ],
                                )))),
                  ),
                  IconButton(
                      onPressed: () {
                        MessageBloc messageBloc = context.read<MessageBloc>();
                        context.read<MessageBloc>().add(state.currentEvent);
                      },
                      icon: const Icon(Icons.refresh),
                      color: Colors.deepPurple,
                      iconSize: 28)
                ],
              ));
        }),
      ),
    );
  }
}
