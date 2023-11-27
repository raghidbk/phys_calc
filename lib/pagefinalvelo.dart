import 'package:flutter/material.dart';

class FinalVelocity extends StatefulWidget {
  const FinalVelocity({super.key});

  @override
  State<FinalVelocity> createState() => _FinalVelocityState();
}

class _FinalVelocityState extends State<FinalVelocity> {
  final TextEditingController _controlleracc = TextEditingController();
  final TextEditingController _controllertime = TextEditingController();
  final TextEditingController _controllerveloi = TextEditingController();
  String result = 'enter the variables needed';

  @override
  void dispose() {
    _controlleracc.dispose();
    _controllertime.dispose();
    _controllerveloi.dispose();
    super.dispose();
  }


  String FVelocity(){
    double acc = double.parse(_controlleracc.text.toString());
    double time = double.parse(_controllertime.text.toString());
    double veloi = double.parse(_controllerveloi.text.toString());
    double velof=0;
    if(veloi<0 || acc<0 || time<0){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The values cannot be negative')));
      return 'the final velocity cant be calculated';
    }else{
      velof = veloi+(acc*time);
      return 'the final velocity is $velof';
    }

  }//final velocity


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              result = FVelocity();
            });
          }, icon:const Icon(Icons.calculate))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const  SizedBox(height: 15.0,),
            SizedBox(width: 300.0,
              child: TextField(
                controller: _controlleracc, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter acceleration'
              ),),
            ),
            const SizedBox(height: 10.0,),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: _controllertime, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter time'
              ),),
            ),
            const  SizedBox(height: 10.0,),
            SizedBox(width: 300.0,
              child: TextField(
                controller: _controllerveloi, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter initial velocity'
              ),),
            ),
            const   SizedBox(height: 20.0,),
            ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Icon(Icons.navigate_before))
          ],
        ),
      ),
    );
  }
}
