color FG = #ffdead;
color BG = #bb860b;
PImage img;
import processing.sound.*;
SoundFile file ;
Table table;  



void setup() {
  size(900, 900, P3D);
  img = loadImage("DRESS.jpg");
  img.resize(850, 850);
  file = new SoundFile(this, "Marilyn Happy Birthday.mp3");
  file.loop();
  table= loadTable("kimdata.csv", "header");
  
  table.addColumn("2", Table.INT);
  table.addRow();
  table.setInt (9, 2, 323);
 println(table.getInt(9, 2)); 

}
 
void draw() {
  background(BG);
  fill(FG);

  stroke(255, 50);

  float tiles= table.getInt(9, 2);
  float ratio = float(height)/float(width);
  float tileX = map(mouseX, 0, width, 20, table.getInt(9, 2));
  float tileY = ratio * tileX;
  float tileSize = width / tileX ;
  
   for (int y = 0; y < img.height; y += tileSize) {
   for (int x = 0; x < img.width; x += tileSize) {
    color c = img.get(x, y);
    float b = map(brightness(c), 0, 255, 1, 0);
  
   pushMatrix();

   translate(x, y);
       rotate(radians(frameCount));

      rect(0, 0, b * tileSize, b * tileSize);

     
  popMatrix();
      }  
  }
}  
