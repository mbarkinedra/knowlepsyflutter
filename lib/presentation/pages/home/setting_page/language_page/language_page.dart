import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowplesy/app/config/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button.dart';
import 'package:knowplesy/app/widget/custom_input.dart';
import 'package:knowplesy/app/widget/custom_setting.dart';
enum SingingCharacter { English, French }
class LanguagePage extends StatelessWidget {
  // const LanguagePage({Key? key}) : super(key: key);
  SingingCharacter? lan = SingingCharacter.English;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Spacer(),
                    Text("Language",
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                    Spacer(),
                  ],
                )),
            SizedBox(height: 20,),
            ListTile(dense: true,
              onTap: () {
              lan=SingingCharacter.English;
              },

              leading: Text("English",style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Radio(
                value: SingingCharacter.English,
                groupValue: lan,
                activeColor: Colors.green,
                onChanged: (SingingCharacter? value) {
                  lan = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left: 20),
              child: Divider(thickness: 1,color: Colors.grey,),
            )
         ,    ListTile(dense: true,
              onTap: () {
           lan=SingingCharacter.French;
              },

              leading: Text("French",style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Radio(
                value: SingingCharacter.French,
                groupValue: lan,
                activeColor:Colors.green,
                onChanged: (SingingCharacter? value) {
                  lan = value!;
                },
              ),
            ), ],
        ),
      ),
    );
  }
}
