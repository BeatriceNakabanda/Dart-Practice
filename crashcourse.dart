void main() {
//   var scores = [10, 20, 40, 90];
//   var mixed = ["mark", 10, 20];
  List<int> marks = [10,20, 70];
  marks[0] = 15;
  print(marks[0]);
  marks.add(100);
  print(marks.length);
  
  var colors = {"Blue", "orange", "green"};
  Set<String> names = {"Beatrice", "Alice", "Carol"}
  
  
}
void main() {
//for loop
  for(int i = 0; i < 5; i ++){
    print ("The current value of i is $i");
  }
  List<int> scores = [10, 20, 40, 60];
  for(int score in scores){
    print("The score is $score");
  }
  for(int score in scores.where((s) => s > 50)){
    print("The score is $score");
  }
  var planets = {1: "mercury", "two": "venus"}; //map-key value pairs
  print(planets);
  print(planets["two"]);
  planets["three"] = "earth";
  print(planets);
  planets["two"] = "Jupiter";
  print(planets);
  print(planets.containsValue("earth"));
  print(planets.containsKey(1));
  print(planets.remove("two")); //use the key to identify which value to remove not the value
  print(planets.keys); //displays keys
  print(planets.values); //displays the values
  Map<int, String> names ={1:"Jane", 2: "Billy"};
  print(names[1]);
}
//classes
void main() {
  var noodles = MenuItem("Veg noodles", 9.9);
  var pizza = MenuItem("Chicken pizza", 10.5);
  var iceCream = IceCream(["Cockie", "Brownie", "Cashewnuts"], "Vanila Icecream", 2.6);
  
//   print(noodles.title);
//   print(noodles.price);
//   print(pizza.title);
//   print(pizza.price);
  print(noodles.format());
  print(pizza.format());
  print(iceCream.format());
  
}

class MenuItem{
  String title;
  double price;
  
  MenuItem(this.title, this.price);
  
  String format(){
    return "$title --> $price";
  }
  //overide generic dart methods
  String toString(){
    return format();
  }
}

class IceCream extends MenuItem{
  List<String> toppings;
  //setting constructor for new class =>passing the new values of title and price into the parent constructor
//   IceCream(this.flavors, String title, double price): super(title, price);
  IceCream(this.toppings, super.title, super.price);
  
  //method overrriding...these are methods from the parent class
  @override
  String format(){
    var formattedToppings = "Contains:";
    for(final t in toppings){
      formattedToppings = '$formattedToppings $t';
    }
    return "$title -> $price \n $formattedToppings";
  }
}
//Future => Handling asynchronous tasks
// void main() {
// //futures are like promises in js
// //.then happens after the post is done 
//   fetchPost().then((p) { //callback function
//     print(p.title);
//     print(p.userId);
//   });
// }
void main() async{
  final post = await fetchPost();
  print(post.title);
  print(post.userId);
}

//we can also use async and await to achieve the above

Future<Post> fetchPost(){
  const delay = Duration(seconds: 2);
  return Future.delayed(delay, (){
    return Post('my post', 12);
  });
}

class Post{
  String title;
  int userId;
  
  Post(this.title, this.userId);
}
//Fetching data
import 'dart:convert' as convert; //returns json-formated  response
import 'package:http/http.dart' as http;

void main() async{
  final post = await fetchPost();
  print(post.userId);
  print(post.title);
}

//we can also use async and await to achieve the above

Future<Post> fetchPost() async{
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');
  final response = await http.get(url);
  //convert json response body into map
  //dynamic means any type is accepted whether int or string, etc
  Map<String, dynamic> data = convert.jsonDecode(response.body);
  return Post(data["title"], data["userId"]);
}

class Post{
  String title;
  int userId;
  
  Post(this.title, this.userId);
}
