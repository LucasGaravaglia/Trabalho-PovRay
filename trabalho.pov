#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
// //Atividade2
camera{
    location <-150, 300, 150>
    look_at <0, 80, 80>
}
light_source{ <-150, 300, 150> White }
// light_source{ <-100, 100, -100> White }
plane{ y, -50
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


// box { <0, 0, 0>,  <1000, 1, 1> pigment{Blue} }// X
// box { <0, 0, 0>,  <1, 1000, 1> pigment{Red}  }// Y
// box { <0, 0, 0>,  <1, 1, 1000> pigment{Green}}// Z

#declare Green_Metal = texture {pigment{color rgb <0, 1, 0>} finish { ambient 0.35 brilliance 2 diffuse 0.3 metallic specular 0.80 roughness 1/20 reflection 0.1}}

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

#declare parte_suporte = union{
  difference{
    difference {
      difference {
        difference {
          difference {
            union {
              torus {16, 3 texture{ pigment{ Black}} rotate z*90 translate <1, 30, 19>}
              box {<-1, 0, 0>, <5, 27, 6> pigment{Black}}
              box {<-1, 44, 15>, <5, 48, 30> pigment{Black}} 
            }
            box {<-3, 0, 6>, <9, 26, 40> pigment{Black}}
          }
          box {<-3, 15, 20>, <8, 44, 40> pigment{Black}}
        }
        box {<-3, 30, 30>, <8, 50, 35> pigment{Black}}
      }
      box {<-4, -1, -1>, <0, 70, 70> pigment{Black}}
    }
    box {<2, -1, -1>, <8, 70, 70> pigment{Black}}
  }
}

#declare suporte = union {
  object{ parte_suporte translate <0, 0, 0> }
  object{ parte_suporte translate <4, 0, 0> }
}

#declare parafuso_pneu = difference {
  cylinder {<0, 0, 0>, <0, 0, 2>, 1 texture {pigment {Gray}}}
  cylinder {<0, 0, -1>, <0, 0, 3>, 0.5 texture {pigment {Gray}}}
}

#declare roda_suporte = union {
  object{ suporte translate <-3, 10, -25> rotate <0, -90, 0> }
  object{ pneu translate <0, 0, 0> }
  cylinder {<9, 16, 0>, <26, 16, 0>, 2 texture {Metal}}
  object{ parafuso_pneu translate <20.3, 15, -4> }
  object{ parafuso_pneu translate <23.5, 15, -4> }
  object{ parafuso_pneu translate <20.3, 18, -4> }
  object{ parafuso_pneu translate <23.5, 18, -4> }

  object{ parafuso_pneu translate <20.3, 15, 2> }
  object{ parafuso_pneu translate <23.5, 15, 2> }
  object{ parafuso_pneu translate <20.3, 18, 2> }
  object{ parafuso_pneu translate <23.5, 18, 2> }
}

#declare apoio_motores = union {
  difference {
    box {<0, 0, 0>, <10, 5, 30> pigment{Gray}}
    box {<1, 1, -10>, <9, 4, 40> texture{Metal}}
  }
  difference {
    box {<0, 0, 35>,<10, 5, 90> pigment{Gray} }
    box {<1, 1, 20>,<9, 4, 100> texture{Metal} }
    rotate <-30, 0, 0> translate <0, -17, 0>
  }
}

#declare eixo_apoio_motor = union {
  box {<-1, 3, 1.5>,<3, 4, 6> pigment{Green} }
  box {<-1, 3, -1.5>,<3, 4, -6> pigment{Green} }

  box {<0, 0, 3>,<3, 3, 4> texture{Green_Metal} }
  box {<0, 0, -3>,<3, 3, -4> texture{Green_Metal} }
  difference{
    difference{
      cylinder {<1, 0, 0>, <2, 0, 0>, 3 texture{Green_Metal}}
      cylinder {<0, 0, 0>, <3, 0, 0>, 2.5}
    }
    box {<-2, -1.5, -3>,<5, 1.5, 5> pigment{Black} }
  }
  
  difference{
    cylinder {<0, 0, 0>, <2, 0, 0>, 4 texture{Green_Metal}}
    cylinder {<-1, 0, 0>, <3, 0, 0>, 3}
  }
  difference{
    cylinder {<0, 0, 0>, <2, 0, 0>, 2.5 texture{Silver_Metal}}
    cylinder {<-1, 0, 0>, <3, 0, 0>, 2.3}
  }
  difference{
    cylinder {<0, 0, 0>, <2, 0, 0>, 1.5 texture{Silver_Metal}}
    cylinder {<-1, 0, 0>, <3, 0, 0>, 1}
  }
  difference{
    cylinder {<0, 0, 0>, <2, 0, 0>, 2.3 pigment{Black}}
    cylinder {<-1, 0, 0>, <3, 0, 0>, 1.5}
  }
  cylinder {<-2, 0, 0>, <3, 0, 0>, 1 texture{Metal}}
}

#declare eixo_apoio_motor_parafuso = union{
  object{ eixo_apoio_motor translate <0, 0, 0> }
  cylinder {<1, 2, 5>, <1, 3, 5>, 0.8}
  cylinder {<1, 2, -5>, <1, 3, -5>, 0.8}
}

#declare apoio_motor_completo = union {
  difference{
    object{ apoio_motores translate <-10, 0, -80> rotate <0,180,0>}
    object{ eixo_apoio_motor_parafuso translate <-3, 30, 0> }
  }
  difference{
    object{ apoio_motores translate <0, 0, -75> }
    object{ eixo_apoio_motor_parafuso translate <-3, 30, 0> }
  }
  object{ eixo_apoio_motor_parafuso translate <-4, 30, 0> }
  object{ eixo_apoio_motor_parafuso translate <11, 30, 0> }
  
}

#declare motor_dupla = union {
  object{ apoio_motor_completo translate <0, 60, 70> }
  object{ roda_suporte translate <0, 0, 0> }
  object{ roda_suporte translate <0, 0, 145> }

}
// object{ suporte translate <-3, 10, -25> rotate <0, -90, 0> }

object{ motor_dupla translate <0, 0, 0> }
object{ motor_dupla translate <-200, 0, 0> scale<-1,1,1>}

// object{ apoio_motores translate <0, 0, 0> }

// object{ roda_suporte translate <0, 0, 0> }
// object{ roda_suporte translate <-200, 0, 0>  scale<-1,1,1>}
// object{ roda_suporte translate <0, 0, 100> }
// object{ roda_suporte translate <-200, 0, 100>  scale<-1,1,1>}
