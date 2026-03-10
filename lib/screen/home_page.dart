import 'package:flutter/material.dart';
import 'package:kuis_mobile_123230070_ifb/models/newsmodel.dart';
import 'package:kuis_mobile_123230070_ifb/screen/profile_page.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({super.key, required this.nama});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.contact_mail, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        title: Text(
          "News App",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: dummyNews.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                dummyNews[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.heart_broken, color: Colors.grey),
                      SizedBox(width: 10),
                      Text("${dummyNews[index].likes}"),
                    ],
                  ),
                  // ElevatedButton(
                  //   // onPressed: () {
                  //   //   setState(() {
                  //   //     dummyNews[index].isAdded = !dummyNews[index].isAdded;
                  //   //   });
                  //   // },
                  //   style: ElevatedButton.styleFrom(
                  //     side: BorderSide(
                  //       color: dummyNews[index].isAdded
                  //           ? Colors.blue
                  //           : Colors.black,
                  //     ),
                  //     backgroundColor: dummyNews[index].isAdded
                  //         ? Colors.blue
                  //         : Colors.white,
                  //   ),
                  //   child: Text(
                  //     "Tambahkan ke Daftar",
                  //     style: TextStyle(
                  //       color: dummyNews[index].isAdded
                  //           ? Colors.white
                  //           : Colors.black,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              leading: Image.network(
                dummyNews[index].image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              // trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsDetailPage(news: dummyNews[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatefulWidget {
  final NewsModel news;
  const NewsDetailPage({super.key, required this.news});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.news.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.news.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(widget.news.description),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.news.likes += 1;
                          });
                        },
                        child: Icon(Icons.heart_broken),
                      ),
                      Text(" ${widget.news.likes} Likes"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
