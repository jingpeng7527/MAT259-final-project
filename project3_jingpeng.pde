/*************************************************************************************
Mat 259 Project 3 3D Visualization: "movie ratings since 2020 based on IMDb Non-Commercial dataset"               
Tested in Processing 4                                  
                                                     
Author: Jing Peng                       
Supervisor: George Legrady                           

Purpose: Show how to present volume data in a basic 3D environment     

Usage: 1. A mouse left-drag will rotate the camera around the subject.
          2. A right drag will zoom in and out. 
          3. A middle-drag (command-left-drag on mac) will pan. 
          4. A double-click restores the camera to its original position. 
          5. The shift key constrains rotation and panning to one axis or the other.
*************************************************************************************/

import peasy.*;
import controlP5.*;
import java.util.*;

PeasyCam cam;
ControlP5 cp5;

PFont font;


int startYear = 2020;
int endYear = 2023;

float radiusMultiplier = 100; // Multiplier for percentage-based radius
float minRadius = 100; // Minimum radius for points
float maxRadius = 200; // Maximum radius for points
float Radius = 200;
float radius = 300;
PVector[] points;
color[] categoryColors = {#b7e1cd, #d7b5e8, #f4f1bb, #f9d0c4, #a6c8ed};
int[] kind;


Table table;
int numRows, numColumns;

Map<Integer, ArrayList<Movie>> map = new HashMap<Integer,ArrayList<Movie>>();
List<List<PVector>> listAll = new ArrayList<>();

void setup() {
  size(1000, 800, P3D);
  font = createFont("Georgia", 100);
  cam = new PeasyCam(this, 300);
  // cam.setMinimumDistance(50);
  // cam.setMaximumDistance(800);
  cp5 = new ControlP5(this);

  loadData();
}

void draw() {

  background(0,0,0);
  // gui();

  noFill();
  stroke(0);

  // hint(DISABLE_DEPTH_TEST);
  //  cam.beginHUD();
  //  cp5.draw();


  for(int year: map.keySet()){
    
    pushMatrix();
    // translate(x, y, 0);

    drawPoints(year);

    // drawCircleAndText();
    // drawLines(k);
    // drawVertex(k);

    popMatrix();
    //drawLabels();

    
  }

  // cam.endHUD();
  //  hint(ENABLE_DEPTH_TEST);
  

  //if((mouseX<180) & (mouseY<180)) {
  //  cam.setActive(false);
  //} else {
  //  cam.setActive(true);
  //}

}

void gui() {
   hint(DISABLE_DEPTH_TEST);
   cam.beginHUD();
   cp5.draw();
   cam.endHUD();
   hint(ENABLE_DEPTH_TEST);
}
