import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class languageTranslator extends StatefulWidget {
  const languageTranslator({super.key});

  @override
  State<languageTranslator> createState() => _languageTranslatorState();
}

class _languageTranslatorState extends State<languageTranslator> {
  var languages =['Hindi','English','Arabic','Urdu','French'];
  var originlanguage= "From";
  var destinationlanguage = "To";
  var output= " ";
  TextEditingController languagecontroller= TextEditingController();
  void translate(String src,String dest, String input)async{
    GoogleTranslator translator =new GoogleTranslator();
    var translation = await translator.translate(input,from: src,to: dest);
    setState(() {
      output =translation.text.toString();
    });
    if(src=='==' || dest=='=='){
      setState(() {
        output='Failed to translate';
      });
    }
  }
  String getLanguageCode(String language){
    if(language=="English"){
      return "en";
    }
    else if(language=="Hindi"){
      return "hi";
    }
    else if(language=="Arabic"){
      return "ar";
    }
    else if(language=="Urdu"){
      return "ur";
    }
    else if(language=="French"){
      return "fr";
    }
    return "==";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text('Language Translator'),
        centerTitle: true,backgroundColor: Colors.white,elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  DropdownButton(focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(
                    originlanguage,style: TextStyle(color: Colors.white),
                  ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem){
                      return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,
                      );
                    },
                  )
                    .toList(),
                    onChanged: (String? value){
                    setState(() {
                      originlanguage= value!;
                    });
                    },
                  ),
                  SizedBox(width: 40,),
                  Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 40,),
                  SizedBox(width: 40,),

                  DropdownButton(focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationlanguage,style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem){
                      return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,
                      );
                    },
                    )
                        .toList(),
                    onChanged: (String? value){
                      setState(() {
                        destinationlanguage= value!;
                      });
                    },
                  )
                ],

              ),
              SizedBox(height: 40,),
              Padding(padding:EdgeInsets.all(8),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Please Enter your text here..",
                  labelStyle:TextStyle(fontSize: 15,color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1
                    )
                  ),
                    enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 1),
                ),
                  errorStyle: TextStyle(color: Colors.red,fontSize: 15),
                ),
                controller: languagecontroller,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter text to translate';
                  }
                  return null;
                },
              ),
              ),
              Padding(padding: EdgeInsets.all(8),
               child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
               onPressed: (){
                 translate(getLanguageCode(originlanguage), getLanguageCode(destinationlanguage), languagecontroller.text.toString());
               },child: Text("Translate")),
           ),
            SizedBox(height: 20,),
           Text(
          "\n$output",
         style: TextStyle(
         color: Colors.white,
         fontWeight: FontWeight.bold,
         fontSize: 20
    ),
    )
            ],
          ),
        ),
      ),
    );
  }
}
