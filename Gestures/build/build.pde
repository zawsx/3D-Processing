// Gestures © 01/30/2014, Douglas Dollars
// Work for the @thinkITEM Twitter persona takeover

// Credit Gary Lim from the Noun Project http://thenounproject.com/Glimy
// Idea: keep it small, make some colorful, make some gritty black and white
// remove smoothing? What happens?
// work with mass production, find a way to iterate and save out files
// Make a big zip? Upload to S3/share. “Here’s 1000 new pieces”

// Color pool, mostly light/greys (the majority)
// Weight the blue color (#2F57F6) to be something like 1 in 100
// to really have it 'pop'

// find the hand with five arrows aimed inward, raise the count of it
// Set fill as #FFFFFF

// deal also with transparent ones? A secondary loop (after) that places a couple large, darker hands, above the rest


HDrawablePool pool;
HColorPool colors;

void setup(){
	size(1200,1200);
	H.init(this).background(#EEEEEE);
	smooth();

  colors = new HColorPool(
    #FFFFFF,
    #CCCCCC,
    #333333,
    #666666,
    #999999,
    #2F57F6, // hyperlink blue
    #CC0000, // visually-nice red
    #00CC00, // visually-nice blue
    #0000CC // visually-nice green
  );

	pool = new HDrawablePool(50);
	pool.autoAddToStage()
    .add(new HShape("hand_01.svg"))
    .add(new HShape("hand_02.svg"))
    .add(new HShape("hand_03.svg"))
    .add(new HShape("hand_04.svg"))
    .add(new HShape("hand_05.svg"))
    .add(new HShape("hand_06.svg"))
    .add(new HShape("hand_07.svg"))
    .add(new HShape("hand_08.svg"))
    .add(new HShape("hand_09.svg"))
    .add(new HShape("hand_10.svg"))
    .add(new HShape("hand_11.svg"))
    .add(new HShape("hand_12.svg"))
    .add(new HShape("hand_13.svg"))
    .add(new HShape("hand_14.svg"))
    .add(new HShape("hand_15.svg"))
    .add(new HShape("hand_16.svg"))
    .add(new HShape("hand_17.svg"))
    .add(new HShape("hand_18.svg"))
    .add(new HShape("hand_19.svg"))
    .add(new HShape("hand_20.svg"))
    .add(new HShape("hand_21.svg"))
    .add(new HShape("hand_22.svg"))
    .add(new HShape("hand_23.svg"))
    .add(new HShape("hand_24.svg"))
    .add(new HShape("hand_25.svg"))
    .add(new HShape("hand_26.svg"))
    .add(new HShape("hand_27.svg"))
    .add(new HShape("hand_28.svg"))
    .add(new HShape("hand_29.svg"))
    .add(new HShape("hand_30.svg"))
    .add(new HShape("hand_31.svg"))
    .add(new HShape("hand_32.svg"))
    .add(new HShape("hand_33.svg"))
    .add(new HShape("hand_34.svg"))
    .add(new HShape("hand_35.svg"))
    .add(new HShape("hand_36.svg"))
    .add(new HShape("hand_37.svg"))
    .add(new HShape("hand_38.svg"))
    .add(new HShape("hand_39.svg"))
    .add(new HShape("hand_40.svg"))
    .add(new HShape("hand_41.svg"))
    .add(new HShape("hand_42.svg"))
    .add(new HShape("hand_43.svg"))
    .add(new HShape("hand_44.svg"))
    .add(new HShape("hand_45.svg"))
    .add(new HShape("hand_46.svg"))
    .add(new HShape("hand_47.svg"))
    .add(new HShape("hand_48.svg"))
    .add(new HShape("hand_49.svg"))
    .add(new HShape("hand_50.svg"))
    .add(new HShape("hand_51.svg"))
    .add(new HShape("hand_52.svg"))
    .add(new HShape("hand_53.svg"))
    .add(new HShape("hand_54.svg"))
    .add(new HShape("hand_55.svg"))
    .add(new HShape("hand_56.svg"))
    .add(new HShape("hand_57.svg"))
    .add(new HShape("hand_58.svg"))
    .add(new HShape("hand_59.svg"))
    .add(new HShape("hand_60.svg"))
    .add(new HShape("hand_61.svg"))
    .add(new HShape("hand_62.svg"))
    .add(new HShape("hand_63.svg"))
    .add(new HShape("hand_64.svg"))
    .add(new HShape("hand_65.svg"))
    .add(new HShape("hand_66.svg"))
    .add(new HShape("hand_67.svg"))
    .add(new HShape("hand_68.svg"))
    .add(new HShape("hand_69.svg"))
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
						.size( (int)random(50,150) )
						.rotate( (int)random(360) )
						.loc( (int)random(width), (int)random(height) )
						.anchorAt(H.CENTER)
					;
					d.randomColors(colors.fillOnly()); //.fillOnly();, .strokeOnly();, or .fillAndStroke(); are options
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}