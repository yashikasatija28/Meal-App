import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = '/filters';

  final Function saveFilters;
  final Map<String, bool> Currentfilters;

  FiltersScreen(this.Currentfilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  void initState() {
    _glutenfree = widget.Currentfilters['gluten']!;
    _vegetarian = widget.Currentfilters['vegetarian']!;
    _vegan = widget.Currentfilters['vegan']!;
    _lactosefree = widget.Currentfilters['lactose']!;

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool CurrentValue,
    dynamic UpdateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: CurrentValue,
        subtitle: Text(description),
        onChanged: UpdateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactosefree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Your filter is Saved !'),
                  duration: Duration(seconds: 2),
                ));
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'only include gluten-free meals',
                  _glutenfree,
                  (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'only include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'only include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                    'Lactose -Frre',
                    'only include Lactose-free meals',
                    _lactosefree, (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
