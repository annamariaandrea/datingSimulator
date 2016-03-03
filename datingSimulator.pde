//ciao

int numprofile = 3;
PImage [] profile = new PImage [numprofile];
int profile_counter = 0;

int x = 500;
int start_x =500;
float xspeed = 80;
float xdir = 0; //0 for still, -1 for left, 1 for right
PImage heartbutton;
int counter =0;

void setup () {
  background (68,45,237);
  size(1280, 720);
  heartbutton = loadImage("heartbutton.png");
  
   for (int i = 0; i < profile.length; i++){
     String profileName = "frame-" + nf(i, 4)+ ".png";
     profile[i]=loadImage (profileName); 
   }
}
  
void draw(){
  background (68,45,237);
  stroke(237,0,0);
  strokeWeight (10);
  noFill();
  
  x += xspeed * xdir;
  
  if (x < -300 || x > 1280) {
      x = start_x;
      profile_counter++;
      if (profile_counter >= numprofile) profile_counter = 0;
      xdir = 0;
  }

  if (profile_counter < numprofile - 1) {
      image (profile [profile_counter + 1], start_x, 195);
   }
   else { 
     image (profile [0], start_x, 195);
   }
  image (profile [profile_counter], x, 195);


   rect (499,195, 304,400);
   fill(255);
   ellipse (585,602, 100,100);
   ellipse (710,602, 100,100);
   image (heartbutton, 682,582);

}


void keyPressed() {
  if (key == 'a'){
    xdir = -1;
  }else if (key=='d'){
    xdir = 1;
  }
}
  