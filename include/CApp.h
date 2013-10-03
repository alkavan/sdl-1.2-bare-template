/*
 *  SDL 1.2 C++ Template
 *  Copyright (C) 2013  Igal Alkon
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#ifndef CAPP_H
#define CAPP_H

#include <SDL.h>

class CApp
{
	public:
		CApp();
		virtual ~CApp();
		int OnExecute();

	public:
	  bool OnInit();
		void OnEvent(SDL_Event* Event);
		void OnLoop();
		void OnRender();
		void OnCleanup();

	private:
		bool Running;
		SDL_Surface* Surf_Display;
};

#endif // CAPP_H
