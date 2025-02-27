module maware.renderable.coloringtextured;

import maware.renderable.textured;

import derelict.sdl2.sdl : SDL_Color, SDL_Texture, SDL_SetTextureColorMod;

/// A Textured, but sets the texture color mode if its color struct has been
/// changed
class ColoringTextured : Textured {

	private SDL_Color previousColor;

	this(SDL_Texture* texture,
		 int w, int h, int x, int y,
		 ubyte r, ubyte g, ubyte b, ubyte a) {

		super(texture, w, h, x, y, r, g, b, a);
		previousColor = color;
	}

	this(SDL_Texture* texture,
		 int w, int h, int x, int y) {

		super(texture, w, h, x, y);
		previousColor = color;
	}

	this(SDL_Texture* texture,
		 int x, int y) {

		super(texture, x, y);
		previousColor = color;
	}
	
	override void render() {
		if (color != previousColor) {
			SDL_SetTextureColorMod(texture,
								   color.r,
								   color.g,
								   color.b);
			previousColor = color;
		}
		super.render();
	}
	
}
