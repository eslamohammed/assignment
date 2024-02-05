

import 'package:ass_project/src/features/search_in_api_data/presentation/Screen/search.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../../core/widget/primaryButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("To start the flow Please Click here",
            textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.08,
                fontFamily: AppStrings.fontFamily2,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal
                ),
            ),
            const SizedBox(height: 50,),
            PrimaryButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage()));
              },
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(colors:
              [
                AppColors.primaryUp,
                AppColors.primaryDown
              ]), 
              child: const Text("click here",
               textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.08,
                  fontFamily: AppStrings.fontFamily2,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal
                  ),
                  ),
            )
          ],
        ),
      )
    );
  }
}