float rm = 200.0;
int rn = 40;
int tn = 60;
float rs = 2*rm/rn;
float ts = PI/2/tn;

float sign(float x){
  if (x==0) return 0;
  else if (x>0) return 1;
  else return -1;
}

float fx(float r, float t){
  if (cos(t)>=0){
    return sqrt(r/rm*cos(t))*rm;
  }
  else {
    return -sqrt(-r/rm*cos(t))*rm;
  }
}

float fy(float t) {
  return cos(t)*sin(t)*rm;
}

float fz(float r, float t){
  //return r*sin(t);
  return r*sin(t);
}

void setup() {
  size(1000, 1000, P3D);
}

boolean axis=true;
boolean xy = true;
boolean graph = true;
boolean parabola = false;

void keyPressed(){
  if (key=='a'){
    axis = !axis;
  }
  if (key=='s'){
    xy = !xy;
  }
}

void draw() {
  background(255); // 背景を白に設定
  lights(); // 照明を追加
  pushMatrix();
  translate(width/2, height/2, 0); // キャンバスの中心に移動
  rotateX(-PI/6); // ななめから
  //rotateX(-PI/2); // ウエから
  rotateY((frameCount+75) * PI / 300); // X軸回転
  //rotateY((mouseX-width/2) * 0.01); // X軸回転
  if (axis) {
    stroke(255, 0, 0);// x軸
    fill(255,0,0);
    beginShape();vertex(-500, 1, 1);vertex(500, 1, 1);vertex(500, -1, 1);vertex(-500, -1, 1);endShape(CLOSE);
    beginShape();vertex(-500, -1, 1);vertex(500, -1, 1);vertex(500, -1, -1);vertex(-500, -1, -1);endShape(CLOSE);
    beginShape();vertex(-500, -1, -1);vertex(500, -1, -1);vertex(500, 1, -1);vertex(-500, 1, -1);endShape(CLOSE);
    beginShape();vertex(-500, 1, -1);vertex(500, 1, -1);vertex(500, 1, 1);vertex(-500, 1, 1);endShape(CLOSE);
    stroke(0, 128, 0);// y軸
    fill(0,128,0);
    beginShape();vertex(1, 1, -500);vertex(1, 1, 500);vertex(-1, 1, 500);vertex(-1, 1, -500);endShape(CLOSE);
    beginShape();vertex(-1, 1, -500);vertex(-1, 1, 500);vertex(-1, -1, 500);vertex(-1, -1, -500);endShape(CLOSE);
    beginShape();vertex(-1, -1, -500);vertex(-1, -1, 500);vertex(1, -1, 500);vertex(1, -1, -500);endShape(CLOSE);
    beginShape();vertex(1, -1, -500);vertex(1, -1, 500);vertex(1, 1, 500);vertex(1, 1, -500);endShape(CLOSE);
    stroke(0);
    fill(0);
    beginShape();vertex(1, -500, 1);vertex(1, 500, 1);vertex(1, 500, -1);vertex(1, -500, -1);endShape(CLOSE);
    beginShape();vertex(1, -500, -1);vertex(1, 500, -1);vertex(-1, 500, -1);vertex(-1, -500, -1);endShape(CLOSE);
    beginShape();vertex(-1, -500, -1);vertex(-1, 500, -1);vertex(-1, 500, 1);vertex(-1, -500, 1);endShape(CLOSE);
    beginShape();vertex(-1, -500, 1);vertex(-1, 500, 1);vertex(-1, 500, 1);vertex(-1, -500, 1);endShape(CLOSE);
  }
  if (xy) {
    for (float xx=0; xx<=1.4; xx+=0.1){
      float n=-1/2/(xx+0.1);
      float mag = sqrt(1+n*n);
      float nx=1/mag;
      float ny=n/mag;
      stroke(0, 0, 255);
      fill(0, 0, 255);
      {
        beginShape();//
        vertex(xx*rm+nx, -rm/2-1, -xx*xx*rm+ny);
        vertex(xx*rm+nx, -rm/2+1, -xx*xx*rm+ny);
        vertex((xx+0.1)*rm+nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm+ny);
        vertex((xx+0.1)*rm+nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm+nx, -rm/2+1, -xx*xx*rm+ny);
        vertex(xx*rm-nx, -rm/2+1, -xx*xx*rm-ny);
        vertex((xx+0.1)*rm-nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm-ny);
        vertex((xx+0.1)*rm+nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm-nx, -rm/2+1, -xx*xx*rm-ny);
        vertex(xx*rm-nx, -rm/2-1, -xx*xx*rm-ny);
        vertex((xx+0.1)*rm-nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm-ny);
        vertex((xx+0.1)*rm-nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm-nx, -rm/2-1, -xx*xx*rm-ny);
        vertex(xx*rm+nx, -rm/2-1, -xx*xx*rm+ny);
        vertex((xx+0.1)*rm+nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm+ny);
        vertex((xx+0.1)*rm-nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
      }
      n=1/2/(xx+0.1);
      mag = sqrt(1+n*n);
      nx=1/mag;
      ny=n/mag;
      {
        beginShape();//
        vertex(-xx*rm+nx, -rm/2-1, -xx*xx*rm+ny);
        vertex(-xx*rm+nx, -rm/2+1, -xx*xx*rm+ny);
        vertex(-(xx+0.1)*rm+nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm+ny);
        vertex(-(xx+0.1)*rm+nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm+nx, -rm/2+1, -xx*xx*rm+ny);
        vertex(-xx*rm-nx, -rm/2+1, -xx*xx*rm-ny);
        vertex(-(xx+0.1)*rm-nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm-ny);
        vertex(-(xx+0.1)*rm+nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm-nx, -rm/2+1, -xx*xx*rm-ny);
        vertex(-xx*rm-nx, -rm/2-1, -xx*xx*rm-ny);
        vertex(-(xx+0.1)*rm-nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm-ny);
        vertex(-(xx+0.1)*rm-nx, -rm/2+1, -(xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm-nx, -rm/2-1, -xx*xx*rm-ny);
        vertex(-xx*rm+nx, -rm/2-1, -xx*xx*rm+ny);
        vertex(-(xx+0.1)*rm+nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm+ny);
        vertex(-(xx+0.1)*rm-nx, -rm/2-1, -(xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
      }
      n=1/2/(xx+0.1);
      mag = sqrt(1+n*n);
      nx=1/mag;
      ny=n/mag;
      stroke(0, 0, 255);
      fill(0, 0, 255);
      {
        beginShape();//
        vertex(-xx*rm+nx, rm/2-1, xx*xx*rm+ny);
        vertex(-xx*rm+nx, rm/2+1, xx*xx*rm+ny);
        vertex(-(xx+0.1)*rm+nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm+ny);
        vertex(-(xx+0.1)*rm+nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm+nx, rm/2+1, xx*xx*rm+ny);
        vertex(-xx*rm-nx, rm/2+1, xx*xx*rm-ny);
        vertex(-(xx+0.1)*rm-nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm-ny);
        vertex(-(xx+0.1)*rm+nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm-nx, rm/2+1, xx*xx*rm-ny);
        vertex(-xx*rm-nx, rm/2-1, xx*xx*rm-ny);
        vertex(-(xx+0.1)*rm-nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm-ny);
        vertex(-(xx+0.1)*rm-nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
        beginShape();//
        vertex(-xx*rm-nx, rm/2-1, xx*xx*rm-ny);
        vertex(-xx*rm+nx, rm/2-1, xx*xx*rm+ny);
        vertex(-(xx+0.1)*rm+nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm+ny);
        vertex(-(xx+0.1)*rm-nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
      }
      n=-1/2/(xx+0.1);
      mag = sqrt(1+n*n);
      nx=1/mag;
      ny=n/mag;
      {
        beginShape();//
        vertex(xx*rm+nx, rm/2-1, xx*xx*rm+ny);
        vertex(xx*rm+nx, rm/2+1, xx*xx*rm+ny);
        vertex((xx+0.1)*rm+nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm+ny);
        vertex((xx+0.1)*rm+nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm+nx, rm/2+1, xx*xx*rm+ny);
        vertex(xx*rm-nx, rm/2+1, xx*xx*rm-ny);
        vertex((xx+0.1)*rm-nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm-ny);
        vertex((xx+0.1)*rm+nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm+ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm-nx, rm/2+1, xx*xx*rm-ny);
        vertex(xx*rm-nx, rm/2-1, xx*xx*rm-ny);
        vertex((xx+0.1)*rm-nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm-ny);
        vertex((xx+0.1)*rm-nx, rm/2+1, (xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
        beginShape();//
        vertex(xx*rm-nx, rm/2-1, xx*xx*rm-ny);
        vertex(xx*rm+nx, rm/2-1, xx*xx*rm+ny);
        vertex((xx+0.1)*rm+nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm+ny);
        vertex((xx+0.1)*rm-nx, rm/2-1, (xx+0.1)*(xx+0.1)*rm-ny);
        endShape(CLOSE);
      }
    }
  }
  if (graph){
    for (int ri=0; ri<rn; ri++) {
      float r0=rs*ri+0.0001;
      float r1=rs*(ri+1)+0.0001;
      for (int ti=0; ti<tn; ti++) {
        float t0=ts*ti;
        float t1=ts*(ti+1);
        stroke(128);
        fill(255);
        beginShape();
        vertex(fx(r0,t0), fy(t0), fz(r0,t0));
        vertex(fx(r0,t1), fy(t1), fz(r0,t1));
        vertex(fx(r1,t1), fy(t1), fz(r1,t1));
        vertex(fx(r1,t0), fy(t0), fz(r1,t0));
        endShape(CLOSE);
        beginShape();
        vertex(-fx(r0,t0), fy(t0), fz(r0,t0));
        vertex(-fx(r0,t1), fy(t1), fz(r0,t1));
        vertex(-fx(r1,t1), fy(t1), fz(r1,t1));
        vertex(-fx(r1,t0), fy(t0), fz(r1,t0));
        endShape(CLOSE);
        beginShape();
        vertex(fx(r0,t0), -fy(t0), -fz(r0,t0));
        vertex(fx(r0,t1), -fy(t1), -fz(r0,t1));
        vertex(fx(r1,t1), -fy(t1), -fz(r1,t1));
        vertex(fx(r1,t0), -fy(t0), -fz(r1,t0));
        endShape(CLOSE);
        beginShape();
        vertex(-fx(r0,t0), -fy(t0), -fz(r0,t0));
        vertex(-fx(r0,t1), -fy(t1), -fz(r0,t1));
        vertex(-fx(r1,t1), -fy(t1), -fz(r1,t1));
        vertex(-fx(r1,t0), -fy(t0), -fz(r1,t0));
        endShape(CLOSE);
      }
    }
  }
  popMatrix();
  //A:通常、B:グラフなし、C:真上、D:ほぼ横から、E:ガイドなし
  saveFrame("framesE/######.png");
  if (frameCount==600){
    exit();
  }

}
