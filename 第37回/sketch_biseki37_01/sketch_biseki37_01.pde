float tm = 200.0;
int rn = 40;
int tn = 80;
float rs = 2*tm/rn;
float ts = 2*PI/tn;

float f(float t) {
  return cos(t)*sin(t)*tm;
}

void setup() {
  size(1000, 1000, P3D);
}

boolean axis=true;
boolean xy = false;
boolean xy2 = false;
boolean y2x = true;
boolean graph = true;
boolean rotation = true;
float rotationAngle=0;
boolean cameraAngle=true;

void keyPressed() {
  if (key=='a') {
    axis = !axis;
  }
  if (key=='s') {
    xy = !xy;
    xy2 = !xy2;
  }
  if (key=='g') {
    graph = !graph;
  }
  if (key=='r') {
    rotationAngle = frameCount * PI / 200;
    rotation = !rotation;
  }
  if (key=='c'){
    cameraAngle = !cameraAngle;
  }
}

void draw() {
  //print((frameCount * PI / 200)+":");
  background(255); // 背景を白に設定
  lights(); // 照明を追加
  pushMatrix();
  translate(width/2, height/2, 0); // キャンバスの中心に移動
  if(cameraAngle){
    rotateX(-PI/6); // X軸回転
  }
  else {
    rotateX(-PI/2); // X軸回転
  }
  rotateY(frameCount * PI / 200); // X軸回転
  if (axis) {
    stroke(255, 0, 0);//x軸
    fill(255, 0, 0);
    beginShape();
    vertex(-500, 2, 2);vertex(500, 2, 2);vertex(500, -2, 2);vertex(-500, -2, 2);
    endShape(CLOSE);
    beginShape();
    vertex(-500, -2, 2);vertex(500, -2, 2);vertex(500, -2, -2);vertex(-500, -2, -2);
    endShape(CLOSE);
    beginShape();
    vertex(-500, -2, -2);vertex(500, -2, -2);vertex(500, 2, -2);vertex(-500, 2, -2);
    endShape(CLOSE);
    beginShape();
    vertex(-500, 2, -2);vertex(500, 2, -2);vertex(500, -2, 2);vertex(-500, -2, 2);
    endShape(CLOSE);
    //ｙ軸
    stroke(0, 128, 0);
    fill(0, 128, 0);
    beginShape();    vertex(2, 2, -500);vertex(2, 2, 500);vertex(-2, 2, 500);vertex(-2, 2, -500);    endShape(CLOSE);
    beginShape();    vertex(-2, 2, -500);vertex(-2, 2, 500);vertex(-2, -2, 500);vertex(-2, -2, -500);    endShape(CLOSE);
    beginShape();    vertex(-2, -2, -500);vertex(-2, -2, 500);vertex(2, -2, 500);vertex(2, -2, -500);    endShape(CLOSE);
    beginShape();    vertex(2, -2, -500);vertex(2, -2, 500);vertex(2, 2, 500);vertex(2, 2, -500);    endShape(CLOSE);
    //ｚ軸
    stroke(0, 0, 0);
    fill(0, 0, 0);
    beginShape();    vertex(2, -500, 2);vertex(2, 500, 2);vertex(-2, 500, 2);vertex(-2, -500, 2);    endShape(CLOSE);
    beginShape();    vertex(-2, -500, 2);vertex(-2, 500, 2);vertex(-2, 500, -2);vertex(-2, -500, -2);    endShape(CLOSE);
    beginShape();    vertex(-2, -500, -2);vertex(-2, 500, -2);vertex(2, 500, -2);vertex(2, -500, -2);    endShape(CLOSE);
    beginShape();    vertex(2, -500, -2);vertex(2, 500, -2);vertex(2, 500, 2);vertex(2, -500, 2);    endShape(CLOSE);
  }
  if (xy) {
    float zz=tm/2;
    //x+y=0
    stroke(0, 0, 255);
    fill(0, 0, 255);
    beginShape();    vertex(500, -zz-1, -500);vertex(500, -zz+1, -500);vertex(-500, -zz+1, 500);vertex(-500, -zz-1, 500);    endShape(CLOSE);
  }
  if (xy2) {
    float zz=tm/2;
    stroke(0, 0, 255);
    fill(0, 0, 255);
    beginShape();//x軸
    vertex(500, zz+1, 500);
    vertex(500, zz-1, 500);
    vertex(-500, zz-1, -500);
    vertex(-500, zz+1, -500);
    endShape(CLOSE);
  }
  if (y2x) {
    float zz=tm*2/5;
    //x+y=0
    stroke(0, 0, 255);
    fill(0, 0, 255);
    beginShape();    vertex(250+1, -zz-1, -500+1);vertex(250+1, -zz+1, -500+1);vertex(-250+1, -zz+1, 500+1);vertex(-250+1, -zz-1, 500+1);    endShape(CLOSE);
    beginShape();    vertex(250+1, -zz-1, -500-1);vertex(250+1, -zz+1, -500-1);vertex(-250+1, -zz+1, 500-1);vertex(-250+1, -zz-1, 500-1);    endShape(CLOSE);
    beginShape();    vertex(250-1, -zz-1, -500-1);vertex(250-1, -zz+1, -500-1);vertex(-250-1, -zz+1, 500-1);vertex(-250-1, -zz-1, 500-1);    endShape(CLOSE);
    beginShape();    vertex(250-1, -zz-1, -500+1);vertex(250-1, -zz+1, -500+1);vertex(-250-1, -zz+1, 500+1);vertex(-250-1, -zz-1, 500+1);    endShape(CLOSE);
  }
  if (graph) {
    for (int ri=0; ri<rn; ri++) {
      float r0=rs*ri;
      float r1=rs*(ri+1);
      for (int ti=0; ti<tn; ti++) {
        float t0=ts*ti;
        float t1=ts*(ti+1);
        stroke(128);
        fill(255);
        beginShape();
        vertex(r0*cos(t0), f(t0), r0*sin(t0));
        vertex(r0*cos(t1), f(t1), r0*sin(t1));
        vertex(r1*cos(t1), f(t1), r1*sin(t1));
        vertex(r1*cos(t0), f(t0), r1*sin(t0));
        endShape(CLOSE);
      }
    }
  }
  popMatrix();
  saveFrame("framesF/######.png");
  if (frameCount==400){
    exit();
  }
}
