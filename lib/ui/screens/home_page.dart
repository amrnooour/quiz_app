import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/ui/screens/start_page.dart';
import 'package:quiz_app/ui/utils/app_assets.dart';

class HomePage extends StatelessWidget {
  static const routeName = "homePage";

  @override
  Widget build(BuildContext context) {
    QuestionController controller =Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.logo),fit: BoxFit.cover)),
                  ),
                  const Text("Testing your video Gaming knowledge",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54
                  ),),
                  const SizedBox(height: 35,),
                  Container(
                    child: TextField(
                      onChanged: (text)=>controller.userName=text,
                      decoration: InputDecoration(
                        hintText: "Enter your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    child: SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                        onPressed: ()=>  Navigator.pushNamed(context,StartPage.routeName),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("let`s Go",style: TextStyle(fontSize: 16,color: Colors.black54),),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward,color: Colors.black54,),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
