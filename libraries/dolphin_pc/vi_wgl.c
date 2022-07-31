#ifdef _WIN32

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <GL/gl.h>
#include <dolphin.h>

#include "__dolphin_pc.h"

static HDC s_dc = NULL;
static HWND s_window = NULL;
static char s_title[100] = "";

static LRESULT CALLBACK window_proc(HWND window, UINT msg, WPARAM wparam, LPARAM lparam)
{
    if (msg == WM_DESTROY)
        ExitProcess(0);
    else
        return DefWindowProcA(window, msg, wparam, lparam);
}

void VIInit(void)
{
    const char className[] = "GLwin";
    const HINSTANCE instance = GetModuleHandle(NULL);
    const WNDCLASSA wc =
    {
        .style         = CS_OWNDC,
        .lpfnWndProc   = window_proc,
        .hInstance     = instance,
        .lpszClassName = className,
    };
    const DWORD windowStyle = WS_CAPTION | WS_OVERLAPPED | WS_VISIBLE | WS_SYSMENU;
    RECT rect = {0, 0, 640, 480};
    const PIXELFORMATDESCRIPTOR pfd =
    {
        .nSize      = sizeof(pfd),
        .nVersion   = 1,
        .dwFlags    = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
        .iPixelType = PFD_TYPE_RGBA,
        .cColorBits = 32,
        .cAlphaBits = 8,
        .cDepthBits = 32,
    };
    int pixFmt;
    HGLRC context;
    BOOL (WINAPI *wglSwapInterval)(int interval);

    // Create Window

    if (RegisterClassA(&wc) == 0)
    {
        fprintf(stderr, "failed to register window class: error %lu\n", GetLastError());
        return;
    }
    AdjustWindowRect(&rect, windowStyle, FALSE);
    s_window = CreateWindowA(
        className,
        s_title,
        windowStyle,
        CW_USEDEFAULT, CW_USEDEFAULT,
        rect.right - rect.left, rect.bottom - rect.top,
        NULL,
        NULL,
        instance,
        NULL);
    if (s_window == NULL)
    {
        fprintf(stderr, "failed to create window: error %lu\n", GetLastError());
        return;
    }

    // Create GL context

    s_dc = GetDC(s_window);
    pixFmt = ChoosePixelFormat(s_dc, &pfd);
    if (pixFmt == 0)
    {
        fprintf(stderr, "failed to obtain pixel format: error %lu\n", GetLastError());
        return;
    }
    if (!SetPixelFormat(s_dc, pixFmt, &pfd))
    {
        fprintf(stderr, "failed to set pixel format: error %lu\n", GetLastError());
        return;
    }
    context = wglCreateContext(s_dc);
    if (context == NULL)
    {
        fprintf(stderr, "failed to create GL context: error %lu\n", GetLastError());
        return;
    }
    wglMakeCurrent(s_dc, context);

    // Try to use vsync if possible
    wglSwapInterval = wglGetProcAddress("wglSwapIntervalEXT");
    if (wglSwapInterval != NULL)
        wglSwapInterval(1);
}

u32 VIGetTvFormat(void)
{
    return 0;
}

void VIFlush(void)
{
    MSG msg;

    SwapBuffers(s_dc);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    while (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE))
    {
        TranslateMessage(&msg);
        DispatchMessageA(&msg);
    }
}

void VISetWindowTitle(const char *title)
{
    strncpy(s_title, title, sizeof(s_title));
    s_title[sizeof(s_title) - 1] = 0;
    if (s_window != NULL)
        SetWindowTextA(s_window, title);
}

void VIShowErrorMessage(const char *message)
{
    MessageBoxA(s_window, message, s_title, MB_OK | MB_ICONERROR);
}

#endif  // _WIN32
