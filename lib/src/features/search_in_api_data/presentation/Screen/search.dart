import 'dart:convert';

import 'package:ass_project/src/core/app_colors.dart';
import 'package:ass_project/src/core/widget/customInputText.dart';
import 'package:ass_project/src/core/widget/primaryButton.dart';
import 'package:ass_project/src/features/search_in_api_data/presentation/Screen/fllow.dart';
import 'package:ass_project/src/features/search_in_api_data/presentation/Screen/searchCard.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_strings.dart';


import 'package:http/http.dart' as http;


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  final TextEditingController _field1 = TextEditingController();
  final TextEditingController _field2 = TextEditingController();

  String searchString = "";
  int filter = 0;

  
    final List<Widget> cardList = [
    SearchCard(
      designerName: "Eslam Mohammed",
      workTitle: "Graphic Designer",
      rating: 4.9,
    ),
    SearchCard(
      designerName: "Asmaa said",
      workTitle: "Graphic Designer",
      rating: 4.5,
    ),
    // Add more widgets here.
  ];


  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          toolbarHeight: 65,
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize:25,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 35,
              ),
              onPressed: ()=>{Navigator.pop(context , false),}
              ),
            ),
      body: _searchUI(context),
      //////////////////
    );
  }

  Widget _searchUI(BuildContext context){
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);
    double width = MediaQuery.of(context).size.width;
  
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20 , right: 20 , bottom: 15 , top: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.inputColor,
                          border:  Border.all(color: Colors.black26 ,width:1 ,style: BorderStyle.solid ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomInputText(
                            hintText: "feild 1",
                            controller: _field1,
                          ),
                        ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20 , right: 20 , bottom: 15 , top: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.inputColor,
                          border:  Border.all(color: Colors.black26 ,width:1 ,style: BorderStyle.solid ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomInputText(
                            hintText: "feild 2",
                            controller: _field2,
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Center(
              child: PrimaryButton(
                  onPressed: (){
                    fetchNews();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FlowPage()));
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(colors:
                  [
                    AppColors.primaryUp,
                    AppColors.primaryDown
                  ]), 
                  child: const Text("Search",
                   textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.08,
                      fontFamily: AppStrings.fontFamily2,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
          height: height*0.75,
          width: width,
          //color: Colors.blueAccent,
            child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: cardList[index],
                );
              },
            ),  
          ),
        ],
      ),
    );
  }


  Future<void> fetchNews() async {
  final String apiUrl =
      'https://newsapi.org/v2/everything?q=Apple&from=2024-02-05&sortBy=popularity&apiKey=703957b0c3b0438f97817bf3b8d682eb';

  try {
    var url =Uri.parse(apiUrl);
    // var header = {
    //   // "Authorization": "Bearer " + (prefs.getString("token") as String)
    //   "curl https://newsapi.org/v2/everything -G \-d q=Apple \-d from=2024-02-05 \-d sortBy=popularity \-d apiKey=703957b0c3b0438f97817bf3b8d682eb"
    // };

    //  Map<String, String> headers = {
    // 'Content-Type': 'application/json',};

    var response = await http.get(
      url,
      // headers: headers
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var data = jsonDecode(response.body);
      // handle success and parse the JSON data
      List<dynamic> articles = jsonResponse['articles'];
      // process the articles list
      debugPrint("${data}");
      print("${articles}");
      debugPrint("${jsonResponse}");
    } else {
      // handle error
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // handle exception
    print('Exception: $e');
  }
}
}