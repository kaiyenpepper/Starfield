Particle[] bob = new Particle[100];
HappyBday[] boba = new HappyBday[100];
Jacob[] bobe = new Jacob[100];
//exploding boolean
boolean explode = false;

void setup()
{
  size(500,500);
  for(int i = 0; i < bob.length; i++){
    bob[i] = new Particle();
  }
  for(int i = 0; i < boba.length; i++){
    boba[i] = new HappyBday();
  }
  for(int i = 0; i < bobe.length; i++){
    bobe[i] = new Jacob();
  }

}
void draw()
{
  background(#A5D6FF);
  //present draw
  fill(#6181F0);
  noStroke();
  present();
  bow();
  //explosion
  if(explode == true){
    fill(#A5D6FF);
    rect(0,0,500,500);
    newBow();
    newPresent();
    newWrap();
    for(int i = 0; i < bob.length; i++){
      bob[i].show();
      bob[i].move();
    }
    for(int i = 0; i < boba.length; i++){
      boba[i].show();
      boba[i].move();
    }
    for(int i = 0; i < bobe.length; i++){
      bobe[i].show();
      bobe[i].move();
    }
  }
}

void mousePressed(){
  explode = true;
  fill(#A5D6FF);
  rect(0,0,500,500);
  for(int i = 0; i < bob.length; i++){
    bob[i] = new Particle();
  }
  for(int i = 0; i < boba.length; i++){
    boba[i] = new HappyBday();
  }
  for(int i = 0; i < bobe.length; i++){
    bobe[i] = new Jacob();
  }
  newBow();
  newPresent();
  newWrap();
}

class Particle
{
  double myX, myY, myAngle, mySpeed, myRotation;
  int myColor;
  Particle(){
    myX = 220;
    myY = 220;
    myAngle = myRotation = Math.random()*60;
    mySpeed = Math.random()*20;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  
  void show(){
    stroke(myColor);
    fill(myColor);
    translate((float)myX,(float)myY);
    rotate((float)myRotation);
    rect(0,0,2,8);
    rotate(-(float)myRotation);
    translate(-(float)myX,-(float)myY);
  }
  
  void move(){
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    myRotation += .1;
  }
}

class HappyBday extends Particle//inherits from Particle
{
  HappyBday(){
    myX = 220;
    myY = 220;
    myAngle = Math.random()*10*Math.PI;
    mySpeed = Math.random()*20;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  
  void show(){
    strokeWeight(5);
    fill(myColor);
    textSize(20);
    text("Happy Birthday", (float)myX,(float)myY);
  }
}

class Jacob extends Particle//inherits from Particle
{
  Jacob(){
    myX = 220;
    myY = 220;
    myAngle = Math.random()*7;
    mySpeed = Math.random()*20;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  
  void show(){
    strokeWeight(5);
    fill(myColor);
    textSize(20);
    text("Jacob", (float)myX,(float)myY);
  }
}



void present(){
    //top quad
  fill(#14B1FC);
  quad(160-25,195-25, 275-25,185-25, 390-25,195-25, 275-25,210-25);
  fill(#1486FC);
  //top leftside
  quad(160-25,195-25, 275-25,210-25, 275-25,245-25, 160-25,225-25);
  //top rightside
  fill(#146EFA);
  quad(275-25,210-25, 275-25,245-25, 390-25,225-25, 390-25,195-25);
  fill(#146BFC);
  //bottom left
  quad(165-25,225-25, 275-25,245-25, 275-25,380-25, 165-25,350-25);
  //bottom right
  fill(#1444FC);
  quad(275-25,245-25, 275-25,380-25, 385-25,355-25, 385-25,225-25);
}

void bow(){
  fill(#FFB41C);
  //bowtie
  //leftwrap
  quad(275-25,190-25, 210-25,201-25, 240-25,205-25, 275-25,200-25);
  fill(#FCCB14);
  quad(210-25,201-25, 240-25,205-25, 240-25,372-25, 210-25,364-25);
  //rightwrap
  fill(#FFB41C);
  quad(275-25,190-25, 340-25,201-25, 310-25,205-25, 275-25,200-25);
  fill(#FCCB14);
  quad(340-25,201-25, 310-25,205-25, 310-25,373-25, 340-25,366-25);
  //bow
  //2nd bow loop
  fill(#F7EB5A);
  noStroke();
  quad(275-25,190-25, 270-25,155-25, 250-25,157-25, 260-25,185-25);
  bezier(275-25,190-25, 253,155, 253,145, 270-25,155-25);
  fill(#FFCD03);
  bezier(265-25,180-25, 240-25,180-25, 243-25,130-25, 265-25,180-25);
  //first bow loop
  fill(#F7EB5A);
  quad(210-25,185-25, 268-25,190-25, 268-25,180-25, 220-25,170-25);
  fill(#FFCD03);
  bezier(270-25,180-25, 260-25,180-25, 240-25,170-25, 220-25,170-25);
  //left end
  bezier(220-25,195-25, 230-25,205-25, 260-25,200-25, 275-25,190-25);
  //2nd loop pt 2
  bezier(210-25,185-25, 230-25,198-25, 260-25,197-25, 265-25,190-25);
  fill(#F7EB5A);
  bezier(275-25,190-25, 260-25,185-25, 230-25,195-25, 210-25,185-25);
  //3rd bow loop
  fill(#F7EB5A);
  quad(275-25,190-25, 310-25,153-25, 330-25,160-25, 278-25,195-25);
  fill(#FFCD03);
  bezier(295-25,184-25, 350-25,140-25, 330-25,170-25, 295-25,184-25);
  fill(#F7EB5A);
  bezier(275-25,190-25, 295-25,160-25, 305-25,155-25, 310-25,153-25);
  //4th bow loop
  fill(#F7EB5A);
  quad(275-25,190-25, 330-25,170-25, 336-25,187-25, 275-25,196-25);
  fill(#EDC80E);
  bezier(300-25,180-25, 338-25,167-25, 340-25,167-25, 300-25,180-25);
  bezier(280-25,190-25, 290-25,180-25, 295-25,185-25, 300-25,180-25);
  bezier(275-25,195-25, 300-25,197-25, 325-25,197-25, 336-25,187-25);
  fill(#F7EB5A);
  //bow right end
  quad(280-25,185-25, 324-25,198-25, 325-25,215-25, 280-25,196-25);
  bezier(280-25,185-25, 285-25,180-25, 340-25,195-25, 350-25,230-25);
  fill(#EDC80E);
  bezier(280-25,196-25, 283-25,200-25, 315-25,200-25, 325-25,215-25); 
  //bow left end pt 2
  fill(#FFCD03);
  bezier(203-25,175-25, 206-25,185-25, 207-25,195-25, 220-25,195-25);
  //bow middle
  fill(#FCD614);
  rect(265-25,180-25, 18,16, 222,135, 111,140);
}

void newPresent(){
  //top quad
  fill(#1457FA);
  triangle(160-25,195-50, 275-25,185-50, 275-25,210-50);
  fill(#1421FA);
  triangle(275-25,185-50, 390-25,195-50, 275-25,210-50);
  fill(#1486FC);
  //top leftside
  quad(160-25,195-50, 275-25,185-50, 275-25,185-90, 160-25,195-80);
  //top rightside
  fill(#146EFA);
  quad(275-25,185-50, 275-25,185-90, 390-25,195-80, 390-25,195-50);
  //top inside
  fill(#220BBC);
  quad(275-25,185-50, 300,180-40, 250,190-45, 200,180-40);
  
  fill(#146BFC);
  //bottom left
  quad(165-25,225-25, 275-25,245-25, 275-25,380-25, 165-25,350-25);
  //bottom right
  fill(#1444FC);
  quad(275-25,245-25, 275-25,380-25, 385-25,355-25, 385-25,225-25);
  
  fill(#1444FA);
  //inside left
  triangle(165-25,225-25, 275-25,245-60, 275-25,380-160);
  fill(#1714FA);
  //inside right
  triangle(275-25,245-60, 275-25,380-160, 385-25,225-25);
  //inside
  fill(#220BBC);
  quad(250,207, 210,213, 250,220, 290,213);
}

void newBow(){
  //2nd bow loop
  fill(#F7EB5A);
  noStroke();
  quad(275-25,190-75, 270-25,155-75, 250-25,157-75, 260-25,185-75);
  bezier(275-25,190-75, 253,155-50, 253,145-50, 270-25,155-75);
  fill(#FFCD03);
  bezier(265-25,180-75, 240-25,180-75, 243-25,130-75, 265-25,180-75);
  //first bow loop
  fill(#F7EB5A);
  quad(210-25,185-75, 268-25,190-75, 268-25,180-75, 220-25,170-75);
  fill(#FFCD03);
  bezier(270-25,180-75, 260-25,180-75, 240-25,170-75, 220-25,170-75);
  //left end
  bezier(220-25,195-75, 230-25,205-75, 260-25,200-75, 275-25,190-75);
  //2nd loop pt 2
  bezier(210-25,185-75, 230-25,198-75, 260-25,197-75, 265-25,190-75);
  fill(#F7EB5A);
  bezier(275-25,190-75, 260-25,185-75, 230-25,195-75, 210-25,185-75);
  //3rd bow loop
  fill(#F7EB5A);
  quad(275-25,190-75, 310-25,153-75, 330-25,160-75, 278-25,195-75);
  fill(#FFCD03);
  bezier(295-25,184-75, 350-25,140-75, 330-25,170-75, 295-25,184-75);
  fill(#F7EB5A);
  bezier(275-25,190-75, 295-25,160-75, 305-25,155-75, 310-25,153-75);
  //4th bow loop
  fill(#F7EB5A);
  quad(275-25,190-75, 330-25,170-75, 336-25,187-75, 275-25,196-75);
  fill(#EDC80E);
  bezier(300-25,180-75, 338-25,167-75, 340-25,167-75, 300-25,180-75);
  bezier(280-25,190-75, 290-25,180-75, 295-25,185-75, 300-25,180-75);
  bezier(275-25,195-75, 300-25,197-75, 325-25,197-75, 336-25,187-75);
  fill(#F7EB5A);
  //bow middle
  fill(#FCD614);
  rect(265-25,180-75, 18,16, 222,135, 111,140);
}

void newWrap(){
  //leftwrap
  fill(#FCCB14);
  quad(210-25,201+7, 240-25,205+9, 240-25,372-25, 210-25,364-25);
  quad(210-25,201+7-103, 240-25,205+9-115, 240-25,205+9-75, 210-25,364-25-197); 
  //rightwrap
  quad(340-25,201+7, 310-25,205+9, 310-25,373-25, 340-25,366-25);
  quad(340-25,201+7-103, 310-25,205+9-115, 310-25,205+9-75, 340-25,364-25-197); 
}
