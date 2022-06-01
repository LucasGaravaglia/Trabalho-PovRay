#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
// //Atividade2
camera{
    location <-50, 35, 0>
    look_at <0,15, 0>
}
light_source{ <100, 100, 100> White }
light_source{ <-100, 100, -100> White }
plane{ y, -15
    pigment{ White }
}
plane{<0,1,0>,1 hollow
       texture{
        pigment{ bozo turbulence 0.92
          color_map {
           [0.00 rgb <0.2, 0.3, 1>*0.5]
           [0.50 rgb <0.2, 0.3, 1>*0.8]
           [0.70 rgb <1,1,1>]
           [0.85 rgb <0.25,0.25,0.25>]
           [1.0 rgb <0.5,0.5,0.5>]}
          scale<1,1,1.5>*2.5
          translate<1.0,0,-1>
          }// end of pigment
        finish {ambient 1 diffuse 0}
        }// end of texture
        scale 10000
     }// end of plane

// X
box { 
    <0, 0, 0>, 
    <1000, 1, 1>
    pigment{Blue}
}
// Y
box { 
    <0, 0, 0>, 
    <1, 1000, 1>
    pigment{Red}
}
// Z
box { 
    <0, 0, 0>, 
    <1, 1, 1000>
    pigment{Green}
}

#declare pneu = union{
  // Borracha do pneu
  difference{
    union {
      torus {
        22, 5 // major radius, minor radius
         texture{ pigment{ color rgb<1,1,1>*0.15}
           normal { bumps .5 scale .005}
           finish { diffuse .9 phong .2}}
        rotate z*90
        translate <5, 16, 0> // <x, y, z> 
      }
      cylinder {
        <0,15,0>,<10,15,0>,23 
         texture{ pigment{ color rgb<1,1,1>*0.15}
           normal { bumps .5 scale .005}
           finish { diffuse .9 phong .2}
           }
      }
    }
    cylinder {<-3,15,0>,<13,15,0>,20 texture {Silver_Metal}}
  }
  // Parte metalica no centro
  difference{
    union {
      difference{
        cylinder {<0,15,0>,<10,15,0>,20 texture {Silver_Metal}}
        cylinder {<-1,15,0>,<1,15,0>,18 texture {Silver_Metal}}
      }
      cone{<2,15,0>, 15, <-1,15,0>, 12 texture {Silver_Metal}}
    }
    difference{
      union{
          cylinder {<-40,16,0>,<50,16,0>, 4 texture {pigment{Black}}}
          cone{<-2,19,0>, 2, <-2,23,0>, 3 texture {pigment{Black}}}
          cone{<-2,23,0>, 3, <-2,27,0>, 2 texture {pigment{Black}}}
          cone{<-2,13,0>, 2, <-2,8,0>, 3 texture {pigment{Black}}}
          cone{<-2,8,0>, 3, <-2,3,0>, 2 texture {pigment{Black}}}
          cone{<0,16,3>, 2, <0,16,8>, 3 texture {pigment{Black}}}
          cone{<0,16,8>, 3, <0,16,12>, 2 texture {pigment{Black}}}
          cone{<0,16,-3>, 2, <0,16,-8>, 3 texture {pigment{Black}}}
          cone{<0,16,-8>, 3, <0,16,-12>, 2 texture {pigment{Black}}}
      }
      union{
          cylinder {<1,15,0>,<8,15,0>, 30 texture {pigment{Black}}}
          cylinder {<-3,15,0>,<-8,15,0>, 30 texture {pigment{Black}}}
      }
    }
  }  
}

#declare suporte = union{
  intersection {
  sphere {<2, 2, 9>, 9}
  difference {
    box { 
        <0, 0, 0>, <2, 10, 10>
        pigment{Black}
    }
    sphere {<2, 2, 9>, 6}
  }
}

}



object{ suporte translate <0, 0, 0> }
// object{ pneu translate <0, 0, 0> }
// object{ pneu translate <-200, 0, 0>  scale<-1,1,1>}
// object{ pneu translate <0, 0, 100> }
// object{ pneu translate <-200, 0, 100>  scale<-1,1,1>}
