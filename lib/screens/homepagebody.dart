import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fugipie_inventory/bloc/auth/bloc/authapp_bloc.dart';
import 'package:fugipie_inventory/componants/slider.dart';
import 'package:fugipie_inventory/componants/dropdown.dart';
import 'package:fugipie_inventory/toDo/tasklist.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fugipie_inventory/constants/razor_credential.dart'as razorpaycredntial;

import 'package:http/http.dart' as http;


class HomePageBody extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final _textFieldController = TextEditingController();
  final _firebaseref = FirebaseFirestore.instance;
  final _firebaseauth = FirebaseAuth.instance;
  final _razorpay = Razorpay();

  String newTask = '';

  //creating initState() for adding listener to controller
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  //disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    _razorpay.clear();
    super.dispose();
  }

  void _submit() {
    //we aren't interested in updating our ui so listen will be false
    // Provider.of<TodosModel>(context, listen: false).addTodo(newTask);
    _textFieldController.clear();
    //cancelling the dialog
    Navigator.pop(context);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);


  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message ?? '')));
    
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.walletName ?? '')));

  }

void createOrder() async{
  const String username = razorpaycredntial.keyId;
  const String password = razorpaycredntial.keySecret;
  
  final String Auth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  Map<String , dynamic> body={
    "amount":100,
    "currency":"INR",
    "recipt": "rcptid_11"

  };
  var res = await http.post(
    Uri.https("api.razorpay.com","v1/orders"),
    headers: <String,String>{
      "Content-Type":"application/json",
      "authorization":Auth,
    },
    body: jsonEncode(body),
  );

  if(res.statusCode == 200){
    openGateway(jsonDecode(res.body)['id']);
  }
  print(res.body);
}


openGateway(String orderId){
  var options={
    'key':razorpaycredntial.keyId,
    'amount':100,
    'name':' hadi',
    'order_id':orderId,
    'description': ' fine t shirt',
    'timeout':60*5,
    'profile':{
      'contact':'7034037653',
      'email':'abcd@gmail.com'
    }
  };
  _razorpay.open(options);
}

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthappBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: const Color(0xFF181826),
      appBar: AppBar(
        backgroundColor: const Color(0xff181826),
        elevation: 5.0,
        toolbarHeight: 80.0,
        title: Image.asset('assets/images/fugipielogo.png', fit: BoxFit.cover),
        actions: [
          // CircleAvatar(
          //   radius: 20.0,
          //   backgroundImage:
          //       user.photo != null ? NetworkImage(user.photo!) : null,
          //   child: user.photo == null ? const Icon(Icons.circle_sharp) : null,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  context.read<AuthappBloc>().add(AppLogoutRequsted());
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  // CupertinoIcons.person_circle_fill,
                  size: 30.0,
                )),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 10.0),
                  child: Dropdowndate(),
                ),
              ],
            ),
            carouselslider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Todo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      heroTag: 'tag homebody',
                      backgroundColor: Colors.blueAccent,
                      onPressed: (() {
                        _showAddTextDialog();
                      }),
                      child: Icon(
                        Icons.add,
                        size: 40.0,
                        color: Color(0xFF232338),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddTextDialog() async {
    final String uid;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xff232333),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
            title: const Text("Add a new Task",
                style: TextStyle(color: Colors.white)),
            content: TextField(
              controller: _textFieldController,
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: "Add New Task",
                  hintStyle: TextStyle(color: Colors.white)),
              onSubmitted: (_) => _submit(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (_textFieldController.text.isNotEmpty) {
                    _insertRecord(_textFieldController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("values didnt inserted")));
                  }
                  _textFieldController.clear();
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
                child: const Text("Submit"),
              )
            ],
          );
        });
  }

  void _insertRecord(String title) {
    var userid = _firebaseauth.currentUser?.uid;
    var createTime = DateTime.now();
    var uniqueId = _firebaseref.collection('todolist').doc().id;
    _firebaseref.collection('todolist').doc(uniqueId).set({
      'id': uniqueId,
      'title': title,
      'uid': userid,
      'createTime': createTime,
    }).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Inserted values"),
            ),
          )
        });
  }
}
