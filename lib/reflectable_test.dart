import 'package:reflectable/mirrors.dart';
import 'package:data_cache_bug/main.dart';
class ReflectTest {

  void invokingCapabilityTest(){
    A x = new A(10);
    // Reflect upon [x] using the const instance of the reflector:
    InstanceMirror instanceMirror = reflector.reflect(x);
    int weekday = new DateTime.now().weekday;
    // On Fridays we test if 3 is greater than 10, on other days if it is less
    // than or equal.
    String methodName = weekday == DateTime.friday ? "greater" : "lessEqual";
    // Reflectable invocation:
    print(instanceMirror.invoke(methodName, [3]));

  }
}

@reflector // This annotation enables reflection on A.
class A {
  final int a;
  A(this.a);
  greater(int x) => x > a;
  lessEqual(int x) => x <= a;
}
