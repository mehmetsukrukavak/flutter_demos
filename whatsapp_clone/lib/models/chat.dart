class Chat {
  String name;
  String message;
  String time;
  String avatarUrl;

  Chat({this.name, this.message, this.time, this.avatarUrl});

  
}

List<Chat> fakeData = [
    Chat(
        name: "Mehmet",
        message: "Merhaba",
        time: "23:26",
        avatarUrl:
            "https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-1/p240x240/21077572_10155640166168703_6585971894591477764_n.jpg?_nc_cat=103&_nc_ht=scontent-vie1-1.xx&oh=b419a4844d4c1719e2d8efc1a03764cd&oe=5D6E4249"),
    Chat(
        name: "Esra",
        message: "Merhaba Naber?",
        time: "23:27",
        avatarUrl:
            "https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-1/p240x240/21077572_10155640166168703_6585971894591477764_n.jpg?_nc_cat=103&_nc_ht=scontent-vie1-1.xx&oh=b419a4844d4c1719e2d8efc1a03764cd&oe=5D6E4249"),
    Chat(
        name: "Kırpık",
        message: "Merhaba Naber? :):)",
        time: "23:28",
        avatarUrl:
            "https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-1/p240x240/21077572_10155640166168703_6585971894591477764_n.jpg?_nc_cat=103&_nc_ht=scontent-vie1-1.xx&oh=b419a4844d4c1719e2d8efc1a03764cd&oe=5D6E4249"),
  ];
