import 'package:flutter/material.dart';
import 'package:firstapp/gg.dart';

void main() {
  runApp(const UpdatePage());
}

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ตารางงานของฉัน',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UpdateMyHomePage(title: 'ตารางงานของฉัน'),
    );
  }
}

class UpdateMyHomePage extends StatefulWidget {
  const UpdateMyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _UpdateMyHomePageState createState() => _UpdateMyHomePageState();
}

class _UpdateMyHomePageState extends State<UpdateMyHomePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFCA79),
        title: Align(
          alignment: Alignment.center,
          child: Text(widget.title),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 223, 192),
      body: Center(
        child: Container(
          width: 400,
          height: 230,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'ชื่อตารางงาน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('วันเริ่มต้น')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('วันครบกำหนด')],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropdownButton<String>(
                            value: selectedValue,
                            items: [
                              DropdownMenuItem<String>(
                                value: 'กำลังทำ',
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('กำลังทำ'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'แก้ไข',
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('แก้ไข'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'เสร็จสิ้น',
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('เสร็จสิ้น'),
                                  ],
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10), // เพิ่มระยะห่าง 10 px
                              ElevatedButton(
                                onPressed: () {
                                  // กระทำเมื่อปุ่ม "แก้ไข" ถูกกด
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  elevation: 5,
                                ),
                                child: Text('แก้ไข'),
                              ),
                              SizedBox(width: 10), // เพิ่มระยะห่าง 10 px
                              ElevatedButton(
                                onPressed: () {
                                  // กระทำเมื่อปุ่ม "ลบ" ถูกกด
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // กระทำเมื่อปุ่ม "สร้างตารางงาน" ถูกกด
        },
        tooltip: 'สร้างตารางงาน',
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
