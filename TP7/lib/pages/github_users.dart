import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GitHubUsers extends StatefulWidget {
  @override
  State<GitHubUsers> createState() => _GitHubUsersState();
}

class _GitHubUsersState extends State<GitHubUsers> {
  var users;
  TextEditingController textEditingController = new TextEditingController();

  void searchGithubUser(userKey) {
    String url =
        "https://api.github.com/search/users?q=$userKey&per_page=10&page=0";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        users = json.decode(response.body);
      });
    }).catchError((onError) {
      print(onError);
      Fluttertoast.showToast(
          msg: "Can't query data with GitHub Api !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      textEditingController.text = "ubmagh";
      searchGithubUser("ubmagh");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.people_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchGithubUser(textEditingController.text);
                    });
                  },
                  icon: const Icon(Icons.search, color: Colors.deepOrange),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 20),
                child: ListView.builder(
                  itemCount: users == null || users["items"] == null
                      ? 0
                      : users["items"].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                users["items"][index]["avatar_url"]),
                          ),
                          title: Text(users["items"][index]["login"]),
                          trailing: IconButton(
                              icon: const Icon(Icons.add_link),
                              color: Colors.indigo,
                              onPressed: () async {
                                if (!await launch(
                                    users["items"][index]["html_url"])) {
                                  Fluttertoast.showToast(
                                      msg: "Can't open link !",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
