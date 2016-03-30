#include "main.h"
#include "SimulatorWin.h"
#include <shellapi.h>
#include "AppDelegate.h"
#include "cocos2d.h"


int APIENTRY _tWinMain(HINSTANCE hInstance,
	HINSTANCE hPrevInstance,
	LPTSTR    lpCmdLine,
	int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);
#ifdef USE_WIN32_CONSOLE
	AllocConsole();
	freopen("CONIN$", "r", stdin);
	//AppDelegate app;
	auto app = CCApplication::getInstance();
	return app->run();
#else
	auto simulator = SimulatorWin::getInstance();
	return simulator->run();
#endif
}
