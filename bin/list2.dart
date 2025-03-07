import 'dart:io';

void main() {
  Company TestCompany = Company();
  int idGenerator = 100000;
  bool exit = false;
  while (!exit) {
    print('-' * 40);
    print('1 - Employee cadaster');
    print('2 - Increase salary');
    print('3 - Display data');
    print('4 - Exit');
    print('-' * 40);

    stdout.write('=> ');
    String choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        print("-" * 40);
        stdout.write('Enter name: ');
        String name = stdin.readLineSync() ?? '';

        stdout.write('Enter position: ');
        String position = stdin.readLineSync() ?? '';

        stdout.write('Enter salary: ');
        double salary = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        int id = idGenerator;
        Employee x = Employee(id, name, position, salary);

        TestCompany.addEmployee(x);
        idGenerator++;
        break;
      case '2':
        print("-" * 40);
        stdout.write('Enter employee ID: ');
        int id = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        stdout.write('Enter salary increase porcentage: ');
        double porcent = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        TestCompany.increaseSalary(id, porcent);
        break;
      case '3':
        TestCompany.displayEmployees();
        break;
      case '4':
        exit = true;
        break;
      default:
        print("Ther is no such value");
    }
  }
}

class Employee {
  late final int id;
  late String name;
  late String position;
  late double _salary;

  Employee(this.id, this.name, this.position, this._salary);

  set addSalary(double value) {
    if (value > getSalary) {
      _salary = value;
    } else {
      print('400 error');
    }
  }

  get getSalary => _salary;

  void increaseSalary(double porcent) {
    if (porcent > 0) {
      addSalary = getSalary * (1 + porcent / 100);
    } else {
      print('Invalid percentage. Salary not changed.');
    }
  }

  void displayData() {
    print('-' * 40);
    print(
        'Id: $id \nName: $name \nPosition: $position \nSalary: ${_salary.toStringAsFixed(2)}');
  }
}

class Company {
  List<Employee> employees = [];

  void addEmployee(Employee x) {
    employees.add(x);
    print('Employee added succesfully');
  }

  void removeEmployee(int id) {
    employees.removeWhere((employee) => employee.id == id);
    print('Employee removed succesfully');
  }

  void increaseSalary(int id, double porcent) {
    Employee? x = employees.firstWhere(
      (emp) => emp.id == id);
    if (x != null) {
      x.increaseSalary(porcent);
    } else {
      print('Employee not found');
    }
  }

  void displayEmployees() {
    if (employees.isEmpty) {
      print('No employees registered');
    } else {
      print('-' * 40);
      for (var employee in employees) {
        employee.displayData();
      }
    }
  }
}

void enter() {
  stdout.write("Press ENTER to exit");
  stdin.readLineSync();
}
