import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/client_regis_controller.dart';
import '../controllers/district_controller.dart';
import '../controllers/state_controller.dart';
import '../models/district_model.dart';
import '../models/state_model.dart';
import '../res/components/round_button.dart';

class ClientRegistrationScreen extends StatefulWidget {
  const ClientRegistrationScreen({super.key});

  @override
  State<ClientRegistrationScreen> createState() =>
      _ClientRegistrationScreenState();
}

Data? selectedValue;
Data? selectValue;

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen> {
  bool isChecked = false;

  // var checkedResult = 'Checkbox is CHECKED';
  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        //  checkedResult = 'Checkbox is CHECKED';
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        //checkedResult = 'Checkbox is UN-CHECKED';
      });
    }
  }

  String? clientName;
  String? mobileNo;
  String? emailid;
  String? courtName;
  String? address;
  String? adddate;
  String? stateid;
  String? districtid;
  String? city;
  String? firno;
  String? policeStationName;
  String? caseTitle;

  final stateCr = Get.put(StateController());
  final districtController = Get.put(DistrictController());
  final clientRegisCr = Get.put(ClientRegisController());

  final clientNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailidController = TextEditingController();
  final courtNameController = TextEditingController();
  final adddateCourtController = TextEditingController();
  final addressController = TextEditingController();
  final stateidController = TextEditingController();
  final districtidController = TextEditingController();
  final cityController = TextEditingController();
  final firnoController = TextEditingController();
  final policeStationNameController = TextEditingController();
  final caseTitleController = TextEditingController();

  late DateTime pickedDate;
  late TimeOfDay time;
  final isLoding = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateCr.stateData();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    final heigh = MediaQuery.of(context).size.height * 1;
    final widt = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: const Color(0xFFEBEDF0),
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
            ),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close,
                  size: 35,
                  color: Colors.white,
                )),
          ),
        ],
        automaticallyImplyLeading: false,

        //backgroundColor: const Color(0xFF1E336A),
        title: const Text(
          'Client Registration information',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: heigh * 0.02),

              const Row(
                children: [
                  Text(
                    'Case Category',
                    //textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(height: heigh * 0.02),

              //  SizedBox(height: heigh * 0.02),

              Obx(
                () => Visibility(
                  visible: stateCr.StateList != null,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: selectedValue,
                      hint: const Text('Case Category'),
                      // ignore: invalid_use_of_protected_member
                      items: stateCr.StateList?.value.map((Dumo items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items.name.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          stateid = val.toString();
                          // districtController.districtData(val);
                        });
                      }),
                ),
              ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  //  controller: licensenoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a Licences Number";
                    } else if (!RegExp(
                            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                        .hasMatch(value)) {
                      return "Please Enter a Valid Licences Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Date'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              // FormField<String>(
              //   builder: (FormFieldState<String> state) {
              //     return InputDecorator(
              //       decoration: const InputDecoration(
              //         // labelText: 'Label text',
              //         // labelStyle: TextStyle(
              //         //   color: Color(0xFF6200EE),
              //         // ),
              //         contentPadding:
              //             EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              //         filled: true,
              //         fillColor: Colors.white,
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //           borderSide: BorderSide(color: Colors.white),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //           borderSide: BorderSide(color: Colors.white),
              //         ),
              //       ),
              //       child: DropdownButtonHideUnderline(
              //         child: DropdownButton<String>(
              //           hint: Text("Select Device"),
              //           value: currentSelectedValue,
              //           isDense: true,
              //           onChanged: (newValue) {
              //             setState(() {
              //               currentSelectedValue = newValue;
              //             });
              //             print(currentSelectedValue);
              //           },
              //           items: stateCr.StateList?.value.map((Dumo items) {
              //             return DropdownMenuItem<String>(
              //               value: items.name,
              //               child: Text(items.name.toString()),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: courtNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      //return "Please Enter a PracticeCourName";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid PracticeCourName";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'CourtName'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),

              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a Address";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Address'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: heigh * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: widt * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Color(0xFF1E336A)),
                    ),
                    child: ListTile(
                      title: Text(
                        "Date: ${pickedDate.year}/${pickedDate.month}/${pickedDate.day}",
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      // contentPadding: EdgeInsets.only(top: 0.2, bottom: 0.1),
                      dense: true,
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: _pickDate,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: widt * 0.40,
                    //padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      //border: Border.all(color: Color(0xFF1E336A)),
                    ),
                    child: ListTile(
                      title: Text(
                        "Time: ${time.hour}:${time.minute}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      dense: true,
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: _pickTime,
                    ),
                  ),
                ],
              ),
              SizedBox(height: heigh * 0.02),

              Obx(
                () => Visibility(
                  visible: stateCr.StateList != null,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      value: selectedValue,
                      hint: const Text('Select value'),
                      // ignore: invalid_use_of_protected_member
                      items: stateCr.StateList?.value.map((Dumo items) {
                        return DropdownMenuItem(
                          value: items.id,
                          child: Text(items.name.toString()),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          stateid = val.toString();
                          districtController.districtData(val);
                        });
                      }),
                ),
              ),
              SizedBox(height: heigh * 0.02),

              Obx(
                () => Visibility(
                  visible: districtController.districtList != null,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: const BorderSide(),
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: selectValue,
                    hint: const Text('Select value'),
                    // ignore: invalid_use_of_protected_member
                    items: districtController.districtList?.value.map((items) {
                      return DropdownMenuItem(
                        value: items.id,
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        districtid = val.toString();
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: heigh * 0.02),

              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: firnoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a City";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid FIR No";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'FIR No'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: policeStationNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a City";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid Police station";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Police station'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: heigh * 0.02),

              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: caseTitleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a City";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid Details";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'CaseTitle'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.text,
                ),
              ),

              SizedBox(height: heigh * 0.02),
              const Row(
                children: [
                  Text(
                    'Personal Details',
                    //textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: clientNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a Advocate Name";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid Advocate Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Name'.tr,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    //border: InputBorder.none,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              // ),

              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: mobileNoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      //return "Please Enter a Phone Number";
                    } else if (!RegExp(
                            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                        .hasMatch(value)) {
                      return "Please Enter a Valid Phone Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text(
                        'Mobile No'.tr,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixText: '+91 ',
                      prefixStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.phone,
                ),
              ),
              // Card(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              //   child: Form(
              //     autovalidateMode: AutovalidateMode.always,
              //     child: TextFormField(
              //       //controller: mobileController,
              //       validator: (value) {
              //         if (value!.isEmpty) {
              //           //return "Please Enter a Phone Number";
              //         } else if (!RegExp(
              //                 r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
              //             .hasMatch(value)) {
              //           return "Please Enter a Valid Phone Number";
              //         }
              //         return null;
              //       },
              //       decoration: InputDecoration(
              //           label: Text(
              //             'Mobile'.tr,
              //           ),
              //           filled: true,
              //           fillColor: Colors.white,
              //           contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //             borderSide: BorderSide(color: Colors.white),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(8.0)),
              //             borderSide: BorderSide(color: Colors.white),
              //           ),
              //           prefixText: '+91 ',
              //           prefixStyle: const TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold)),
              //       keyboardType: TextInputType.phone,
              //     ),
              //   ),
              // ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: emailidController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      ///return "Please Enter a Email id";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Please Enter a Valid Email id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Email id'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: cityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a City";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid City";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'City'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: heigh * 0.02),
              Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // return "Please Enter a Address";
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please Enter a Valid Address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Address'.tr,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(height: heigh * 0.02),

              InkWell(
                onTap: () {
                  toggleCheckbox(isChecked);
                },
                child: Row(
                  children: [
                    //Icon(Icons.check_box),
                    Transform.scale(
                      scale: 1,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          toggleCheckbox(value!);
                        },
                        activeColor: const Color(0xFF00bbf2),
                        checkColor: Colors.white,
                        tristate: false,
                      ),
                    ),

                    const Text(
                      "I Accept terms & Conditions",
                      //"${checkedResult}",
                      style: TextStyle(
                          fontSize: 16,
                          //color: Color(0xFF1E336A),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: heigh * .02),

              ////////////////////Button///////////
              Obx(
                () => RoundButton(
                  height: 50,
                  width: 250,
                  title: 'Submit'.tr,
                  loading: clientRegisCr.loading.value,
                  //onPress: () => Get.to(() => const ClientsScreen()),
                  onPress: () {
                    final clientName = clientNameController.text;
                    final mobileNo = mobileNoController.text;
                    final emailid = emailidController.text;
                    final courtName = courtNameController.text;
                    final adddate = adddateCourtController.text;
                    final address = addressController.text;
                    // final stateidController
                    // final districtidController
                    final city = cityController.text;
                    final firno = firnoController.text;
                    final policeStationName = policeStationNameController.text;
                    final caseTitle = caseTitleController.text;

                    mobileNoController.clear();
                    emailidController.clear();
                    courtNameController.clear();
                    adddateCourtController.clear();
                    addressController.clear();
                    stateidController.clear();
                    districtidController.clear();
                    cityController.clear();
                    firnoController.clear();
                    policeStationNameController.clear();
                    caseTitleController.clear();
                    clientRegisCr.clientRegis(
                        clientName,
                        mobileNo,
                        emailid,
                        courtName,
                        address,
                        adddate,
                        stateid,
                        districtid,
                        city,
                        firno,
                        policeStationName,
                        caseTitle);
                  },
                  child: const Text("data"),
                ),
              ),

              SizedBox(height: heigh * 0.05),
            ],
          ),
        ),
      ),
      //   ),
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 25),
      lastDate: DateTime(DateTime.now().year + 100),
      initialDate: pickedDate,
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay? t = await showTimePicker(context: context, initialTime: time);

    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }
}
