# OOP (Object Oriented Programming)

## Class

```dart
void main() {
  Item gun = Item("gun", "First my item");
  
  // Named constructor
  Item item1 = Item.fromList(["gun", "My item"])
}

class Item {
  String name;
  String description;
  
  // Constructor
  Item(String name, String description)
    : this.name = name;
      this.description = description;
      
  // 위의 Constructor는 아래 형태로 동일하게 변경 가능하다.
  Item(this.name, this.members);
  
  // Named constructor
  Item.fromList(List values)
    : this.name = values[0],
      this.description = values[1];
  
  void introduce() {
    print("${this.name},  ${this.description}");
  }
}
```

## Immutable Programming
인스턴스의 값이 변경되지 않도록 선언하는 방법을 제공한다. final 을 이용하여 인스턴스 생성 시 할당된 값은 변경되지 않도록 제한할 수 있따.

1. 클래스 멤버변수에 final 을 붙힌다.
2. const를 Constructor 앞에 붙힌다.
  - const는 런타임에 할당되는 변수에는 사용할 수 없다.


```dart
void main() {
  Item gun = Item("gun", "First my item");
  
  // Named constructor
  Item item1 = Item.fromList(["gun", "My item"])
}

class Item {
  final String name;
  final String description;
  
  // Constructor
  Item(String name, String description)
    : this.name = name;
      this.description = description;
      
  // 위의 Constructor는 아래 형태로 동일하게 변경 가능하다.
  Item(this.name, this.members);
  
  // Named constructor
  Item.fromList(List values)
    : this.name = values[0],
      this.description = values[1];
  
  void introduce() {
    print("${this.name},  ${this.description}");
  }
}
```

### const + constructor

생성자 앞에 const를 붙혀서 사용할 수 있다. const 키워드를 생성자에 붙히면, 인스턴스를 생성 시 클래스 앞에 const를 붙혀줘서 Immutable 형태로 변경해준다.

```dart
void main() {
  Item gun = const Item("gun", "First my item");
  gun.name = 'Test'; // Error
}

class Item {
  final String name;
  final String description;
  
  // Constructor
  const Item(this.name, this.description);
}
```

### const 의 특이한 점

아래 코드를 보자. 기본적으로 아래와 같이 생성자 파라미터가 같다고 동일한 인스턴스라고 생각하진 않는다. 멤버 정보가 동일한 다른 인스턴스이다.
```dart
void main() {
  Item gun1 = Item("gun", "First my item");
  Item gun2 = Item("gun", "First my item");
  
  print(gun1 == gun2); // false
}

class Item {
  final String name;
  final String description;
  
  // Constructor
  Item(this.name, this.description);
}
```

하지만 const 키워드를 이용하여 인스턴스를 생성 시 같은 인스턴스로 생성이 된다.
```dart
void main() {
  Item gun1 = const Item("gun", "First my item");
  Item gun2 = const Item("gun", "First my item");
  
  print(gun1 == gun2); // true
}

class Item {
  final String name;
  final String description;
  
  // Constructor
  const Item(this.name, this.description);
}
```

## 클래스의 Getter / Setter

클래스의 getter와 setter는 get / set 키워드를 사용한다. getter와 setter의 사용 이유 등은 상세하게 설명하지 않는다. 

```dart
void main() {
  Item gun = Item("gun", "First my item");
   
  print(gun.itemName);
  gun.itemName = "Sword"; // Set item name
  print(gun.itemName);
}

class Item {
  String name;
  String description;
  
  // Constructor
  Item(this.name, this.description);
  
  // Getter
  String get itemName {
    return this.name;
  }
  
  // Setter
  set itemName(String name) {
    this.name = name;
  }
}
```

## Private 클래스 속성

클래스의 네임 앞에 `_` 를 prefix로 붙히게된다면, 외부에서는 접근할 수 없다. (파일 내의 다른 스코프에서는 접근이 가능하다.)
```dart
void main() {
  Item gun = _Item("gun", "First my item");
   
  print(gun.itemName);
  gun.itemName = "Sword"; // Set item name
  print(gun.itemName);
}

class _Item {
  String name;
  String description;
  
  // Constructor
  _Item(this.name, this.description);
  ...
}
```

## 상속 (Inheritance

dart는 클래스의 상속을 extends 키워드를 사용한다.

```dart
void main() {
  Base base = Base(name:'base', age:10);
  base.printInfo();
  
  Child child = Child(name:'child', age:5);
  child.printInfo();
  
  print(base is Base); // true
  print(base is Child); // false
  print(child is Base); // true
  print(child is Child); // true
}

class Base {
  String name;
  int age;
  
  Base({
    required this.name,
    required this.age
  });
  
  void printInfo() {
    print('${this.name}, ${this.age}');
  }
}

class Child extends Base {
  Child({
    required String name,
    required int age
  }): super(
    name: name, age: age
  );
  
}
```

## Method
### override
클래스 내의 메소드를 덮어서 정의할 수 있다. 메소드를 override 하는 방법은 `@override` 애노테이션을 선언하여 override 된 메소드임을 알린다.

```dart
void main() {
  Base base = Base(10);
  
  Child child = Child(20);
  
  base.printNumber();
  child.printNumber();
}

class Base {
  final int num;
  
  Base(this.num);
  
  printNumber() {
    print("${this.num}");
  }
}

class Child extends Base {
  Child(int num) : super(num);
  
  @override
  printNumber() {
    print("This number is ${this.num}");
  }
}
```

### static 
static은 생성한 인스턴스가 아닌 클래스 자체에 속한다. 즉 인스턴스를 생성하지 않고도 사용을 할 수 있다.
예제를 살펴보면 이해가 쉽다. Example class의 static 멤버 변수인 static 변수를 인스턴스가 아닌 클래스를 통해 접근하였고,
변경한 값은 모든 인스턴스에 반영되는 것을 확인할 수 있다.

```dart
void main() {
  Example test1 = Example("First test");
  Example test2 = Example("Second test");
  
  test1.description = "Test1";
  
  test1.printNameAndDescription();
  test2.printNameAndDescription();
  
  print('----------------------');
  
  Example.name = "Example";
  
  test1.printNameAndDescription();
  test2.printNameAndDescription();
}

class Example {
  static String? name;
  String description;
  
  Example(
    this.description,
  );
  
  void printNameAndDescription() {
    print("${name}, ${description}");
  }
  
  static void printName() {
    print("${name}");
  }
}

```


## 인터페이스 (Interface)
dart 언어에서는 interface 란 예약어가 별도로 존재하지 않는다. abstract 예약어를 통하여 인터페이스의 객체를 생성하지 못하도록 제한한다.
```dart
void main() {
  // abstract 클래스는 인스턴스를 생성할 수 없다.
  // TestInterface testInterface = TestInterface('test'); 
  
  TestInterface test = TestImpl1('test1');
  test.printName();
  
  test = TestImpl2('test2');
  test.printName();
}

abstract class TestInterface {
  String name;
  
  TestInterface(this.name);
  
  void printName();
}

class TestImpl1 implements TestInterface {
  String name;
  
  TestImpl1(this.name);
  
  void printName() {
    print('Test1 : ${this.name}');
  }
}

class TestImpl2 implements TestInterface {
  String name;
  
  TestImpl2(this.name);
  
  void printName() {
    print('Test2 : ${this.name}');
  }
}
```


## Generic(제네릭)
다른 언어에 비해 제네릭 사용이 간편하다.
```dart
void main() {
  SpecificID<String> id1 = SpecificID('test');
  id1.printIdType();
  
  SpecificID<int> id2 = SpecificID(10);
  id2.printIdType();
}

class SpecificID<T> {
  final T id;
  
  SpecificID(this.id);
  
  void printIdType() {
    print(id.runtimeType);
  }
}
```

