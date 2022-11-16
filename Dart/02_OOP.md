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
