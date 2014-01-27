// # Typography2.pde
// Used to generate repeated use of a string in varying font scale and color over a background.

// If using processing.js we need to preload Images and Fonts.
//
// See http://processingjs.org/reference/preload/
// and http://processingjs.org/reference/font/
// for more information.
/* @pjs font="FontFileName.ttf"; */

HColorPool colors;
HDrawablePool pool;

void setup() {
  size(200,200);
  H.init(this).background(#202020);
  smooth();

  colors = new HColorPool(#C92854, #0F4065, #26A3A8, #FFC06E, #D44A4A, #2D312F, #333333);

   PFont type = createFont("DINPro-Bold.otf", 24);

  pool = new HDrawablePool(100);  // The number of objects (below) to render
  // HDrawablePool() can be made pretty interesting if reduced to a small number, such as 2
  pool.autoAddToStage()
    .add (new HText( "Generative art", 24, type ))

    .onCreate (
      new HCallback() {
        public void run(Object obj) {
          HText t = (HText) obj;
          t.fill( colors.getColor() ); // grab a color from the pool
          t.scale( ((int)random(10)*2) + 1 );
          t.anchorAt(H.CENTER);
          t.loc( (int)random(width), (int)random(height) );
        }
      }
    )

    .requestAll()
  ;

  H.drawStage();
  noLoop();
}

void draw() {}