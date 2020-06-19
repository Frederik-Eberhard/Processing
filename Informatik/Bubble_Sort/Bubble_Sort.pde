String S = "";

void setup(){
}

void draw(){
}

String sort(String s){
  boolean done = false;
  while (!done){
    done = true;
    for(int i = 1; i < s.length(); i++){
      char c1 = s.charAt(i-1);
      char c2 = s.charAt(i);
      if(c1 > c2){
        s = swap(i,s);  
        done = false;
      }
    }
  }
  
  return s;
}

String swap(int index, String s){
  char[] cs = new char[s.length()];
  for(int i = 0; i < s.length(); i++){
    cs[i] = s.charAt(i);
  }
  char c1 = cs[index-1];
  char c2 = cs[index];
  cs[index-1] = c2;
  cs[index] = c1;
  s = "";
  for(int i = 0; i < cs.length; i++){
    s += cs[i];
  }
  return s;
}

boolean ausUmgebung(String s){        //UNWICHTIG!! 
  for(int i = 1; i < s.length(); i++){
    if(s.charAt(i-1) == 'k' && s.charAt(i) == 't' || s.charAt(i-1) == 'u' && s.charAt(i) == 'b')
      return true;
  }
  return false;
}

void keyPressed(){
  if(key > 96 && key < 123){
    S += key;
    println(S);
    println(ausUmgebung(S));
    String s = sort(S);
    println(s);
  }
}
