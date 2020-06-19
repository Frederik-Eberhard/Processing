import java.util.Vector;
int letter;
char curlet = 'a';
String S = "loremipsumetsolumcumex";

void setup(){
  Vector Text = new Vector();
  Vector Stext = new Vector();
  for(int i = 0; i < S.length(); i++){
    Text.add(S.charAt(i));
  }
  println(Text);
  do{
    int i = getNextLetterPos(Text);
    Stext.add(Text.elementAt(i));
    Text.remove(i);
  }while(Text.size()>0);
  println(Stext);
}

int getNextLetterPos(Vector t){
  for(int i = 0; i < t.size(); i++){
    if((char)t.elementAt(i) == curlet){
      return i;
    }
  }
  curlet = nextlet(curlet);
  return getNextLetterPos(t);
}

char nextlet(char c){
  char ca[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
  for(int i = 0; i < ca.length; i++){
    if(ca[i] == c){
      return ca[i+1];      
    }
  }
  return '!';
}
