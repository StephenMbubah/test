
import 'package:flutter/material.dart';

class NumeroUno extends StatefulWidget {
  const NumeroUno({super.key});

  @override
  State<NumeroUno> createState() => _NumeroUnoState();
}

class _NumeroUnoState extends State<NumeroUno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.blue, // Set the background color to blue
        onPressed: () {
          // Handle the button press
        },
        child: const Text(
          'ADD', // Text in the center
          style: TextStyle(
            color: Colors.white, // Text color set to white
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        //titleSpacing: ,
        //title: Text('AppBar with Spaced Icons'),
          actions: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                ],
              ),
            )

          ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text("RECIPIENTS", style: TextStyle(
              fontSize: 42, fontWeight: FontWeight.bold
            ),),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent,
              ),
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My personal account (4)"),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);},
                      child: Container(
                        height: 44,
                        width: 42.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(12.9)
                        ),
                        child: const Center(
                          child: Icon(Icons.arrow_forward, color: Colors.blue,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            const Text("RECENT RECEIPTS", style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600
            ),),
           const SizedBox(
             height: 15,
           ),
            ReuseableContainer(title: 'Bonnie Riley', subtitle: 'EUR account', assets1: '',),
            const SizedBox(height: 5,),
            ReuseableContainer(title: 'Aileen Sheen', subtitle: 'CED account', assets1: '',),
            const SizedBox(height: 5,),
            ReuseableContainer(title: 'Angelina Ween', subtitle: 'GBP account', assets1: '',),
            const SizedBox(height: 5,),
            ReuseableContainer(title: 'Yamilet Booker', subtitle: 'WEN account', assets1: '',),
            const  SizedBox(height: 5,),
            ReuseableContainer(title: 'Alejandra Stallings', subtitle: 'AUS account', assets1: '',),
            const SizedBox(height: 5,),
            ReuseableContainer(title: 'Tijani Flojojean', subtitle: 'NRA account', assets1: '',),
          ],
        ),
      ),
    );
  }
}

class ReuseableContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assets1;
  const ReuseableContainer({
    super.key, required this.title, required this.subtitle, required this.assets1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assets1), // Replace with your image path
                      fit: BoxFit.cover, // Adjusts the image to cover the container
                    )
                ),
              ),
             const  SizedBox(width: 5),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( title,
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600
                    ),),
                  Text(subtitle,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600,color: Color(0xff7f8192)
                    ),),
                ],
              )
            ],
          ),
          Text("Send", style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16 ))
        ],
      ),
    );
  }
}
