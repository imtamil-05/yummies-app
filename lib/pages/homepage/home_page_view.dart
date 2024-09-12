import 'package:flutter/material.dart';
import 'package:yummies_app/pages/homepage/home_page.dart';
import 'package:yummies_app/pages/homepage/home_page_view_model.dart';
import 'package:yummies_app/themes/color_theme.dart';

class HomePageView extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello Chinwe,",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ), //Text(data name)
              SizedBox(
                height: 5,
              ),
              const Text(
                "What would you like to",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                "eat?",
                style: TextStyle(
                    color: ColorTheme.colorTheme.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
        
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // TextField
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        cursorColor: ColorTheme.colorTheme.primaryColor,
                        controller: viewModel.searchController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.mic),
                          labelText: 'Enter a dish name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
        
                  // SizedBox for spacing
                  SizedBox(width: 10), // Adjust the width for spacing
        
                  // Icon
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorTheme.colorTheme.primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Icon(
                        Icons.tune_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width, // Full screen width
                child: Divider(
                  color: Colors.grey, // Line color
                  thickness: 2, // Line thickness
                ),
              ),
          
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               GestureDetector(
                 onTap: (){
                   setState(() {
                     viewModel.selectedIndex = 0;
                   });
                 },
                 child: Card(
                    elevation: viewModel.selectedIndex == 0 ? 10 : 5,
                    color: viewModel.selectedIndex == 0 ? ColorTheme.colorTheme.primaryColor : Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Meals',
                      style: TextStyle(color:viewModel.selectedIndex == 0 ? Colors.white : Colors.black),
                      textAlign: TextAlign.center,),
                    ),
                    
                  ),
               ),
               GestureDetector(
                 onTap: (){
                   setState(() {
                     viewModel.selectedIndex = 1;
                   });
                 },
                 child: Card(
                    elevation: viewModel.selectedIndex == 1 ? 10 : 5,
                      color: viewModel.selectedIndex == 1 ? ColorTheme.colorTheme.primaryColor : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Sides',style: TextStyle(color:viewModel.selectedIndex == 1 ? Colors.white : Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
               ),
                GestureDetector(
                 onTap: (){
                   setState(() {
                     viewModel.selectedIndex = 2;
                   });
                 },
                  child: Card(
                    elevation: viewModel.selectedIndex == 2 ? 10 : 5,
                      color: viewModel.selectedIndex == 2 ? ColorTheme.colorTheme.primaryColor : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Snacks',style: TextStyle(color: viewModel.selectedIndex == 2 ? Colors.white : Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                  GestureDetector(
                 onTap: (){
                   setState(() {
                     viewModel.selectedIndex = 3;
                   });
                 },
                    child: Card(
                    elevation: viewModel.selectedIndex == 3 ? 10 : 5,
                      color:viewModel.selectedIndex == 3 ? ColorTheme.colorTheme.primaryColor : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Drinks',style: TextStyle(color: viewModel.selectedIndex == 3 ? Colors.white : Colors.black), textAlign: TextAlign.center,),
                    ),
                                  ),
                  ),
             ],
           ),
           SizedBox(height: 20.0),
          
           Text("Today's Special Offer",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
           SizedBox(height: 10.0),
        
          Center(
            child: Container(
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0), 
                ),
        
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset("assets/images/burger.jpg", fit: BoxFit.cover,width: 150, height: 150,),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child:Align(
                      alignment: Alignment.centerLeft,
                    
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Yummies Special Burger",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        SizedBox(height: 5.0),
                        Text("Now",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        SizedBox(height: 5.0),
                        Text("N1,800",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        SizedBox(height: 5.0),
                        Text("10% off",style: TextStyle(fontSize: 5,fontWeight: FontWeight.bold, color: ColorTheme.colorTheme.primaryColor),textAlign: TextAlign.center),
                           ElevatedButton(
                          onPressed: () {
                            // Action for the button
                          },
                          child: Text('Add to Cart',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold, color: ColorTheme.colorTheme.primaryColor),textAlign: TextAlign.center),
                           ),
                     ],
                    ),
                     ),
                  )
                ]
              )
              ),
            ),

            SizedBox(height: 20.0), 
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle.merge(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Popular Now",
                              ),
                              SizedBox(
                                width: 150,
                              ),
                               Text(
                                "See All>",
                                style: TextStyle(color: ColorTheme.colorTheme.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(10.0),
                        
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child:  Image.asset("assets/images/burger.jpg", fit: BoxFit.cover,width: 100, height: 100,),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 10,
                                  child: Icon(viewModel.selectedIndex == 0 ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                ),
                           ] ),
                            SizedBox(height: 10.0),
                            Text("Beef Salad",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 5.0),
                            Text("N1,200",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                             ],
                      ),
                    ),
                  ),
               ),
               SizedBox(width: 10.0),
               Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(10.0),
                        
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child:  Image.asset("assets/images/burger.jpg", fit: BoxFit.cover,width: 100, height: 100,),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(viewModel.selectedIndex == 1 ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                ),
                           ] ),
                            SizedBox(height: 10.0),
                            Text("Beef Salad",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 5.0),
                            Text("N1,200",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                             ],
                      ),
                    ),
                  ),
               ),
               SizedBox(width: 10.0),
               Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(10.0),
                        
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child:  Image.asset("assets/images/burger.jpg", fit: BoxFit.cover,width: 100, height: 100,),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(viewModel.selectedIndex == 1 ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                ),
                           ] ),
                            SizedBox(height: 10.0),
                            Text("Beef Salad",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 5.0),
                            Text("N1,200",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                             ],
                      ),
                    ),
                  ),
               ),
               SizedBox(width: 10.0),
               Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(10.0),
                        
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child:  Image.asset("assets/images/burger.jpg", fit: BoxFit.cover,width: 100, height: 100,),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Icon(viewModel.selectedIndex == 1 ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                ),
                           ] ),
                            SizedBox(height: 10.0),
                            Text("Beef Salad",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 5.0),
                            Text("N1,200",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                             ],
                      ),
                    ),
                  ),
               ),
                ],//children
                ),
                ),
        
            
         ] ),
        ),
      ),
    );
  }
}
