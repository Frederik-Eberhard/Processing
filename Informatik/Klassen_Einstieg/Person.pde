class Person{
  String Name;
  String Vorname;
  int alter;
  
  Person(String Name_, String Vorname_, int alter_){
    Name = Name_;
    Vorname = Vorname_;
    alter = alter_;
  }
  
  void setzeAlter(int n){
    alter = n;
  }
  
  int gibAlter(){
    return alter;
  }
}
