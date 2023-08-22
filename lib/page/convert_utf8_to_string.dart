import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import "package:hex/hex.dart";

class ConvertUnicodeToString extends StatefulWidget {
  const ConvertUnicodeToString({Key? key}) : super(key: key);

  @override
  State<ConvertUnicodeToString> createState() => _ConvertUnicodeToStringState();
}

class _ConvertUnicodeToStringState extends State<ConvertUnicodeToString> {
  late final TextEditingController _textEditController1;
  late final TextEditingController _textEditController2;


  @override
  void initState() {
    super.initState();
    _textEditController1 = TextEditingController();
    _textEditController2 = TextEditingController();
    //\uc644\ub8cc
    // var message = "완료";
    _textEditController1.text = "\uc644\ub8cc";
  }
  @override
  void dispose() {
    _textEditController2.dispose();
    _textEditController1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("유니코드",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1.0 ,
                                fontWeight: FontWeight.w500,

                              )
                            ),
          TextField(
            controller: _textEditController1,
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),

          Row(
            children: [
              ElevatedButton(onPressed: () {
                  Clipboard.setData( ClipboardData(text: _textEditController1.text));

              },
                  child: Text("복사")),
              ElevatedButton(onPressed: () {
                final unicode = _textEditController1.text;

                String replace = unicode.replaceAll("\\\\", "\\");
                _textEditController2.text = replace;




                // // print(unicode);
                // //
                // // Uint8List strList = utf8.encode(unicode) as Uint8List;
                // // print(strList);
                //
                // List<int> bytes = utf8.encode(unicode);
                // print(bytes);
                //
                // final string = utf8.decode(bytes);
                // print(string);






               // _textEditController2.text = body;

              },
                  child: Text("변환")),
            ],
          ),


          TextField(
            controller: _textEditController2,
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                Clipboard.setData( ClipboardData(text: _textEditController2.text));
              },
                  child: Text("복사")),
              ElevatedButton(onPressed: () {

              },
                  child: Text("변환")),
            ],
          ),
        ],
      )
    );
  }


}
