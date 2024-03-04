import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Widget> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10), // Adjust the height as needed
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0), // Add margin bottom
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Set shadow color
                spreadRadius: 1, // Set spread radius
                blurRadius: 5, // Set blur radius
                offset: Offset(0, 3), // Set offset
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false, // Disable back button
            title: Center(
              child: Text(
                "Task Board",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return tasks[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add(TaskWidget(tasks.length + 1, DateTime.now()));
          });
        },
        child: Icon(Icons.add, color: Colors.white), // Set plus icon color to white
        backgroundColor: Colors.black, // Set background color to black
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final int taskNumber;
  final DateTime time;

  TaskWidget(this.taskNumber, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Add margin on both left & right side
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,// Set background color to grey
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
        children: [
          Text(
            "Task $taskNumber",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            "Your Personal task management and planning solution for\nplanning your day, week & months",
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight, // Align the date-time to bottom right
            child: Text(
              "${_formatDateTime(time)}"
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String period = dateTime.hour < 12 ? 'am' : 'pm';
    String day = dateTime.day.toString().padLeft(2, '0');
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
      default:
        month = '';
    }
    String year = dateTime.year.toString();
    return '$hour:$minute $period  $day $month, $year'; // Combine time and date
  }
}
