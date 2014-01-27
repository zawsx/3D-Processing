// # Portraits
// Used for an idea of drawing a face from a pixel-reference for color data

// Idea: Using an underlying layer for color-point reference and re-drawing atop those spaces
// Idea: Mask over original photo and mask-paint out for clarity
// Idea: Render one out with very small boxes and then layer it atop one made with larger boxes

HRect d;
HPixelColorist colors;

void setup(){
  size(815,984);
  H.init(this).background(#202020);
  smooth();

   //H.add(new HImage("bm1.jpg")); // make a background image

  colors = new HPixelColorist("bm1.jpg"); // specified what is colored
// can append .fillOnly(), .strokeOnly();, or .fillAndStroke(); above to affect those

  for (int i = 0; i<1000; i++){
    d = new HRect();
    d
      .loc( (int)random(width), (int)random(height) ) // the random location
      .strokeWeight(3) // 3px stroke
      //.noStroke() // can also specify no stroke
      .stroke( colors.getColor( d.x(), d.y() ) )
      .fill( colors.getColor( d.x(), d.y() ), 100 ) // final value is the alpha
      //.alpha( (int)random(75,95) ) // set a global alpha for both the fill and stroke
      .size( (int)random(50,125) )
      .rotate( (int)random(360) )
      .anchorAt(H.CENTER)
    ;
    colors.applyColor(d);
    H.add(d);
  }

  //   for (int i = 0; i<100000; i++){
  //   d = new HRect();
  //   d
  //     .loc( (int)random(width), (int)random(height) ) // the random location
  //     .strokeWeight(3) // 3px stroke
  //     //.noStroke() // can also specify no stroke
  //     .stroke( colors.getColor( d.x(), d.y() ) )
  //     .fill( colors.getColor( d.x(), d.y() ), 100 ) // final value is the alpha
  //     .alpha( (int)random(75,95) ) // set a global alpha for both the fill and stroke
  //     .size( (int)random(2,10) )
  //     .rotate( (int)random(360) )
  //     .anchorAt(H.CENTER)
  //   ;
  //   colors.applyColor(d);
  //   H.add(d);
  // }

  H.drawStage();
}