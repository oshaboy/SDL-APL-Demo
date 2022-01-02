'SDL_Init'⎕NA 'I4 libSDL2-2.0.so|SDL_Init U4'
'SDL_Delay'⎕NA 'libSDL2-2.0.so|SDL_Delay U4'
'SDL_CreateWindow'⎕NA 'P libSDL2-2.0.so|SDL_CreateWindow <0C[] I4 I4 I4 I4 U4'
'SDL_CreateRenderer'⎕NA 'P libSDL2-2.0.so|SDL_CreateRenderer P I4 U4'
'SDL_RenderClear'⎕NA 'I libSDL2-2.0.so|SDL_RenderClear P'
'SDL_RenderPresent'⎕NA 'libSDL2-2.0.so|SDL_RenderPresent P'
'SDL_DestroyRenderer'⎕NA 'libSDL2-2.0.so|SDL_DestroyRenderer P'
'SDL_Quit'⎕NA 'libSDL2-2.0.so|SDL_Quit'
'SDL_DestroyWindow'⎕NA 'libSDL2-2.0.so|SDL_DestroyWindow P'
'SDL_SetRenderDrawColor'⎕NA 'I libSDL2-2.0.so|SDL_SetRenderDrawColor P U1 U1 U1 U1'
'SDL_RenderDrawLine'⎕NA 'I libSDL2-2.0.so|SDL_RenderDrawLine P I4 I4 I4 I4'
'SDL_PollEvent'⎕NA 'I  libSDL2-2.0.so|SDL_PollEvent >{U4 U1[52]} '

∇ main
	SDL_Init 62001
	window←SDL_CreateWindow 'My Window' 0 0 640 480 2
	renderer←SDL_CreateRenderer window ¯1 1
	SDL_SetRenderDrawColor renderer 255 255 255 255
	SDL_RenderClear renderer
	SDL_RenderPresent renderer
	SDL_Delay 1
	mainloop:
		⍝ Generate Color ⍝
		rgba←((?256)-1) ((?256)-1) ((?256)-1) 255
		rgba
		nul←SDL_SetRenderDrawColor renderer,rgba
		⍝ Generate Line Coordinates ⍝
		xy←((?640)-1) ((?480)-1) ((?640)-1) ((?480)-1)
		xy
		nul←SDL_RenderDrawLine renderer,xy
		SDL_RenderPresent renderer
		⍝ Check to see if User Quit ⍝
		eventloop:
			result←(SDL_PollEvent 56) ⍝ 56 is the size of an SDL Event on my machine
			→(result[1]=0)/skp 
			t←(⊃result[2])[1] ⍝ I have no idea why I need ⊃ but it works
			→(t=256)/quit
		→eventloop
		skp:
		SDL_Delay 1
		→mainloop 
	quit:
	'Exit'
	SDL_DestroyRenderer renderer
	SDL_DestroyWindow window
	SDL_Quit
∇

main

