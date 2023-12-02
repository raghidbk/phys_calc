import 'package:flutter/material.dart';

class finalPosPage extends StatefulWidget {
  const finalPosPage({super.key});

  @override
  State<finalPosPage> createState() => _finalPosPageState();
}

class _finalPosPageState extends State<finalPosPage> {
  String result = 'Final Position Calculator';
  double finalpos = 0;
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerAcc = TextEditingController();
  final TextEditingController _controllerInitPos = TextEditingController();
  final TextEditingController _controllerVeloi = TextEditingController();

  String finalPosition(){
  double initpos = double.parse(_controllerInitPos.text.toString());
  double time = double.parse(_controllerTime.text.toString());
  double acc = double.parse(_controllerAcc.text.toString());
  double veloi = double.parse(_controllerVeloi.text.toString());

  if(initpos < 0 || time < 0 || acc < 0){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The values cannot be negative')));
  }else {
    finalpos = initpos + (veloi * time) + (1 / 2) * (acc * (time * 2));
    return 'The final position is: $finalpos';
  }
  return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        centerTitle: true,
        actions: [
          IconButton(onPressed:() {
            setState(() {
              result = finalPosition();
            });
            }, icon: const Icon(Icons.calculate)),
      ],
      ),
      body: Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(width: 200,
            child: TextField(controller: _controllerInitPos,decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the initial position'),) ),
          const SizedBox(height: 10),
          SizedBox(width: 200,
            child: TextField(controller: _controllerVeloi,decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the initial velocity'),) ),
          const SizedBox(height: 10),
          SizedBox(width: 200,
            child: TextField(controller: _controllerAcc,decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the acceleration'),) ),
          const SizedBox(height: 10),
          SizedBox(width: 200,
              child: TextField(controller: _controllerTime,decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter the time'),) ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Icon(Icons.navigate_before))
          ],
        ),
      ),
    );
  }
}
