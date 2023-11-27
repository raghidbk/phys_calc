import 'package:flutter/material.dart';

class acc extends StatefulWidget {
  const acc({super.key});
  @override
  State<acc> createState() => _accState();
}

class _accState extends State<acc> {
  final TextEditingController _controllervelof = TextEditingController();
  final TextEditingController _controllerveloi= TextEditingController();
  final TextEditingController _controllertime= TextEditingController();
  String result = 'enter the variables needed';

  @override
  void dispose() {
    _controllertime.dispose();
    _controllervelof.dispose();
    _controllerveloi.dispose();
    super.dispose();
  }


  String Facc() {
    double time = double.parse(_controllertime.text.toString());
    double velof = double.parse(_controllervelof.text.toString());
    double veloi = double.parse(_controllerveloi.text.toString());
    double acc=0;
      if(veloi<0 || velof<0 || time<0){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The values cannot be negative')));
      }else{
        acc = (velof - veloi)/time;
      }

      if(acc<0){
       return "you've enterd a wrong value";
      }else{
        return 'the acceleration is $acc';
      }


    }//acceleration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              result = Facc();

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
                  hintText: 'enter time if you dont hav it enter 0'
              ),),
            ),
            SizedBox(height: 10.0,),
            SizedBox(width: 300.0,
              child: TextField(
                controller: _controllervelof, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter final vilocity if you dont hav it enter 0'
              ),),
            ),
            SizedBox(height: 10.0,),
            SizedBox(width: 300.0,
              child: TextField(
                controller: _controllerveloi, decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter initial vilocity if you dont hav it enter 0'
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
