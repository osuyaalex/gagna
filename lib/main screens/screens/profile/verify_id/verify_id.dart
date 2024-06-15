import 'dart:io';
import 'dart:math';
import 'package:gagna/start%20screen/widgets/elevated_button.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerifyID extends StatefulWidget {
  const VerifyID({super.key});

  @override
  State<VerifyID> createState() => _VerifyIDState();
}

class _VerifyIDState extends State<VerifyID> {
  File? _file;
  String? _extension;
  String? _fileName;
  String? _size;

  String formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const int k = 1024;
    const List<String> sizes = ["B", "KB", "MB", "GB", "TB"];
    int i = (log(bytes) / log(k)).floor();
    return ((bytes / pow(k, i)).toStringAsFixed(2)) + ' ' + sizes[i];
  }
  _pickFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['png','pdf', 'jpg'],
    );
    if(result != null){
      File file = File(result.files.single.path!);
      setState(() {
        _fileName = path.basenameWithoutExtension(file.path);
        _file = file;
        _extension = result.files.single.extension!;
        _size = formatFileSize(file.lengthSync());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    String cutUnwantedPart(String name) {
      if (name.length > 15) {
        return name.trim().replaceRange(15, null, '...');
      }
      return name;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('ID Type'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width*0.12,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.01),
                  contentPadding:const EdgeInsets.only(top: 5, left: 10),
                  hintStyle: const TextStyle(
                      fontSize: 12.5
                  ),
                  hintText: 'Select ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:  BorderSide(
                          color: Colors.grey.shade400
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:  BorderSide(
                          color: Colors.grey.shade400
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide:  BorderSide(
                          color: Colors.grey.shade400
                      )
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                          color: Colors.grey.shade400
                      )
                  ),
                ),
                items: ['Passport','Drivers Licence','voters card'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
        
                  });
                },
              ),
            ),
            SizedBox(height: 25,),
            _file == null?
            GestureDetector(
              onTap: _pickFile,
                child: SvgPicture.asset('assets/Group 35120.svg')
            ):
            SizedBox(
              height: MediaQuery.of(context).size.width*0.17,
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                ),
                elevation: 5,
                shadowColor: Color(0xff005E5E),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 13,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: SvgPicture.asset('assets/document.svg'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(cutUnwantedPart(_fileName!),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700
                                    ),
                                    ),
                                    Text(_extension!,
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                    )
                                  ],
                                ),
                                Text(_size!)
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _fileName = null;
                              _file = null;
                              _extension = null;
                              _size = null;
                            });
                          },
                            child: SvgPicture.asset('assets/trash.svg')
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
            SizedBox(height: 60,),
            Button(
                buttonColor: Color(0xff005E5E),
                text: 'Verify',
                onPressed: (){},
                textColor: Colors.white,
                width: MediaQuery.of(context).size.width,
                minSize: false,
                textOrIndicator: false
            )
          ],
        ),
      ),
    );
  }
}
