import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/covid_state.dart';

class Covid extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  Covid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textEditingController.text = "Morocco";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid-19 stats per country"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Consumer<CovidDataProvider>(
                      builder: (context, state, child) => TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          state.setKeyword(value);
                          state.searchCountry();
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    )),
                Expanded(
                    child: Consumer<CovidDataProvider>(
                  builder: (context, state, child) => IconButton(
                    onPressed: () {
                      state.getStats();
                    },
                    icon: const Icon(Icons.refresh, color: Colors.deepOrange),
                  ),
                )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 20),
                child: Consumer<CovidDataProvider>(
                  builder: (context, state, child) {
                    var stats = state.stats;
                    return ListView.builder(
                      itemCount: stats == null ? 0 : stats.length,
                      itemBuilder: (context, index) {
                        String country =
                                stats[index]["All"]["country"].toString(),
                            confirmed =
                                stats[index]["All"]["confirmed"].toString(),
                            recovered =
                                stats[index]["All"]["recovered"].toString(),
                            deaths = stats[index]["All"]["deaths"].toString(),
                            abbreviation = stats[index]["All"]["abbreviation"]
                                .toString()
                                .toLowerCase(),
                            updated = stats[index]["All"]["updated"]
                                .toString()
                                .toLowerCase();

                        updated = updated.split(" ")[0];

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: ListTile(
                                  leading: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minWidth: 44,
                                      minHeight: 44,
                                      maxWidth: 50,
                                      maxHeight: 50,
                                    ),
                                    child: Image.asset(
                                        'icons/flags/png/' +
                                            abbreviation +
                                            '.png',
                                        package: 'country_icons',
                                        fit: BoxFit.cover),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, top: 4),
                                    child: Title(
                                        title: country,
                                        child: Text(country,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        color: Colors.black),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    "Confirmed : " + confirmed,
                                                    style: const TextStyle(
                                                        color: Colors.orange))),
                                            Expanded(
                                                child: Text(
                                                    "Recovered : " + recovered,
                                                    style: const TextStyle(
                                                        color: Colors.green))),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    "Deaths : " + deaths,
                                                    style: const TextStyle(
                                                        color: Colors.red)))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Wrap(children: [
                                              const Text("Updated : "),
                                              Text(updated,
                                                  style: const TextStyle(
                                                      color: Colors.deepPurple))
                                            ]))
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
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
