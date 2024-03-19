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

int[] fontSize = {280, 14, 12};
int[] fontColor = {240, 180};

float radiusMultiplier = 100; // Multiplier for percentage-based radius
float minRadius = 300; // Minimum radius for points
float maxRadius = 200; // Maximum radius for points
float Radius = 200;
float radius = 300;
PVector[] points;
color[] categoryColors = {#FFC0CB, #FFE5B4, #ADD8E6, #F0FFF0, #E6E6FA, #FFDAB9, #87CEEB, #FFFFE0, #E6E6FA, #90EE90, #B0E0E6, #FFDAB9, #C8A2C8, #AFEEEE, #FFFFCC, #F0DC82};
int[] kind;


Table table;
int numRows, numColumns;

// Colors
color background = color(30);
color foreground = color(225);

// Result of search keywords
List<String> selectedKeywords = new ArrayList();

// Entered text
String textValue = "";

// Save the movies of different year
//Map<Integer, ArrayList<Movie>> map = new HashMap<Integer,ArrayList<Movie>>();
//List<List<PVector>> listAll = new ArrayList<>();

Map<String, Movie> map = new HashMap<>();

ArrayList<Movie> list = new ArrayList<>();

void setup() {
  size(1250, 800, P3D);
  font = createFont("Arial", 100);
  cam = new PeasyCam(this, 1000);
  // cam.setMinimumDistance(50);
  // cam.setMaximumDistance(800);
  cp5 = new ControlP5(this);

  loadData();
  //drawInfo();
  constructGUI();
}

void draw() {
  background(background);
  selectedKeywords.clear();

    pushMatrix();
    drawPoints();

    popMatrix();

  //drawAxis();
    drawGUI();

}
