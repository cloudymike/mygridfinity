/*
Basic information:
-This is a file to create visually appealing and space-efficient socket organizers. Enter information in the paratmeters using the customizer - More details below and in the comments for each parameter. 
-Set the number of holes with the slider, and also any hole set to zero diameter will be skipped. 
- I have made a few files with pre-entered data for common sizes and diameters for a given set (1/4" drive metric sockets for example). If using these as a starting point for customization, skip certain holes not in your specific set by setting the diameter to zero. 
-Holes start at bottom left or right (depending on primary label side). So generally you would start with the smallest size and continue to the largest.
-Select demnsioning scheme and then adjust parameters in appropriate section.
    -Gridfinity will fit the selected sockets in the smallest size possible based on the base size selected (I recommend 21mm bosses for this part, which will fit with the 42mm standard gridfinity base)  
    -"Round to Increments" will do similar but no gridfinity base will be built, it will just round the block size to round numbers if desired. Ie. an increment of 25mm. 
    -"Input Exact Size" is exactly as stated. You may have to tweak to make sure everything fits in the size entered. 
-"Text_Primary_Side" Notes:
    -Setting left and right label side also controls Left-to-Right vs       Right-to-Left building of hole pattern. 
    -With 4 columns this only sets order of hole population. "right" builds left to right, bottom to top (with labels on the right). Setting the "Text_Primary_Side" to the left moves labels to the left side and builds the hole pattern from right to left, bottom to top. This works out so that labels will read in the same order as the input list in most cases. 
    -If using 4 wide grid though, pay attention to label output; if you want to read ascending or descending you may have to manually rearrange list. 
-Use other parameters as needed and as described below and in the customizer.

*/

//=============PRIMARY PARAMETERS=============// 


/* [Layout] */

//Turn off holes with this slider or setting a socket's diameter to zero at the end in the socket data sections
Number_of_Holes=12; //[4:1:20]

//How many columns? (2-4, 2 is recommended)
Number_of_Columns=2; //[2:1:4]

//Fits holes together as close as possible vs constant spacing based on largest hole size.
Dynamic_Spacing=true; 


//Labels on left or right side. This Also controls Left-to-Right vs Right-to-Left ordering of holes and location of first hole.
Text_Primary_Side="right"; // ["right", "left"]

//Labels Extruded above block or flush. If flush, it will be hard to see text in preview. If using flush text, export as stl (not .3mf as there is currently a bug) and then split into parts in the slicer. 
Flush_Text=false;

//Depth of socket holes.
Hole_depth = 16; 

//Overall height is depth plus base thickness. 
Min_Base_Thickness=2;

//Socket diameters inputted are actual measured size; this is added as cleance to each hole. 
Hole_Clearance=.75; 

Corner_Radius=4.25; //if gridfinity, force 4.25 corner radius

//Select sizing scheme and then adjust parameters in appropriate section below. (Recommended: Gridfinity or "Round to Increments")
Block_Sizing_Method="Gridfinity"; // ["Gridfinity","Round to Increments","Input Exact Size"]


/* [Block Size - Gridfinity] */
//21mm bases fits in 42mm gridfinity base and will result in less wasted space. 
gridfinity_size= 21;// [21,42]


/* [Block Size - Increments] */
Width_increment=20; //round block width to increments of...
Length_increment=20; //round block length to increments of...


/* [Block Size - Input] */
Input_length=100; //Input desired length.
Input_width=20; //Input desired width.


 
/* [Tune Size] */

//Adds extra vertical spacing between rows. This dimension is hole edge to label line, so it is added twice. 
vert_spacing=.1; 

//Adds extra horizontal spacing between rows.
lateral_spacing=2; 

//Adds extra to block size, if gridfinity or "Round to Increments" sizing, this will not change size until the it reaches the next increment. 
Add_length=0;
//Adds extra to block size...see above.
Add_width=0;


/* [Label Options] */
//Font Size (height in mm)
text_size=5; 


line_thick=.8; //.8

//Text and line depth (recommended 2-3 * layer height)
text_depth=.4; 

//Spacing out from edge of hole to start of text column. (recommend minimum of 3)
Text_space_x=3; 

//Clearance around hole to nearest lines (recommend 0.5-1.5)
line_space=1; 

//If you want to move or rotate the text, enable this and tweak the options in the section below. Most people won't need to touch any of these. 
Enable_Advanced_Text_Options=false; 



/* [Advanced_Text_Options] */

Text_Rotation=0; //[-90:15:90]

shift_text_x=0;

shift_text_y=0;

//Input positive or negative values (Makerworld implementation currently does not support negative, I assume this bug will be fixed at some point.
underline_len_adjust=0;

V_text_align="center";// ["bottom", "center", "top"] 

H_text_align="center";// ["left", "center", "right"] 

Shift_Pattern_x=0;
Shift_Pattern_y=0;





//3/8" metric sockets
/* [Socket data 1-4] */
Hole_1_Diameter=17.2;
Label_1="6"; 
Hole_2_Diameter=17.2;
Label_2="7"; 
Hole_3_Diameter=17.2;
Label_3="8"; 
Hole_4_Diameter=17.2;
Label_4="9"; 
/* [Socket data 5-8] */
Hole_5_Diameter=17.2;
Label_5="10"; 
Hole_6_Diameter=17.2;
Label_6="11"; 
Hole_7_Diameter=17.2;
Label_7="12"; 
Hole_8_Diameter=18.8;
Label_8="13";
/* [Sockets data 9-12] */
Hole_9_Diameter=19.8;
Label_9="14"; 
Hole_10_Diameter=22.1;
Label_10="15"; 
Hole_11_Diameter=22.1;
Label_11="16"; 
Hole_12_Diameter=23.8;
Label_12="17"; 
/* [Socket data 13-16] */
Hole_13_Diameter=25.8;
Label_13="18"; 
Hole_14_Diameter=25.8;
Label_14="19"; 
Hole_15_Diameter=0;
Label_15="15"; 
Hole_16_Diameter=0;
Label_16="16"; 
/* [Socket data 16-20] */
Hole_17_Diameter=0;
Label_17="17"; 
Hole_18_Diameter=0;
Label_18="18"; 
Hole_19_Diameter=0;
Label_19="19"; 
Hole_20_Diameter=0;
Label_20="20"; 




    
    


//=============Secondary Parameters (left off of customizer settings) =============//
{
line_angle_multiplier=.5; //affects angle of line, is a muliplier on diamter, .5 to 1 is ideal
wall_clearance=.5;
text_gap=.01; //to create seperate bodies
//Font="Arial:style=Bold";
Font="Ubuntu Sans:style=ExtraBold";
DIY_Bold=0.0;  //Offset text to make thicker 
line_width_multiplier=text_size*.75; //Length of text Underline, might have to be tweaked with different fonts.
visual_clearance=0.01;  //for scad quick rendering 

$fa = 8;
$fs = 0.25;
$fn=50;

}


{//=============Setup and Determine Conditional Variables
holes0=[ 
[Hole_1_Diameter,Label_1] ,[Hole_2_Diameter,Label_2],
[Hole_3_Diameter,Label_3],[Hole_4_Diameter,Label_4],

[Hole_5_Diameter,Label_5],[Hole_6_Diameter,Label_6],
[Hole_7_Diameter,Label_7],[Hole_8_Diameter,Label_8],

[Hole_9_Diameter,Label_9],[Hole_10_Diameter,Label_10],
[Hole_11_Diameter,Label_11],[Hole_12_Diameter,Label_12],

[Hole_13_Diameter,Label_13],[Hole_14_Diameter,Label_14],
[Hole_15_Diameter,Label_15],[Hole_16_Diameter,Label_16],

[Hole_17_Diameter,Label_17],[Hole_18_Diameter,Label_18],
[Hole_19_Diameter,Label_19],[Hole_20_Diameter,Label_20],
    ];
    
    
    
    
    
//first pass to remove any with zero diam
holes1=[for (a=[0:len(holes0)-1]) if (holes0[a][0]!=0) holes0[a]];
//second pass for quick layout by setting max number
holes=[for (b=[0:len(holes1)-1]) if (b<Number_of_Holes) holes1[b]];

//echo(holes);


Vtext= Enable_Advanced_Text_Options==true ? V_text_align:"bottom";
Rot_text= Enable_Advanced_Text_Options==true ? Text_Rotation:0;
flush_text_adjust= Flush_Text==true? -text_depth:0;
text_adjust= Enable_Advanced_Text_Options==true ? [shift_text_x,shift_text_y,0]:[0,0,0];
underline= Enable_Advanced_Text_Options==true ? true:false;

Shift_x=Enable_Advanced_Text_Options==true ? Shift_Pattern_x:0;
Shift_y=Enable_Advanced_Text_Options==true ? Shift_Pattern_y:0;

block_height=Hole_depth+Min_Base_Thickness;

Enable_Gridfinity_Base= Block_Sizing_Method=="Gridfinity" ? true:false; //
x_increment= Enable_Gridfinity_Base==true ? gridfinity_size:Width_increment  ;
y_increment= Enable_Gridfinity_Base==true ? gridfinity_size:Length_increment;

patternx=Number_of_Columns; //[2:1:4]

block_radius= Enable_Gridfinity_Base==true ? 4.25:Corner_Radius  ;

max_dia= max([for(a=[0:len(holes)-1]) holes[a][0]]); //max dia used for lateral spacing
max_label_length= max([for(a=[0:len(holes)-1]) len(holes[a][1])]);

minimum_spacing=(text_size*2+line_space*4 + line_thick*2)*1.1;

spacing_adder_y=line_space*2+line_thick+vert_spacing;

patterny=ceil(len(holes)/patternx);
pattern_grid=[patternx,patterny];
spacing_grid=[max_dia+lateral_spacing+Hole_Clearance,max_dia+spacing_adder_y+Hole_Clearance];

text_column_r=(patternx-1)*(max_dia+lateral_spacing)+(max_dia/2+Text_space_x); 
text_column_l=-(max_dia/2+Text_space_x);

text_column_p= Text_Primary_Side=="right"? text_column_r:text_column_l;
text_column_s= Text_Primary_Side=="right"? text_column_l:text_column_r;
l_r= Text_Primary_Side=="right" ? 0:-1; 

static_text_offset_low=-max_dia/2; //dynamic values are based on max hole size in row
static_text_offset_high=0; //dynamic values are based on max hole size in row

data=create_data(holes);

//label info for determining overall size
num_labels= patternx==2 ? 1:2;
left_label= patternx==2 && Text_Primary_Side=="right" ? 0:1;

//x overall size and center
x_total=(max_dia+Hole_Clearance+lateral_spacing)*(patternx-1) + max_dia+Hole_Clearance + num_labels*(Text_space_x+max_label_length*line_width_multiplier)+Add_width+.5;
x_min=(max_dia+Hole_Clearance)/2+(left_label)*(Text_space_x+max_label_length*line_width_multiplier)+Add_width/2+.25;
x_center=x_total/2-x_min+Shift_x;

//x_center=x_total/2-x_min+Shift_x;

//y overall size and center
//y minus is unerline point 2y/3y
first_hole_data=data[0];
first_row_max_dia= first_hole_data[2] >= minimum_spacing ? first_hole_data[2] : minimum_spacing;
y_min= Dynamic_Spacing==true ?
    -first_row_max_dia/2-line_space-line_thick -Add_length/2: -max_dia/2-line_space-line_thick-Add_length/2;

//y plus is top row center position + half max diam of that row (data[-1])
last_hole_data=data[len(data)-1];
y_max= Dynamic_Spacing==true ? 
    center_pos(last_hole_data[3],data)[1]+(last_hole_data[2]+Hole_Clearance)/2+line_space+Add_length/2
    : center_pos(last_hole_data[3],data)[1]+(max_dia +Hole_Clearance)/2+line_space+Add_length/2;

y_total=y_max-y_min;
y_center=(y_total)/2+Shift_y;

//applying overall size to different sizing methods
grid_y_reqd=ceil(y_total/y_increment);
gridy = grid_y_reqd; //have to input number not formula into gridfinity modules

grid_x_reqd=ceil(x_total/x_increment);
gridx = grid_x_reqd;//have to input number not formula into gridfinity modules

echo(gridx);

block_x= Block_Sizing_Method=="Input Exact Size" ? Input_width:grid_x_reqd*x_increment-wall_clearance ;
block_y= Block_Sizing_Method=="Input Exact Size" ? Input_length:grid_y_reqd*y_increment-wall_clearance ;

if (Block_Sizing_Method=="Input Exact Size")
    assert(Input_length>2*Corner_Radius, "Input size too small or radius too large");
    assert(Input_width>2*Corner_Radius, "Input size too small or radius too large");

}

//===RUN===

//build base block
color("grey")
difference(){
    base_block();    
    translate([0,0,-visual_clearance])
        labels (data,text_gap,text_depth+visual_clearance*2); //this step is removing label area from the base block, offset some to create gap
    sockets(data); 
}
//add back labels
    difference(){
        color("white")
        labels (data,0,text_depth);
        color("grey")
        sockets(data);
    }



{//===FUNCTIONS AND MODULES===
module base_block(){
color("DimGray",1.0) 
    union(){
    linear_extrude(height=block_height)
        rounded_block_2d(block_x,block_y,block_radius);
    if (Enable_Gridfinity_Base==true)
        color("DimGray",1.0)         
                GF_Base(grid_x_reqd, grid_y_reqd, gridfinity_size);
    }
}

module labels(dat,gap,h){
    translate([-x_center,-y_center-y_min,(block_height)]){
        for (i =[0:len(dat)-1]) {
                translate(text_adjust)
                    translate([textpos_x(dat[i]),textpos_y(dat[i]),flush_text_adjust])
                        translate([0,center_pos(dat[i][3],dat)[1],0])
                            rotate([0,0,Rot_text])
                                text_label(dat,gap,i,h);
                translate([0,0,flush_text_adjust])
                    label_line(center_pos(dat[i][3],dat),textpos_x(dat[i]),textpos_y(dat[i]),dat[i],gap,h);
    }}}


module sockets (dat){
    translate([-x_center,-y_center-y_min,(block_height)]){ 
        for (i =[0:len(dat)-1]) 
                translate(concat(center_pos(dat[i][3],dat),-Hole_depth))
                    union(){
                    cylinder(Hole_depth,d=dat[i][0]+Hole_Clearance);
                    translate([0,0,Hole_depth-visual_clearance])
                        cylinder(text_depth+visual_clearance*2,d=(dat[i][0]+line_space*2));
    }}}
    
module rounded_block_2d(length, width,radius)
        offset(radius)
            offset(-radius)
                square([length, width],center=true);
                
module rounded_block_3d(length, width, radius, height)
        linear_extrude(height)
            rounded_block_2d (length, width, radius);
                
    
module text_label(dat,gap,j,hh){
    linear_extrude(hh)
        offset(r=gap)
            offset(r=DIY_Bold)
                text(dat[j][1], size=text_size, valign=Vtext, halign=text_align(textpos_x(data[j])), font=Font);
    }
            
module label_line (center,text_x, text_y,hole_data,gap,hhh){
    x=center[0];
    y=center[1];

    underline_len_default=line_width_multiplier*len(hole_data[1]);
    dir= text_x == text_column_l ? -1:1;
   
    point2d=[x+hole_data[2]*line_angle_multiplier*dir,y+text_y-line_space-line_thick];
    point2u_y=y+text_y-line_space-line_thick;
    point2u=[text_x,point2u_y];
    point2= textpos_y(hole_data)>0 ? point2u:point2d;
      
    point3= Enable_Advanced_Text_Options==false ? [text_x+underline_len_default*dir,point2[1]] : [text_x+underline_len_adjust*dir,point2[1]];
    point4=[point3[0],point3[1]+line_thick];
    
    point5=[point2[0]+line_thick*line_angle_multiplier*dir,point2[1]+line_thick];
    
    point1= textpos_y(hole_data)<0 ? [x,y]: [x,point2u_y]; 
    point6=[point1[0]+line_thick*line_angle_multiplier*dir,point1[1]+line_thick];

    
    points=[point1,point2,point3,point4,point5,point6];
//    echo(points)
    
    linear_extrude(height=hhh)
        offset(r=gap)
            polygon (points);
}
    
function create_data(hl)=
//data=(dia),(label),(max dia in row),(grid pos),
   [for (a =[0:len(hl)-1]) 
       [hl[a][0], hl[a][1],
            //over comlicated way to get max diam in current row 
            max(concat([for (i =[a:a+patternx-1])  //max of relevant numbers from below
                grid_pos(pattern_grid,a)[1]!=grid_pos(pattern_grid,i)[1] ? //if not in same y row OR over max number of holes from slider, give 0
                    0 : 
                        hl[i][0]==undef ? 
                            0: 
                                hl[i][0]>=minimum_spacing ?   //then comepare diam to min dynamic spacing 
                                    hl[i][0] : minimum_spacing                 
                    ])), 
            grid_pos(pattern_grid,a),
            ]];

function textpos_x (hole_data)=
    patternx==2 ?  
        text_column_p
        
    : patternx==3  && Text_Primary_Side=="right" ?
        hole_data[3][0]==0 ? text_column_l : text_column_r
    : patternx==3 && Text_Primary_Side=="left" ? 
        hole_data[3][0]>=1 ? text_column_l : text_column_r       
        
    : patternx==4 ?
        hole_data[3][0]<=1 ? text_column_s : text_column_p
        :0;

function text_align(posx)= //"left" or "right" depending on side where labels are, for alignment not pos
            Enable_Advanced_Text_Options==true ?
                H_text_align
                : posx==text_column_l ? "right" : "left"         
            ;


    
function textpos_y(hole_data)=

    patternx==2 ? 
        hole_data[3][0]==0 ? text_offset_low(hole_data) : text_offset_high(hole_data)

        
    : patternx==3  && Text_Primary_Side=="right" ?
        hole_data[3][0]<=1 ? text_offset_low(hole_data) : text_offset_high(hole_data)
    : patternx==3  && Text_Primary_Side=="left" ?
        hole_data[3][0]<=1 ? text_offset_low(hole_data) : text_offset_high(hole_data)   
        
    : patternx==4 ?
        hole_data[3][0]==1 || hole_data[3][0]==2 ? text_offset_low(hole_data) : text_offset_high(hole_data)
        :0;
        
function text_offset_high (hole_data)=
    Dynamic_Spacing==true ? 
//        hole_data[2]/2-text_size/2: static_text_offset_high; //old formula, label at top of hole
        (hole_data[2]/2 +(-hole_data[2]/2))/2 : static_text_offset_high; //new, label centered
        
function text_offset_low (hole_data)=
    Dynamic_Spacing==true ? 
        -hole_data[2]/2: static_text_offset_low;



function grid_pos (pattern, current_pos)=
    [current_pos < pattern[0]-1 ? //column number
        current_pos:(current_pos)-floor(current_pos/pattern[0])*pattern[0], //column number logic to go 0:max 
    
    floor(current_pos/pattern[0]), //row number
    ]; 

function center_pos (grid_pos,list)= //center of each hole
   Dynamic_Spacing==true ?
        [abs(grid_pos[0]+l_r*(patternx-1))*spacing_grid[0],  
            
            
            //y center 
            grid_pos[1]==0 
                ? 0
                : //if true, do dynamic spacing for everything except first row  y
                Sum(concat([for (b =[grid_pos[1]:-1:0]) (list[b*patternx][2]+spacing_adder_y)],(-list[grid_pos[1]*patternx][2]-spacing_adder_y)/2,(-list[0][2]-spacing_adder_y)/2))] //addition of ypos times that row's largest dia, then minus half for first and last row. 
        : [abs(grid_pos[0]+l_r*(patternx-1))*spacing_grid[0],grid_pos[1]*spacing_grid[1]]; //if false, static spacing y
 

//sum function from here: https://www.reddit.com/r/openscad/comments/j5v5pp/sumlist/    
function SubSum(x=0,Index=0)=x[Index]+((Index<=0)?0:SubSum(x=x,Index=Index-1));
function Sum(x)=SubSum(x=x,Index=len(x)-1);
}


//Gridfinity constants adapted from Kennetek's gridfinity utility (https://www.printables.com/model/274917-gridfinity-rebuilt-in-openscad)
// height of the base
h_base = 5;     
// outside rounded radius of bin
r_base = 4;     
// lower base chamfer "radius"
r_c1 = 0.8;     
// upper base chamfer "radius"
r_c2 = 2.4; 
// outside radii 1
//r_fo1 = 8.5;    
// outside radii 2
r_fo2 = 3.2;
// outside radii 3
r_fo3 = 1.6; 
// bottom thiccness of bin
h_bot = 2.2; 

clearance_big=0.5; //clearance applied to full block
clearance_small=clearance_big/10; //clearance applied to small bosses
clearance_xsmall=clearance_small/10;

module GF_Base(x_bosses, y_bosses, gf_unit) {
    xtot = x_bosses*gf_unit-clearance_big;
    ytot = y_bosses*gf_unit-clearance_big;
    intersection(){
        translate([0,0,-h_base-1])
                rounded_block_3d(xtot+clearance_xsmall, ytot+clearance_xsmall,block_radius+0.001,   h_base+h_bot/2*10);
        linear_pattern(x_bosses, y_bosses, gf_unit) 
        GF_boss(gf_unit);
    }
}

module GF_boss(l) { 
    xsize = l-clearance_small; 
    ysize = l-clearance_small; 
    mirror([0,0,1])
    union() {
        hull() {
            rounded_block_3d(xsize-2*r_c2-2*r_c1, ysize-2*r_c2-2*r_c1,  r_fo3/2, h_base);
            rounded_block_3d(xsize-2*r_c2, ysize-2*r_c2, r_fo2/2, h_base-r_c1);
        }
        hull() {
            rounded_block_3d(xsize-2*r_c2, ysize-2*r_c2, r_fo2/2,r_c2);
            translate([0,0,-h_bot/2])
                rounded_block_3d(xsize, ysize, block_radius, h_bot/2);
            }
    }
}

module linear_pattern(qtyx, qtyy, spacing) {
    translate([-(qtyx-1)*spacing/2,-(qtyy-1)*spacing/2,0])
    for (i = [1:ceil(qtyx)])
        for (j = [1:ceil(qtyy)])
            translate([(i-1)*spacing,(j-1)*spacing,0]) 
            children();
}

