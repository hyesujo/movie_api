class Actor {
  final String name, image;

  Actor({required this.image, required this.name});
}

List<Actor> actors = [actor1, actor2, actor3, actor4, actor5];

Actor actor1 =
    Actor(name: 'George Clooney', image: 'assets/images/actor1.jpeg');
Actor actor2 = Actor(name: 'Mary', image: 'assets/images/actor2.jpeg');
Actor actor3 = Actor(name: 'mike', image: 'assets/images/actor3.jpeg');
Actor actor4 = Actor(name: 'lina', image: 'assets/images/actor4.jpeg');
Actor actor5 = Actor(name: 'taby', image: 'assets/images/actor5.jpeg');
