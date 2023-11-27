import 'package:flutter/material.dart';
import 'pagedisp.dart';
import 'pageacc.dart';
import 'DistPage.dart';
import 'FinalPosPage.dart';
import 'pagefinalvelo.dart';
import 'credits.dart';

class pageS extends StatefulWidget {
  const pageS({super.key});

  @override
  State<pageS> createState() => _pageSState();
}

class _pageSState extends State<pageS> {

  void opendispPage(){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const distance()
        ),
      );

  }

  void openaccPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const acc()
      ),
    );

  }

  void opendistancePage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const distpage()
      ),
    );

  }

  void openFinalPostionPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const finalPosPage()
      ),
    );

  }

  void openFinalVelocity(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const FinalVelocity()
      ),
    );

  }

  void openCredits(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const credits()
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('select a formula'),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
           children: [
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: opendispPage, child: const Text('Dispalcement')),
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: openaccPage, child: const Text('avg acceleration')),
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: openFinalVelocity, child: const Text('final velocity')),
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: opendistancePage, child:const Text('distance')),
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: openFinalPostionPage, child: const Text('final postion')),
             SizedBox(height: 20.0,),
             ElevatedButton(onPressed: openCredits, child: const Text('credits'))
           ],
        ),
      ),
      

    );
  }
}
