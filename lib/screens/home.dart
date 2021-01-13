import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller1;
  
   // Radio
  String _gender;

  // CheckBoox
  List<Food> food = Food.getFood();
  List<String> _foodChecked = [];

  // Dropdown
  List<String> dropdownItem = ['ประเทศไทย', 'ต่างประเทศ'];
  String _selectedItem = 'ประเทศไทย';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text From Field Example"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
             child: Container(
               width: 280,
              child: TextFormField(
                controller: _controller1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return null;
                },
              ),
            ),
            ),

            Divider(),
            CheckboxListTile(
                title: Text("Pizza"),
                value: food[0].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[0].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[0].foodName);
                  } else {
                    _foodChecked.remove(food[0].foodName);
                  }
                }),

                CheckboxListTile(
                title: Text("Donut"),
                value: food[1].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[1].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[1].foodName);
                  } else {
                    _foodChecked.remove(food[1].foodName);
                  }
                }),

                RadioListTile(
                title: Text("เพศชาย"),
                value: "mele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
                 RadioListTile(
                title: Text("เพศหญิง"),
                value: "femele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),

              DropdownButton(
              value: _selectedItem,
              items: dropdownItem.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(
                  child: Text(val),
                  value: val,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
           
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_controller1);
                }
                print(_foodChecked);
                print(_gender);
                print(_selectedItem);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Food {
  String foodName;
  bool isChecked;

  Food(this.foodName, this.isChecked);

  static List<Food> getFood() {
    return <Food>[
      Food('Pizza', false), 
      Food('Donut', false)
      ];
  }
}

class PrefixItem {
  String prefixName;
  String val;

  PrefixItem(this.val, this.prefixName);
  
  static List<PrefixItem> getPrefix(){
    return <PrefixItem>[
      PrefixItem('1', 'ประเทศไทย'),
      PrefixItem('2', 'ต่างประเทศ'),
    ];
  }
}
