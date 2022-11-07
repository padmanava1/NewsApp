import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/news_app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              style:  TextStyle(
                color: NewsAppColors.accentColor,
              ),
              decoration:  InputDecoration(
                prefixIcon: GestureDetector(
                    onTap:(){
                  Navigator.of(context).pop();
                },
                    child: Icon(Icons.arrow_back_ios,color: NewsAppColors.accentColor,)),
                suffixIcon: Icon(
                  Icons.search,
                  color: NewsAppColors.accentColor,
                ),
                border: InputBorder.none,
                hintText: 'Search by keywords like tech',
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          SizedBox(
            child: Image.asset('assets/images/Screenshot 2022-11-04 at 7.39.12 PM.png'),
          )
        ],
      ),
    );
  }
}
