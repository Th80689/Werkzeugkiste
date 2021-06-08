//Greenscreen in 
// https://www.dukelearntoprogram.com//course1/example/index.php

// Variablen: Vordergrund, Hintergrund, output

var fgImg = new SimpleImage("drewRobert.png");
var bgImg = new SimpleImage("dinos.png");

var outImg = new SimpleImage(fgImg.getWidth(), fgImg.getHeight());

// loop - für jedes Pixel

  // wenn "ausreichend" grün - für Output durch Hintergrund-Pixel ersetzen

  // wenn nicht - in Output übernehmen

//
return outImg;


// Test-Bild: 20 * 20 Bild-Ausschnitt machen

var fgImg = new SimpleImage("drewRobert.png");

var tstImg = new SimpleImage(100,1);

for (var pixel of tstImg.values()) {
   var p = fgImg.getPixel(pixel, 20);
   print "Pixel: " + pixel + "Werte: " + p;
    //    tstImg.setPixel() =
}


var fgImg = new SimpleImage("drewRobert.png");

var tstImg = new SimpleImage(20,4);

for (var pixel of tstImg.values()) {
   var p = fgImg.getPixel(pixel.getX() + 320, pixel.getY() +500);
   print("Pixel X: " + pixel.getX() + " Y: " + pixel.getY() + " p: " + p);
    //    tstImg.setPixel() =
}

