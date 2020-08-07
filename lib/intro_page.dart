import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(79, 42, 152, 1), Color.fromRGBO(17, 35, 129, 1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('amber.png'),width: 100,),
                SizedBox(height:70),

                Text('Welcome', style:TextStyle(color: Colors.white,fontSize: 22)),
                SizedBox(height:15),
                Text('To start monitoring your Masternode and use your wallet (balance & transfer), please import your wallet', style:TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                SizedBox(height:15),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.white,
                    child: Text("Import wallet", style: TextStyle(color:Colors.black),),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/import");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
