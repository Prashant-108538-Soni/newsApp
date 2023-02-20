import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/api_call.dart';
import 'package:news_app/setting.dart';
import 'modals/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Article> articleList;

  final List<String> items = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];


  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Colors.grey[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          itemBuilder: (BuildContext context2) => <PopupMenuEntry>[
            PopupMenuItem(
              // child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                focusColor: Colors.red,
                selectedItemHighlightColor: Colors.blueGrey[200],
                isExpanded: true,
                hint: Text(
                  'Choose Category',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  //USE BELOW STRING FOR SEARCH ACCORDING TO CATEGORY.....
                  print(value.toString());
                  Navigator.pop(context);
                  //...............
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonHeight: 40,
                buttonWidth: 140,
                itemHeight: 40,
              ),
              // ),
            ),
            PopupMenuItem(
              // value: SampleItem.itemTwo,
              child: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  Text("  Setting"),
                ],
              ),
              onTap: () async {
                final navigator = Navigator.of(context);
                await Future.delayed(Duration.zero);
                navigator.push(
                  MaterialPageRoute(builder: (_) => Setting()),
                );
              },
            ),
          ],
        ),
        //
        title: const Text("News Hunter"),
        actions: [
          IconButton(
              onPressed: () {
                //  CODE TO SEARCH TEXTFIELDS....
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder<List<Article>>(
                future: ApiCall().getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {

                    return const Center(child: Text("Loading",style: TextStyle(fontSize: 50),));
                  } else {
                    print('hi');
                    List<Article>?  articles=snapshot.data;
                    return ListView.builder(itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(articles![index].title),
                            ],
                          ),
                        ),
                      );
                    });
                  }
                }),
          )
        ],
      ),
    );
  }
}
