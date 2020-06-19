void setup(){
  String Ver = getVerschlusseltenText();
  String Sch = getSchlussel();
  String Text = entschlussle(Ver,Sch);
  println(Text);
}

String getVerschlusseltenText(){
  return "OHXKESTBZXTUNCHL";
//    return "M";
}

String getSchlussel(){
  return "PORTA";
//    return "N";
}

String entschlussle(String V, String S){
  String T = "";
  for(int i = 0; i < V.length(); i++){
    println("verschlüssselter", V.charAt(i), "schlüssel", S.charAt(i%S.length()));
    T += tausch(V.charAt(i),S.charAt(i%S.length()));
    println("T", T);
  }
  return T;
}

char tausch(char b, char s){     //65-90
  int  t = floor((s - 'A')/2);
  int a = 'N' + (b - 'A') - t;
  int c = 'A' + (b - 'N') + t;
  println("a",a);
  b = char((b < 'N')? (a < 'N')? a+13:a : (c > 'M')? c-13:c); 
  return b;
}
