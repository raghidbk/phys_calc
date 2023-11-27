import 'package:flutter/material.dart';

class distpage extends StatefulWidget {
  const distpage({super.key});

  @override
  State<distpage> createState() => _distpageState();
}

class _distpageState extends State<distpage> {
  double dist = 0;
  String result = 'Distance Calculator';
  final TextEditingController _controllerVeloi = TextEditingController();
  final TextEditingController _controllerAcc = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();

  String distance(){
    double veloi = double.parse(_controllerVeloi.text.toString());
    double acc = double.parse(_controllerAcc.text.toString());
    double time = double.parse(_controllerTime.text.toString());
      if (veloi < 0 || acc < 0 || time < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The values cannot be negative')));
      }else{
        dist = (veloi * time) + (1 / 2) * (acc * (time * 2));
        return 'The distance is: $dist';
      }
    return result;
  }

  @override
  void dispose() {
    _controllerVeloi.dispose();
    _controllerAcc.dispose();
    _controllerTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              result = distance();
            });
          }, icon: const Icon(Icons.calculate))
        ],
      ),
      body:Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(width: 200, child:
            TextField(controller: _controllerVeloi, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the initial velocity')),),
            const SizedBox(height: 10),
            SizedBox(width: 200, child:
            TextField(controller: _controllerAcc, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the acceleration')),),
            const SizedBox(height: 10),
            SizedBox(width: 200, child:
            TextField(controller: _controllerTime, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the time')),),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Icon(Icons.navigate_before))
          ],
        )
      )
    );
  }
}
