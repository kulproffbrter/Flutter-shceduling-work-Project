import 'package:flutter/material.dart';
import 'package:firstapp/updateShceduling.dart';

class GGPage extends StatefulWidget {
  @override
  _GGPageState createState() => _GGPageState();
}

class _GGPageState extends State<GGPage> {
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = (await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    ))!;
    if (picked != null) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = (await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    ))!;
    if (picked != null) {
      setState(() {
        endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จัดตารางงานของคุณ'),
        backgroundColor: Color(0xFFFFCA79),
      ),
      backgroundColor: Color(0xFFFFECCF),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'ชื่องานของคุณ',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'คำอธิบายงาน',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    await _selectStartDate(context);
                    await _selectStartTime(context);
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(Icons.calendar_today),
                      SizedBox(width: 15),
                      Text(
                        'วันเริ่มต้น: ${startDate?.toString().split(' ')[0] ?? 'เลือก'} ${startTime?.format(context) ?? '00:00'}',
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    fixedSize: Size(300, 30), // ตั้งความกว้างและความสูงคงที่
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    await _selectEndDate(context);
                    await _selectEndTime(context);
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(Icons.calendar_today),
                      SizedBox(width: 15),
                      Text(
                        'วันครบกำหนด: ${endDate?.toString().split(' ')[0] ?? 'เลือก'} ${endTime?.format(context) ?? '00:00'}',
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    fixedSize: Size(300, 30), // ตั้งความกว้างและความสูงคงที่
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // กระบวนการเมื่อปุ่ม "บันทึก" ถูกกด
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          UpdatePage(), // เปลี่ยนเป็นหน้าหลักที่คุณต้องการไป
                    ),
                  );
                },
                child: Text(
                  'บันทึก',
                  style: TextStyle(
                    color: Colors.black, // สีตัวหนังสือเป็นสีดำ
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFCA79), // สีพื้นหลังเป็นสี 255, 202, 121
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
