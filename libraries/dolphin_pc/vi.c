#include <stdio.h>
#include <stdlib.h>

#include <dolphin.h>

#include <GLFW/glfw3.h>

static GLFWwindow *g_window;

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
    g_window = glfwCreateWindow(640, 480, "Super Monkey Ball", NULL, NULL);
    glfwMakeContextCurrent(g_window);
    glfwSwapInterval(1);

    printf("GL version: %s\n", glGetString(GL_VERSION));
    printf("GL extensions: %s\n", glGetString(GL_EXTENSIONS));
}

u32 VIGetTvFormat(void)
{
    puts("VIGetTvFormat is a stub");
    return 0;
}

void VIFlush(void)
{
    //puts("VIFlush");
    glfwSwapBuffers(g_window);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    glfwPollEvents();
    if (glfwWindowShouldClose(g_window))
    {
        exit(0);
    }
}
