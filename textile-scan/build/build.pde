// Textile Scans © 02/18/2014, Douglas Dollars

// Scanning cloth, tracing its pattern/shape, and using that as a focus for color placement.

HDrawablePool pool;
HColorPool colors;

void setup(){
  size(1200,1200);
  H.init(this).background(#EEEEEE);
  smooth();

  colors = new HColorPool(#FFFFFF,#D4004C,#E13D42,#FEC067,#3EAD99,#3798BB,#1E3662,#333333);

  pool = new HDrawablePool(1);
  pool.autoAddToStage()
    .add(new HShape("frill.svg"))

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .strokeJoin(ROUND)
            .strokeCap(ROUND)
            .noStroke()
            //.strokeWeight(1)
            //.stroke(#333333)

            .loc(width/2, height/2)
            .anchorAt(H.CENTER)

            .rotate( (int)random(8) * 45 ) // hard-locking rotation to 45 degree increments -- figure out which looks best and then lock it in

            //.size( (int)random(50,150) )
            //.size( 600 ) ) // initial sizing
          ;
          d.randomColors(colors.fillOnly()); //.fillOnly();, .strokeOnly();, or .fillAndStroke(); are options
        }
      }
    )
    .requestAll()
  ;

  H.drawStage();
}