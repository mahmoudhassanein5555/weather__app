import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_result_screen.dart';

class SearchScreen extends StatefulWidget {
  
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF642FF1),
        child: Container(
          padding: EdgeInsets.fromLTRB(35, 150, 35, 0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Check the weather in your city 🌦️",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("lib/images/location.png"),
                ),
                Form(
                  key: formstate,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "City Name",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 90, 126, 244),
                          width: 5,
                        ),
                      ),
                    ),
                    onSaved: (newValue) => setState(() {
                      cityName = newValue!;
                    }),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter The City Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      // selectedPos = 0;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultScreen(cityName: cityName!),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 207, 194, 243),
                  ),
                  child: Text("Get Weather"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
