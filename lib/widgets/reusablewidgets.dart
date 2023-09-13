import 'package:flutter/material.dart';


const imageName = 'assets/images/logo1.jpg';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.lightBlueAccent,

      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context, isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return Colors.blueAccent;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
    ),
  );
}




class StateSelector extends StatefulWidget {
  @override
  _StateSelectorState createState() => _StateSelectorState();
}

class _StateSelectorState extends State<StateSelector> {
  String? selectedState; // Declare as String? (nullable)

  List<String> indianStates = [

    'Kerala',
    'Tamil Nadu',


  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          hint: Text('Select an Indian state'),
          value: selectedState,
          onChanged: (String? newValue) {
            setState(() {
              selectedState = newValue;
            });
          },
          items: indianStates.map((String state) {
            return DropdownMenuItem<String>(
              value: state,
              child: Text(state),
            );
          }).toList(),
        ),
        SizedBox(height: 20.0),

      ],
    );
  }
}

class DistrictSelector extends StatefulWidget {
  @override
  _DistrictSelectorState createState() => _DistrictSelectorState();
}

class _DistrictSelectorState extends State<DistrictSelector> {
  String ?selectedDistrict;

  List<String> keralaDistricts = [
    'Thiruvananthapuram',
    'Kollam',
    'Pathanamthitta',
    'Alappuzha',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasargod',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          hint: Text('Select a district in Kerala'),
          value: selectedDistrict,
          onChanged: (String? newValue) {
            setState(() {
              selectedDistrict = newValue;
            });
          },
          items: keralaDistricts.map((String district) {
            return DropdownMenuItem<String>(
              value: district,
              child: Text(district),
            );
          }).toList(),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
