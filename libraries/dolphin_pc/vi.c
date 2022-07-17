#include <stdio.h>
#include <stdlib.h>

#include <dolphin.h>

#include <GLFW/glfw3.h>

static GLFWwindow *g_window;

void VIInit(void)
{
    if (!glfwInit())
    {
        fputs("failed to initialize GLFW\n", stderr);
        exit(1);
    }
    g_window = glfwCreateWindow(640, 480, "Super Monkey Ball", NULL, NULL);
    if (g_window == NULL)
    {
        fputs("failed to create window\n", stderr);
        exit(1);
    }
    glfwMakeContextCurrent(g_window);
    glfwSwapInterval(1);
}

u32 VIGetTvFormat(void)
{
    puts("VIGetTvFormat is a stub");
    return 0;
}

void VIFlush(void)
{
    puts("VIFlush");
    glfwSwapBuffers(g_window);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
}
