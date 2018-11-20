import controlP5.*;

private ControlP5 cp5;
private Slider xSlider;
private Slider ySlider;
private Slider zSlider;
private Slider sizeSlider;

private int angleX;
private int angleY;
private int angleZ;
private int size;

void setup(){
  size(320, 240, P3D);
  stroke(255);
  rectMode(CENTER);
  
  cp5 = new ControlP5(this);
  xSlider = cp5.addSlider("angleX").setPosition(10, 10).setRange(-360, 360).setValue(-25);
  ySlider = cp5.addSlider("angleY").setPosition(10, 20).setRange(-360, 360).setValue(-25);
  zSlider = cp5.addSlider("angleZ").setPosition(10, 30).setRange(-360, 360).setValue(0);
  sizeSlider = cp5.addSlider("size").setPosition(10, 40).setRange(0, 100).setValue(50);
  cp5.addButton("reset").setPosition(10, 50).addListener(new ControlListener(){
   @Override
   public void controlEvent(ControlEvent evt){
     xSlider.setValue(-25);
     ySlider.setValue(-25);
     zSlider.setValue(0);
     sizeSlider.setValue(50);
   }
  });
  
}

void draw(){
  clear();
  lights();
  
  int hw = width / 2;
  int hh = height / 2;
  
  pushMatrix();
  translate(hw, hh, 0);
  rotateX(radians(angleX));
  rotateY(radians(angleY));
  rotateZ(radians(angleZ));
  box(size);
  popMatrix();
  
}
