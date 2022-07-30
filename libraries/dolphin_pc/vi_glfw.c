#ifndef _WIN32

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dolphin.h>
#include <GLFW/glfw3.h>

#include "__dolphin_pc.h"

static GLFWwindow *s_window;
static char s_title[100] = "";

static void error_callback(int error, const char *description)
{
    fprintf(stderr, "GLFW error: %s\n", description);
    exit(1);
}

void VIInit(void)
{
    if (!glfwInit())
    {
        fputs("failed to initialize GLFW\n", stderr);
        exit(1);
    }
    glfwSetErrorCallback(error_callback);
#ifdef _WIN32
    glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_API);
#else
    glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
#endif
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);
    s_window = glfwCreateWindow(640, 480, s_title, NULL, NULL);
    glfwMakeContextCurrent(s_window);
    glfwSwapInterval(1);
}

u32 VIGetTvFormat(void)
{
    puts("VIGetTvFormat is a stub");
    return 0;
}

void VIFlush(void)
{
    //puts("VIFlush");
    print_render_stats();
    glfwSwapBuffers(s_window);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    glfwPollEvents();
    if (glfwWindowShouldClose(s_window))
    {
        exit(0);
    }
}

void VISetWindowTitle(const char *title)
{
    strncpy(s_title, title, sizeof(s_title));
    s_title[sizeof(s_title) - 1] = 0;
    if (s_window != NULL)
        glfwSetWindowTitle(s_window, title);
}

void VIShowErrorMessage(const char *message)
{
    fprintf(stderr, "%s\n", message);
}

#endif  // _WIN32
