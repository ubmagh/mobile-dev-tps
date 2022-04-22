import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/news_state.dart';

class News extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  News({Key? key}) : super(key: key);

  String dateFormat(DateTime dateTime) {
    return dateTime.year.toString() +
        "-" +
        dateTime.month.toString() +
        "-" +
        dateTime.day.toString();
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text = "Morocco";

    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
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
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Consumer<NewsDataProvider>(
                      builder: (context, state, child) => TextButton.icon(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2006, 1, 1),
                              lastDate: DateTime(selectedDate.year,
                                  selectedDate.month, selectedDate.day));
                          if (picked != null && picked != selectedDate) {
                            state.setSelectedDate(dateFormat(picked));
                          }
                        },
                        icon: const Icon(Icons.calendar_today_outlined,
                            color: Colors.deepOrange),
                        label: Consumer<NewsDataProvider>(
                            builder: (context, value, child) =>
                                Text(value.selectedDate)),
                      ),
                    ),
                  ),
                  Consumer<NewsDataProvider>(
                    builder: (context, state, child) => IconButton(
                      onPressed: () {
                        state.searchNews(textEditingController.text);
                      },
                      icon: const Icon(Icons.search, color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 20),
                child: Consumer<NewsDataProvider>(
                  builder: (context, state, child) {
                    var news = state.data;
                    return ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        String imageUrl = news[index]["urlToImage"].toString();
                        String title = news[index]["title"].toString();
                        String url = news[index]["url"].toString();

                        return GestureDetector(
                          onTap: () async {
                            if (url.isEmpty) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Sorry! this news doesn't have any link :D",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }
                            state.setTitle(title);
                            state.setUrl(url);
                            Navigator.pushNamed(context, "/newsDetailsView");
                          },
                          child: Card(
                            color: Colors.transparent,
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imageUrl.isNotEmpty &&
                                              imageUrl != "null"
                                          ? FadeInImage.assetNetwork(
                                                  image: imageUrl,
                                                  placeholder:
                                                      "images/defaultimage.jpg")
                                              .image
                                          : Image.asset(
                                                  "images/defaultimage.jpg")
                                              .image)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    color: Colors.deepOrange,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 6, left: 5, right: 5),
                                      child: Text(title,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 17.0),
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
