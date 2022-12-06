import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../common/common_text_feild.dart';

class VoucherForm extends StatefulWidget {
  const VoucherForm({Key? key}) : super(key: key);

  @override
  State<VoucherForm> createState() => _VoucherFormState();
}

class _VoucherFormState extends State<VoucherForm> {
  TextEditingController barController =TextEditingController();
  TextEditingController vocController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController remarksController =TextEditingController();
  TextEditingController lineNoController =TextEditingController();
  TextEditingController accountCodeController =TextEditingController();
  TextEditingController narrationController =TextEditingController();
  TextEditingController debitController =TextEditingController();
  TextEditingController creditController =TextEditingController();
  TextEditingController otherController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  File? file;
  final List<String> voucherTypeItems = [
    'BPV',
    'CSV',
    'SPV',
  ];
  String gender="post";
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voucher Form",),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              barCodeNoField(),
              voucherNoField(),
              dateField(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Voucher type',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 50,
                //  buttonPadding: const EdgeInsets.only(left: 1, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: voucherTypeItems
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Select Voucher type.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Select Voucher Status"),
              ),
              RadioListTile(
                title: const Text("Post"),
                value: "post",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    debugPrint("1234554444");
                    debugPrint(value.toString());
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Unposted"),
                value: "unposted",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    debugPrint("1234554444");
                    debugPrint(value.toString());
                    gender = value.toString();
                  });
                },
              ),
              remarksField(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.black,
              ),
              lineNoField(),
              accountCodeField(),
              accountDescriptionField(),
              narrationField(),
              debitField(),
              creditField(),
              otherField(),
              picSelect(),
            Center(
              child: ElevatedButton(onPressed: () {
    if (_formKey.currentState!.validate()) {}

              }, child: const Text("Submit"),),
            ),
            ],
          ),
        ),
      ),
    );
  }
  Widget barCodeNoField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'BarCode NO', textController: barController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }
        return null;}
      ),
    );
  }

  Widget voucherNoField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Voucher NO', textController: vocController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget lineNoField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Line NO', textController: lineNoController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget accountCodeField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Account NO', textController: accountCodeController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget accountDescriptionField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Account Description', textController: accountCodeController,type: TextInputType.multiline,maxlines: 4,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget narrationField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Write Narration', textController: narrationController,type: TextInputType.multiline,maxlines: 4,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget debitField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Debit amount', textController: debitController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget creditField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Credit amount', textController: creditController,type: TextInputType.number,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget remarksField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Remarks', textController: remarksController,type: TextInputType.text,maxlines: 4,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget otherField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'Other information', textController: otherController,type: TextInputType.text,maxlines: 4,validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget dateField(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CsCommonTextFieldWidget(hintText: 'select date', textController: dateController,type: TextInputType.none,onTab: () async {
        FocusScope.of(context).unfocus();
          final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101));
          if (picked != null && picked != selectedDate) {
            setState(() {
              selectedDate = picked;
              debugPrint("1234554444");
              debugPrint(picked.toString());
              debugPrint(selectedDate.toString());
              dateController.text=selectedDate.toString().substring(0,11);
              debugPrint("dateController.text");
              debugPrint(dateController.text);
            });
          }

      },validator: (str) {
        if (str!.isEmpty) {
          return 'required';
        }}
      ),
    );
  }
  Widget picSelect(){
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
           file = File(result.files.single.path!);
           setState(() {

           });
        } else {
          // User canceled the picker
        }
      },
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 1.6),
              borderRadius: BorderRadius.circular(10)
            ),
            child:

            Column(
              children: const [
                 Icon(Icons.add),
                Text("Attach")
              ],
            )
          ),
          file==null ? Container() :
          Container(
            alignment: Alignment.center,
          //  padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.symmetric(horizontal: 15)+const EdgeInsets.only(bottom: 10),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 1.6),
              borderRadius: BorderRadius.circular(10)
            ),
            child:
            Image.file(file!,fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }

}
