# Metadata
<html>
  <head>
    <title>xx</title>
  </head>
# Sectioning elements
  <body>
    <h1>XX</h1>
    ..
    <h6>YYYY</h6>
    <div></div>
    <p>xxx</p>
  </body>
</html>

# Semantic elements
<b>bold</b>
<em>emphasize</em>

Link: <a src="link">
Link, der in neuem Fenster geöffnet wird: <a href="http://www.dukelearntoprogram.com/" target="blank_" name="Duke_Link">Duke Learn to Program</a>
Bild: <img src="link">

# Listen
Unordered List <ul> oder Ordered Lists <ol>
List-Items <li>

# Tabellen - mit Header-Zeile
<table>
  <tr>
    <th>Z1</th>
    <th>Z2</th>
  <tr>
    <td>Z1</td>
    <td>Z2</td>
  </tr>
  <tr>
    <td>Z3</td>
    <td>Z4</td>
  </tr>
</table>

# CSS Basics

Kommentare: /*<kommentar>*/
<selector> {
  <property>: <value>;
}
## Selector-Muster
Standard-Tag: <htmlSelector>
class: .<selfGivenNameSelector>
id: #<selfGivenNameSelector>

# JS Basics
## Variablen-Deklaration
var <name> = <value>;
## Object declaration
var <object> = new <name of type to create>("<parameter>")

## Loop Syntax
for (var <variable> of <object>.method()) {
    <to something>
  }



function changeRed(width, height) {
    var picture = new SimpleImage(width, height);
    var red = 0;

    // missing code
  for (var pixel of img.values()) {
    red = width - pixel.getX(); 
    print("X: " + pixel.getX() + " Y: " + pixel.getY());
    pixel.setRed(red);

  }

    return picture;
}

var result = changeRed(20,20);
print(result);



// write your code here


function triColor(imageFile) {
    var img = new SimpleImage(imageFile);
    width = img.getWidth();//
//    print("width: " + width + " 1/3: " + width/3);

  for (var pixel of img.values()) {
          print("Pixel: " + pixel.getX());
      if (pixel.getX() < width/3) {
          pixel.setRed(200);
          print("IF 1");
      }
      if (((width - pixel.getX()) > width/3) && (pixel.getX() < width/3)) {
          pixel.setGreen(255);
          print("IF 2");
      }
      else {pixel.setBlue(255)
          print("ELSE");
      }
  }

    return img;
}

var result = triColor("hilton.jpg");
print(result);




// BlueDevil to YellowDevil

img = new SimpleImage("duke_blue_devil.png");

print(img);

img.getPixel(1,1);

for (var pixel of img.values()) {
      if (pixel.getBlue() == 255) {
          pixel.setRed(255);
          pixel.setGreen(255);
          pixel.setBlue(0);
      }
//  print("Pixel: " + pixel.getX() + " Blau-Wert:" + pixel.getBlue());
}

print(img);