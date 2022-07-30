#ifdef _WIN32

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <GL/gl.h>
#include <dolphin.h>

static HDC s_dc;

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
    const WNDCLASSEXA wc =
    {
        .cbSize        = sizeof(wc),
        .style         = CS_OWNDC,
        .lpfnWndProc   = window_proc,
        .hInstance     = instance,
        .lpszClassName = className,
    };
    const DWORD windowStyle = WS_CAPTION | WS_OVERLAPPED | WS_VISIBLE;
    RECT rect = {0, 0, 640, 480};
    HWND window;
    const PIXELFORMATDESCRIPTOR pfd =
    {
        .nSize = sizeof(pfd),
        .nVersion = 1,
        .dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
        .iPixelType = PFD_TYPE_RGBA,
        .cColorBits = 32,
        .cAlphaBits = 8,
        .cDepthBits = 32,
    };
    int pixFmt;
    HGLRC context;

    // Create Window

    if (RegisterClassExA(&wc) == 0)
    {
        fprintf(stderr, "failed to register window class: error %lu\n", GetLastError());
        return;
    }
    AdjustWindowRect(&rect, windowStyle, FALSE);
    window = CreateWindowA(
        className,
        "Super Monkey Ball",
        windowStyle,
        CW_USEDEFAULT, CW_USEDEFAULT,
        rect.right - rect.left, rect.bottom - rect.top,
        NULL,
        NULL,
        instance,
        NULL);
    if (window == NULL)
    {
        fprintf(stderr, "failed to create window: error %lu\n", GetLastError());
        return;
    }

    // Create GL context

    s_dc = GetDC(window);
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

#endif  // _WIN32
