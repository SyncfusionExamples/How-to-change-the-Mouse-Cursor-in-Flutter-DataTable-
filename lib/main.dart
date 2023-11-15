// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = [];

  @override
  void initState() {
    super.initState();
    _employees = populateData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion DataGrid Demo')),
      body: SfDataGrid(
        source: _employeeDataSource,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'ID',
              label: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                      alignment: Alignment.center, child: const Text('ID')))),
          GridColumn(
              columnName: 'Name',
              label: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                    alignment: Alignment.center, child: const Text('Name')),
              )),
          GridColumn(
              columnName: 'Designation',
              label: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                    alignment: Alignment.center,
                    child: const Text('Designation')),
              )),
          GridColumn(
              columnName: 'Salary',
              label: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                    alignment: Alignment.center, child: const Text('Salary')),
              )),
        ],
        columnWidthMode: ColumnWidthMode.fill,
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRows(employees);
  }

  List<DataGridRow> datagridRows = [];

  @override
  List<DataGridRow> get rows => datagridRows;

  void buildDataGridRows(List<Employee> employeesData) {
    datagridRows = employeesData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'ID', value: e.id),
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(
                  columnName: 'Designation', value: e.designation),
              DataGridCell<int>(columnName: 'Salary', value: e.salary),
            ]))
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(dataGridCell.value.toString()),
        ),
      );
    }).toList());
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

List<Employee> populateData() {
  return [
    Employee(10001, 'Jack', 'Manager', 150000),
    Employee(10002, 'Perry', 'Project Lead', 80000),
    Employee(10003, 'James', 'Developer', 55000),
    Employee(10004, 'Michael', 'Designer', 39000),
    Employee(10005, 'Roland Mendel', 'Developer', 45000),
    Employee(10006, 'Sven Ottlieb', 'UI Designer', 36000),
    Employee(10007, 'Williams', 'Developer', 44000),
    Employee(10008, 'Adams', 'Developer', 43000),
    Employee(10009, 'Edwards', 'QA Testing', 43000),
    Employee(10010, 'Grimes', 'Developer', 43000),
    Employee(10011, 'Maria Andres', 'Developer', 41000),
    Employee(10012, 'Thomas Hardy', 'Developer', 40000),
    Employee(10013, 'Hanna Moos', 'Sales Associate', 350000),
    Employee(10014, 'Elizabeth', 'Developer', 41000),
    Employee(10015, 'Patricio Simpson', 'Administrator', 33000),
  ];
}
