# How-to-change-the-Mouse-Cursor-in-Flutter-DataTable-SfDataGrid

This article illustrates how to change the mouse cursor to [SystemMouseCursors.click](https://api.flutter.dev/flutter/services/SystemMouseCursors/click-constant.html) in a Flutter [DataGrid](https://help.syncfusion.com/flutter/datagrid/getting-started).


**STEP 1:** Create a data source class by extending [DataGridSource](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/DataGridSource-class.html) for mapping data to the SfDataGrid. In the [buildRow](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/DataGridSource/buildRow.html) method, wrap the [MouseRegion](https://api.flutter.dev/flutter/widgets/MouseRegion-class.html) widget as a parent of the [Container](https://api.flutter.dev/flutter/widgets/Container-class.html) widget. Set the desired cursor using the [MouseRegion.cursor](https://api.flutter.dev/flutter/widgets/MouseRegion/cursor.html) property. 

 
 ```dart
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
 ```

**STEP 2:** Initialize the [SfDataGrid](https://www.syncfusion.com/flutter-widgets/flutter-datagrid) widget with all the required properties. For changing the mouse cursor in the header cell, wrap the MouseRegion widget as a parent of the Container widget within the SfDataGrid.columns property and set the desired cursor using the `MouseRegion.cursor` property. 

 
 ```dart
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
 ```
