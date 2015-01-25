public class God {
  public static Human[] create(){
     //code
     Man man = new Man("Adam");
     Woman woman= new Woman("Eve");
     Human[] human = {man, woman};

     return human;
  }
}
//code
class Human{
  public Human(String called)
  {
    String name= called;

  }

}

class Man extends Human{

}

class Woman extends Human{

}

