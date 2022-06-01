#include "colors.inc"
// //Atividade2
camera{
    location <100, 100, -100>
    look_at 0
    angle 45
}
light_source{ <500, 500, 0> White }
plane{ y, -100
    pigment{ White }
}

difference{
    intersection{
        box { 
            <-2.5, -2.5, -2.5>, 
            <2.5, 2.5, 2.5>
            pigment{Red}
        }
        sphere { 
            <0, 0,0>, 
            3.35
            pigment{Blue}
            }

    }
    union{
        cylinder {<-5,0,0>, <5,0,0>, 1.5 pigment { Green }}
        cylinder {<0,-5,0>, <0,5,0>, 1.5 pigment { Green }}
        cylinder {<0,0,-5>, <0,0,5>, 1.5 pigment { Green }}
    }
}

