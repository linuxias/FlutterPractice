Dart 언어의 기본적인 문법을 간략히 정리한다.

## 변수
### 변수 선언

변수선언예약어 변수명 = 초기화 
ex) var name = "Linuxias";

```dart
void main() {
  var name = "Linuxias";
  print(name);
}
```

### 변수 타입
- 정수 : int
- 실수 : double
- 불리언 : bool
- 문자열 : String
- 유추형변수타입 : var
  - 입력되는 값을 통해 변수형 타입을 유추한다.
- dynamic
  - var와 유사하지만, var은 선언 시 유추된 변수형 타입으로 정의되지만, dynamic은 선언 이후에도 다른 타입의 변수를 입력할 수 있따.

### Nullable / Non-nullable
```dart
void main() {
  String name = 'Test';
  name = null   // 에러
  String? name2 = 'Test2';
  name2 = null  // null이 입력 가능
}
```

### Final
final로 선언된 변수는 변경될 수 없다.

```dart
void main() {
  final String name = 'Test';
  name = 'final'   // 에러
  const String name2 = 'Test2';
  name2 = 'const'  // 에러
}
```

final와 const는 var의 변수타입까지 포함되어 있기에 변수타입선언을 생략할 수 있다.

```dart
final name = 'Test'  // final var name = 'Test' 와 동일
const name = 'Test'  // const var name = 'Test' 와 동일
```

const와 final의 차이는 const는 빌드타임에 값을 알고 있어야 하지만 final은 빌드타임에 값을 몰라도 된다.
빌드 진행 시 const는 런타임에 알 수 있는 값은 가질 수 없다. 그렇기 떄문에 const 변수에 런타임 중 정의되는 값을 선언할 수 없다.


## 연산자
### ??= 대입연산자
null 인 경우에만 변수를 할당하고, 그 외에는 무시한다. 즉 Nullable 변수에 null이 할당된 경우에만 값 대입이 실행된다.
```dart
int? num = 1;
print(num);  // 1
num ??= 3;
print(num); // 1
num = null;
num ??= 3;
print(num); // 3
```

## 자료 컨테이너
### List
List는 선언한 타입에 대한 값을 순서대로 입력할 수 있다. List에 입력된 값은 인덱스를 이용하여 접근할 수 있따. 인덱스는 0부터 시작한다.
```dart
List<int> numbers = [1,2,3,4,5];
print(numbers[0]); // 1
print(numbers[3]); // 4

// List의 길이는
numbers.length

// 추가는
numbers.add()

// 제거는
numbers.remove(3) // 3을 제거
```

### Map
key, value 자료구조이다. key와 value가 항상 매치되어 관리된다.

```dart
Map<String, int> dictionary = {
  'Test' : 1,
  'Test2' : 2
};

dictionary.remove('Test');
print(dictionary)  // (Test2, 2)
```
key를 이용하여 value를 가져오거나 수정, 삭제등을 할 수 있다. 하지만 value를 이용하여 key를 얻어오거나 하는 방식은 map 자체에서 제공하지 않는다.


### Set
Set은 중복처리가 자동으로 되는 자료구조이다. 중복된 값을 추가해도 값으로 새로이 추가되진 않는다.

```dart
final Set<String> names = {
  'Test',
  'Test1',
  'Test2'
};

print(names)  // {Test, Test1, Test2}
names.add('Test1')
print(names)  // {Test, Test1, Test2}
names.remove('Test')
print(names)  // {Test1, Test2}
print(names.contains('Test')  // false 
```

## 함수
### Optional Paramter
함수 파라미터 중 필수로 전달하지 않아도 되는 파라미터를 설정할 수 있다. 이러한 파라미터를 Optional Paramter라고 한다. 해당 파라미터를 설정하는 방법은 대괄호를 이용한다.

추가로 Optional Parameter는 초기화가 필수이다. Optional Paramter를 전달하지 않을 시 어떤 값으로 지정되어야 할 지 추론할 수 없기 때문이다.

```dart
void main() {
  testFunc(10);
}

testFunc(int x, [int y = 2, int z = 3]) {
  print(x + y + z) // 15
}
```

### Named Parameter
Named paramter는 이름이 있는 파라미터이다. 각각의 이름이 있기 때문에 파라미터 전달 시 순서가 중요하지는 않다.

Named paramter를 선언하는 방법은 `required` 예약어를 사용하는 것이다. 사용 시 파라미터들을 `{ }` 로 묶어줘야한다.

```dart
void main() {
  testFunc(z:30, x:10, y:20); // Named parameter 
}

testFunc({
  required int x, 
  required int y, 
  required int z}) {
  print(x + y + z) // 60
}
```

### Named + Optional parameter
```dart
void main() {
  testFunc(x:10, y:20); // Named parameter 
}

testFunc({
  required int x, 
  required int y, 
  int z = 30}) {
  print(x + y + z) // 60
}
```

### Arrow function
Arrow function은 함수 구현 부가 한 줄일 떄 `{}` 대신 => 를 이용하여 구현부를 작성할 수 있다. 예를 들어 두 수의 합을 구하는 함수에서는 아래와 같이 변경이 가능하다.
```dart
int sumTwoNumber(int x, int y) {
  return x + y;
}

// Arrow function
int sumTwoNumber(int x, int y) => x + y;
```

### Typedef
Typedef 은 함수형을 간단하게 정의하여 사용할 수 있다.
> typedef 함수명 = 반환값 Function(파라미터);

```dart
void main() {
  Operation operation = add;
  int result = operation(10, 20);
  print(result) // 30
}

typedef Operation = int Function(int x, int y);

int add(int x, int y) => x + y;
```

