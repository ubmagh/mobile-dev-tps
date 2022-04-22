import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/github_state.dart';

class GitHubUsers extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = "ubmagh";

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
                Consumer<GithubDataProvider>(
                  builder: (context, state, child) => IconButton(
                    onPressed: () {
                      state.searchGithubUser(textEditingController.text);
                    },
                    icon: const Icon(Icons.search, color: Colors.deepOrange),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 20),
                child: Consumer<GithubDataProvider>(
                  builder: (context, state, child) {
                    var users = state.data;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(users[index]["avatar_url"]!),
                              ),
                              title: Text(users[index]["login"]!),
                              trailing: IconButton(
                                  icon: const Icon(Icons.add_link),
                                  color: Colors.indigo,
                                  onPressed: () async {
                                    state.setUsername(users[index]["login"]!);
                                    state.setUrl(users[index]["html_url"]!);
                                    Navigator.pushNamed(
                                        context, "/viewGithubProfile");
                                  }),
                            ),
                          ),
                        );
                      },
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
