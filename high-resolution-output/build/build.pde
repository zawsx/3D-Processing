// Allow high-resoltion (multiplied/scaled) output compared to what is on screen.
// Particularly effective when looking to generate pieces larger than display resolution.

HDrawablePool pool;
HColorPool colors;

void setup(){
  size(600,600); // base stage size
  H.init(this).background(H.CLEAR); // transparent background
  smooth();

  colors = new HColorPool(#FF0000, #EE0000, #DD0000, #CC0000);

  pool = new HDrawablePool(25);
  pool.autoAddToStage()
    .add(new HShape("svg1.svg"))
    .add(new HShape("svg2.svg"))

    .layout(
      new HGridLayout()
      .startX(25)
      .startY(25)
      .spacing(110,110)
      .cols(5)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d.randomColors(colors.fillOnly());
        }
      }
    )
    .requestAll()
  ;

  saveHiRes(2); // scaling factor passed to saveHiRes
  noLoop(); // kill the display loop
}

void draw() {
  H.drawStage();
}

void saveHiRes(int scaleFactor) {
  // scale the base stage size by the scaleFactor through Processing graphics lib
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);

  beginRecord(hires);
  hires.scale(scaleFactor);

  if (hires == null) {
    H.drawStage(); // no value? Just draw the regular resolution
  } else {
    H.stage().paintAll(hires, false, 1); // PGraphics, uses3D, alpha
  }

  endRecord();
  hires.save("output/render.png");
}