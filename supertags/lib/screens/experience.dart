// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform, sleep;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:logging/logging.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:ndef/utilities.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../ndef_record/raw_record_setting.dart';
import '../ndef_record/text_record_setting.dart';
import '../ndef_record/uri_record_setting.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceScreen>
    with SingleTickerProviderStateMixin {
  String _platformVersion = '';
  NFCAvailability _availability = NFCAvailability.not_supported;
  NFCTag? _tag;
  String? _result, _writeResult, _mifareResult;
  late TabController _tabController;
  List<ndef.NDEFRecord>? _records;
  final apiUrl = "https://2cd6-14-195-9-98.ngrok-free.app/api/v1.0/delegateTagRegistration";

  Future<void> sendBasePostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json", "ngrok-skip-browser-warning": "true"},
        body: jsonEncode({
          "data": {
            "creatorAddress": "0xFd5C29df337762340283701728Ff541E22a61850",
            "metadataUrl": "ipfs://bafkreihnxpn26cos65wg65kj7nozturprpxsux557tgncyvzr2woixmw44"
          },
          "network": "basegoerli"
        }));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> sendzkEVMPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json", "ngrok-skip-browser-warning": "true"},
        body: jsonEncode({
          "data": {
            "creatorAddress": "0xFd5C29df337762340283701728Ff541E22a61850",
            "metadataUrl": "ipfs://bafkreihnxpn26cos65wg65kj7nozturprpxsux557tgncyvzr2woixmw44"
          },
          "network": "zkevmtest"
        }));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> sendScrollPostRequest() async {
    var response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json", "ngrok-skip-browser-warning": "true"},
        body: jsonEncode({
          "data": {
            "creatorAddress": "0xFd5C29df337762340283701728Ff541E22a61850",
            "metadataUrl": "ipfs://bafkreihnxpn26cos65wg65kj7nozturprpxsux557tgncyvzr2woixmw44"
          },
          "network": "scrollsepolia"
        }));

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _platformVersion =
          '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';
    } else {
      _platformVersion = 'Web';
    }
    initPlatformState();
    _tabController = TabController(length: 2, vsync: this);
    _records = [];
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    NFCAvailability availability;
    try {
      availability = await FlutterNfcKit.nfcAvailability;
    } on PlatformException {
      availability = NFCAvailability.not_supported;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
      _availability = availability;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('SuperTags'),
            backgroundColor: Colors.amber,
            bottom: TabBar(
              tabs: const <Widget>[
                Tab(text: 'Scan/Register'),
                Tab(text: 'Upload'),
              ],
              controller: _tabController,
            )),
        body: TabBarView(controller: _tabController, children: <Widget>[
          Scrollbar(
              child: SingleChildScrollView(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          const SizedBox(height: 20),
                          Text('Running on: $_platformVersion\nNFC: $_availability'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                NFCTag tag = await FlutterNfcKit.poll();
                                setState(() {
                                  _tag = tag;
                                });
                                await FlutterNfcKit.setIosAlertMessage(
                                    "Working on it...");
                                _mifareResult = null;
                                if (tag.standard == "ISO 14443-4 (Type B)") {
                                  String result1 =
                                      await FlutterNfcKit.transceive("00B0950000");
                                  String result2 = await FlutterNfcKit.transceive(
                                      "00A4040009A00000000386980701");
                                  setState(() {
                                    _result = '1: $result1\n2: $result2\n';
                                  });
                                } else if (tag.type == NFCTagType.iso18092) {
                                  String result1 =
                                      await FlutterNfcKit.transceive("060080080100");
                                  setState(() {
                                    _result = '1: $result1\n';
                                  });
                                } else if (tag.ndefAvailable ?? false) {
                                  var ndefRecords = await FlutterNfcKit.readNDEFRecords();
                                  var ndefString = '';
                                  for (int i = 0; i < ndefRecords.length; i++) {
                                    ndefString += '${i + 1}: ${ndefRecords[i]}\n';
                                  }
                                  setState(() {
                                    _result = ndefString;
                                  });
                                } else if (tag.type == NFCTagType.webusb) {
                                  var r = await FlutterNfcKit.transceive(
                                      "00A4040006D27600012401");
                                  print(r);
                                }
                              } catch (e) {
                                setState(() {
                                  _result = 'error: $e';
                                });
                              }

                              // Pretend that we are working
                              if (!kIsWeb) sleep(const Duration(seconds: 1));
                              await FlutterNfcKit.finish(iosAlertMessage: "Finished!");
                            },
                            child: const Text('Scan SuperTag'),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: _tag != null
                                  ? Text(
                                      'SuperTag ID: ${_tag!.id}\n\nTag Data:\nStandard: ${_tag!.standard}\nType: ${_tag!.type}\nTag Writable: ${_tag!.ndefWritable}\nTag Can Make Read Only: ${_tag!.ndefCanMakeReadOnly}\nTag Capacity: ${_tag!.ndefCapacity}\n\nScan Result:\n${getExperienceURL(_result!)}\n\n', style: const TextStyle(fontSize: 16),)
                                  : const Text('No SuperTags scanned yet.')),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Starting Registration...", style:TextStyle(letterSpacing: 1,fontSize: 24,color: Colors.black)),
                                    content: const Text("Choose The Blockchain Network for Minting the NFT", style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.normal,fontSize: 18,color: Colors.black)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          await sendBasePostRequest();
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.blue,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("Base", style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await sendzkEVMPostRequest();
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.blue,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("zkEVM", style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await sendScrollPostRequest();
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.blue,
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("Scroll",style:TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(
                                    5,
                                    5,
                                    5,
                                    5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Register SuperTag',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                        ])))),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          if (_records!.isNotEmpty) {
                            try {
                              NFCTag tag = await FlutterNfcKit.poll();
                              setState(() {
                                _tag = tag;
                              });
                              if (tag.type == NFCTagType.mifare_ultralight ||
                                  tag.type == NFCTagType.mifare_classic ||
                                  tag.type == NFCTagType.iso15693) {
                                await FlutterNfcKit.writeNDEFRecords(_records!);
                                setState(() {
                                  _writeResult = 'OK';
                                });
                              } else {
                                setState(() {
                                  _writeResult =
                                      'error: NDEF not supported: ${tag.type}';
                                });
                              }
                            } catch (e, stacktrace) {
                              setState(() {
                                _writeResult = 'error: $e';
                              });
                              print(stacktrace);
                            } finally {
                              await FlutterNfcKit.finish();
                            }
                          } else {
                            setState(() {
                              _writeResult = 'error: No record';
                            });
                          }
                        },
                        child: const Text("Upload", style: TextStyle(fontSize: 18),),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                    title: const Text("Choose your Experience Type", style: TextStyle(fontSize: 24)),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        child: const Text("Enter the NFT ID", style: TextStyle(fontSize: 18)),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          final result = await Navigator.push(
                                              context, MaterialPageRoute(
                                                  builder: (context) {
                                            return NDEFUriRecordSetting();
                                          }));
                                          if (result != null) {
                                            if (result is ndef.UriRecord) {
                                              setState(() {
                                                _records!.add(result);
                                              });
                                            }
                                          }
                                        },
                                      ),
                                    ]);
                              });
                        },
                        child: const Text("Define Experience", style: TextStyle(fontSize: 18),),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('Result: $_writeResult'),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 1,
                    child: ListView(
                        shrinkWrap: true,
                        children: List<Widget>.generate(
                            _records!.length,
                            (index) => GestureDetector(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          'id:${_records![index].idString}\ntnf:${_records![index].tnf}\ntype:${_records![index].type?.toHexString()}\npayload:${_records![index].payload?.toHexString()}\n')),
                                  onTap: () async {
                                    final result = await Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return NDEFRecordSetting(
                                          record: _records![index]);
                                    }));
                                    if (result != null) {
                                      if (result is ndef.NDEFRecord) {
                                        setState(() {
                                          _records![index] = result;
                                        });
                                      } else if (result is String &&
                                          result == "Delete") {
                                        _records!.removeAt(index);
                                      }
                                    }
                                  },
                                ))),
                  ),
                ]),
          )
        ]),
      ),
    );

  }

  String getExperienceURL(String result){
    var parts = result.split('uri=');
    var prefix = parts[0].trim();                 // prefix: "date"
    var uri = parts.sublist(1).join('uri=').trim();
    return uri;
  }

}
