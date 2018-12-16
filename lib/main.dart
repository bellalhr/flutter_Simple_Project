import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    String val="";
    return Form(
      key: _formKey,
     child: Padding(
       padding: EdgeInsets.all(20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,

         children: <Widget>[
           Text('Login',
             style: TextStyle(color: Colors.green,fontSize: 27),

           ),
           TextFormField(
             validator: (value) {
               if (value.isEmpty) {
                 return 'Please enter some text';
               }
               val=val+value;
             },
             decoration: InputDecoration(
                 hintText: "Enter Email"
             ),
           ),
           TextFormField(
             validator: (value){
               if(value.isEmpty)
                 return 'Please enter your password';
               val=val+value;
             },
             decoration: InputDecoration(
                 hintText: "Enter password"
             ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 16.0),
             child: RaisedButton(
               onPressed: () {
                 // Validate will return true if the form is valid, or false if
                 // the form is invalid.
                 if (_formKey.currentState.validate()) {
                   // If the form is valid, we want to show a Snackbar
                   Scaffold.of(context)
                       .showSnackBar(SnackBar(content: Text(val)));
                 }
               },
               child: Text('Submit'),
             ),
           ),
         ],
       ),
     ),
    );
  }
}