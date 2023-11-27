import 'package:flutter/material.dart';

class distance extends StatefulWidget {
  const distance({super.key});

  @override
  State<distance> createState() => _distanceState();
}


class _distanceState extends State<distance> {
  final TextEditingController _controllertime = TextEditingController();
  final TextEditingController _controllervelo = TextEditingController();
  String result = 'enter the variables needed';

  @override
  void dispose() {
    _controllertime.dispose();
    _controllervelo.dispose();
    super.dispose();
  }


  String Fdisp({disp,velo,time}) {
  double time = double.parse(_controllertime.text.toString());
  double velo = double.parse(_controllervelo.text.toString());

    if (velo < 0 || time < 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The values cannot be negative')));
      return 'the value cant be determend ';
    } else{
      disp = velo * time;
      return 'the dipslasment is $disp the velocity is $velo and the time is $time ';
    }


  } //displacement logic


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              result = Fdisp();

            });
          }, icon: Icon(Icons.calculate))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: _controllertime, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter time ment is not enter 0'
              ),),
            ),
            SizedBox(height: 10.0,),
            SizedBox(width: 300.0,
              child: TextField(
                controller: _controllervelo, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter velocity ment is not enter 0'
              ),),
            ),
            SizedBox(height: 20.0,),
        ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Icon(Icons.navigate_before))
          ],
        ),
      ),
    );
  }
}