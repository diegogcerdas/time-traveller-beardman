boolean bought[] = new boolean[5];
int chosen;
int previousChosen;
boolean showStore = false;

PImage S[]= new PImage[12];
PImage charIcon[]= new PImage[5];

ControlP5 CPstore;
void storeSetup() {
  showStore = true;
  CPstore = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 10);
  if(chosen==1)
    charIcon[1]=S[2];
  else
    charIcon[1]=S[1];
  for(int i=2; i<5; i++){
    if(!bought[i])
      charIcon[i]=S[i*3-1];
      else if(chosen==i)
        charIcon[i]=S[i*3-2];
      else
        charIcon[i]=S[i*3-3];
  }

  CPstore.addButton("basicButton")
    .setLabel("")
    .setFont(font)
    .setImage(charIcon[1])
    .setPosition(width/2-400, height/2-175)
    .setSize(175, 201)
    .setColorBackground(color(173, 216, 230));
  ;

  CPstore.addButton("char2")
    .setLabel("")
    .setFont(font)
    .setImage(charIcon[2])
    .setPosition(width/2-190, height/2-175)
    .setSize(175, 201)
    ;

  CPstore.addButton("char3")
    .setLabel("")
    .setFont(font)
    .setImage(charIcon[3])
    .setPosition(width/2+20, height/2-175)
    .setSize(175, 201)
    ;
    
  CPstore.addButton("char4")
    .setLabel("")
    .setFont(font)
    .setImage(charIcon[4])
    .setPosition(width/2+230, height/2-175)
    .setSize(175, 201)
    ;


  CPstore.addButton("back")
    .setLabel("back")
    .setFont(font)
    .setImage(back)
    .setPosition(79, 65)
    .setSize(291, 91)
    ;

  CPstore.addButton("fakeButton1")
    .setSize(0, 0)
    .setLabel(""); 
  CPstore.addButton("fakeButton2")
    .setSize(0, 0)
    .setLabel("");  
  CPstore.addButton("fakeButton3")
    .setSize(0, 0)
    .setLabel("");  
  CPstore.addButton("fakeButton4")
    .setSize(0, 0)
    .setLabel("");
  CPstore.addButton("fakeButton5")
    .setSize(0, 0)
    .setLabel("");  
      CPstore.addButton("fakeButton6")
    .setSize(0, 0)
    .setLabel("");  
      CPstore.addButton("fakeButton7")
    .setSize(0, 0)
    .setLabel("");  
      CPstore.addButton("fakeButton8")
    .setSize(0, 0)
    .setLabel("");  
      CPstore.addButton("fakeButton9")
    .setSize(0, 0)
    .setLabel("");  
  textAlign(CENTER, CENTER);
}

public void basicButton() {
  if(chosen!=1){
    CPstore.getController("basicButton").setImage(S[2]); 
    updateChosen();
    chosen=1;
    p = new Player(163, 120, 240, 1000);
  }
  updateItems();
  
}

public void char2() {
  if(!bought[2]&&money>=100){
    bought[2]=true;
    updateMoney(-100);
  }
  if(chosen!=2&&bought[2]){
    charIcon[2]=S[4];
    CPstore.getController("char2").setImage(charIcon[2]);    
    updateChosen();
    chosen=2;
    p = new Player(163, 120, 240, 1000);
  }
  updateItems();
}

public void char3() {
  if(!bought[3]&&money>=200){
    bought[3]=true;
    updateMoney(-200);
  }
  if(chosen!=3&&bought[3]){
    charIcon[3]=S[7];
    CPstore.getController("char3").setImage(charIcon[3]);    
    updateChosen();
    chosen=3;
    p = new Player(163, 120, 240, 1000);
  }
  updateItems();
}

public void char4() {
  if(!bought[4]&&money>=500){
    bought[4]=true;
    updateMoney(-500);
  }  
  if(chosen!=4&&bought[4]){
    charIcon[4]=S[10];
    CPstore.getController("char4").setImage(charIcon[4]);  
    updateChosen();
    chosen=4;
    p = new Player(163, 120, 240, 1000);
  }
  updateItems();
}

public void updateChosen(){
  previousChosen=chosen;
  switch(previousChosen){
    case 1:
      CPstore.getController("basicButton").setImage(S[1]); 
      break;
    case 2:
      CPstore.getController("char2").setImage(S[3]); 
      break;
    case 3:
      CPstore.getController("char3").setImage(S[6]); 
      break;
    case 4:
      CPstore.getController("char4").setImage(S[9]); 
      break;
  }
      
  
}


public void back() {
  showStore = false;
  CPstore.getController("basicButton").remove();
  CPstore.getController("char2").remove();
  CPstore.getController("char3").remove();
  CPstore.getController("char4").remove();
  CPstore.getController("back").remove();
  startScreenSetup();
}

void readMoney() {
  BufferedReader reader = createReader("textFiles/data.txt");
  try {
    money = int(reader.readLine());
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void readItems() {
  BufferedReader reader = createReader("textFiles/items.txt");
  try {
    chosen= int(reader.readLine());
    for(int i=2; i<5; i++)
    bought[i]= boolean(reader.readLine());
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}

void updateItems() {
  PrintWriter output = createWriter("textFiles/items.txt"); 
  output.println(chosen);  
  for(int i=2; i<5; i++){
    output.println(bought[i]);  
  }
  output.flush();
  output.close();  

}

void updateMoney(int gain) {    
  PrintWriter output = createWriter("textFiles/data.txt"); 
  money+=gain;
  output.println(money);
  output.flush();
  output.close();
}
