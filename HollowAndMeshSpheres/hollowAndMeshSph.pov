#include "colors.inc"
#include "textures.inc"

/*
**	Camera (window) posicionada em x=0, y=2, z=-5
**	Direcao apontada pelo vetor x=0, y=1, z=2
 */
camera {
	location <0, 2, -5> // <x, y, z>
	look_at  <0, 1,  2> // <x, y, z>
}
/*
**	Cor de fundo
 */
background {
	color Black
}
/*
**	Fonte de luz num ponto
*/
light_source {
	<20, 4, -13> // <x, y, z>
	color Yellow
}
/*
**	Plano com textura em xadrez
 */
plane {
	<0,1,0>, -1
	pigment {
		checker
		White, // checker color 1
		Black, // checker color 2
	}
}
/*
**	Geometria construtiva
**	Difereça entre um cilindro e a intersecção de duas esferas
*/
difference {
	intersection {
		sphere {
			<0,0,0>, 1
			translate -0.5 * x // <x, y, z>
		}
		sphere {
			<0, 0, 0>, 1 // <x, y, z>, radius
			translate 0.5 * x
		}
		pigment {
			Green
		}
		rotate 90 * y
		finish {
			Shiny
		}
	}
	cylinder {
		<0, 0, -1>, <0, 0, 1>, .35 // center of one end, center of other end, radius
		pigment {
			Orange
		}
	}
}
/*
**	Objeto geometrico primitivo, no caso, uma esfera
*/
sphere {
	<0, 1, 2>, 2
	texture {
		pigment {
			White_Marble
			scale 1
		}
		finish {
			Shiny
		}
	}
}
/*
**	Esfera ao fundo
*/
sphere {
	<15, 1, 30>, 2 // <x, y, z>, radius
	texture {
		pigment {
			Orange
		}
		finish {
			Shiny
		}
	}
}
/*
**	Radiancia
*/
fog {
	distance 20
	color rgbt <0.7 0.7 0.7 0.5>
}