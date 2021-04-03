
import 'package:control_language/Localization/Set_Localization.dart';
import 'package:control_language/Model/language.dart';
import 'package:control_language/Model/shardprefernces.dart';
import 'package:control_language/Route/Route_names.dart';
import 'package:control_language/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> _Key = GlobalKey<FormState>();

   String  lnags ;

  @override
  void initState() {
    getLangCoge().then((langCode) => setState(()=> lnags = langCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(SetLocalization.of(context).getTranslateValue("home_page") , style: TextStyle(color: lnags == 'en'? Colors.amberAccent : Colors.white,)),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: Container(),
              icon: Icon(Icons.language, color: Colors.white,),
              items: <DropdownMenuItem>[
                ...Language.languagelist().map((e)
                => DropdownMenuItem(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(e.flag , style: TextStyle(fontSize: 22),),
                      Text(e.name,style: TextStyle(fontSize: 22),),
                    ],
                  ),
                ),
                ),
              ],
              onChanged: (lang){
                _cahngeLanguage(lang);
                setState(() {
                  lnags = lang.languageCode;
                });
              },
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _mainForm(context),
        ),
      ),
      drawer: _drewerlist(),
    );
  }

  Form _mainForm(BuildContext context){

    return Form(
      key: _Key,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Center(
              child: Text('Customer Information',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val){
              
              if(val.isEmpty){
                return 'required field';
              }
              return null ;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter Email Address'
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date ',
                hintText: 'Select Date of Birth'
            ),
            onTap: () async {
               FocusScope.of(context).requestFocus(FocusNode());
               await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year-70), lastDate: DateTime.now());
            },
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: (){
              if(_Key.currentState.validate()){
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: StadiumBorder(),
            color:  Theme.of(context).primaryColor,
            child: Text(
              'Submit Information',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

        ],
      ),
    );
  }

  void _showSuccessDialog(){

    showTimePicker(context: context, initialTime: TimeOfDay.now() );

  }

  Container _drewerlist(){

    TextStyle _textStyle = TextStyle(
      color: Colors.white ,
      fontSize: 24
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(
                backgroundColor: Colors.pink.shade700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text('About Us' , style: _textStyle,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Settings' , style: _textStyle,),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, settingRoute);
            },
          ),
        ],
      ),
    );
  }

  void _cahngeLanguage(Language lang) async {

    Locale _temp =  await setLocal(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }
}


