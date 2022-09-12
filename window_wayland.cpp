#include "include/core/SkCanvas.h"
#include "include/core/SkColorSpace.h"
#include "include/core/SkSurface.h"
#include "include/core/SkSurfaceProps.h"
#include "window.h"

#include <wayland-client.h>
#include <wayland-egl.h>

#include <GLES2/gl2.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>

#include "xdg-shell-client-protocol.h"

class WindowWayland : public Window {
 private:
  int screenW, screenH;
  /* skia member */
  GrDirectContext* skiaContext = nullptr;
  SkSurface* skiaSurface = nullptr;

  /* wayland protocol */
  struct wl_display *display;
  struct wl_registry *registry;
  struct wl_compositor *compositor;
  struct xdg_wm_base *wm_base;

  /* egl */
  EGLConfig eglConfig;
  EGLDisplay eglDisplay = EGL_NO_DISPLAY;
  EGLSurface eglSurface = EGL_NO_SURFACE;
  EGLContext eglContext = EGL_NO_CONTEXT;

  /* internal */
  bool is_mute;

  static void registry_handle(void *data, struct wl_registry *registry,
		                           uint32_t name, const char *interface, 
                               uint32_t version);

  static void registry_handle_remove(void *data, struct wl_registry *registry,
			                                uint32_t name)
  bool connection_create();
  bool connection_destroy();
  void surface_create(uint32_t width, uint32_t height);
  void surface_destroy();

 public:
   WindowWayland(int screenW, int screenH) : screenW(screenW), screenH(screenH) {
   /* native display, egldisplay */
   /* create context */
   /* create pbuffer */
   /* makecurrent */

   /* skia GrGLMakeNativeInterface() */
   /* skiaContext  */
   /* skia set resource 30MB */


   /* create buffer and imagekhr */

   /* SkColorType colorType */
   /* GrBackendRenderTarget backendRenderTarget(...) */
   /* SkSurfaceProps surfaceProps; */
   }

   ~WindowWayland() {
     glFinish();
     /* destroy image khr */
     /* destroy egl */
     /* destroy wl_egl_surface */
     /* destroy wayland */
  }

  void clear() override {
    glBindFramebuffer(GL_FRAMEBUFFER, fbo[currentBuffer]);
    glClear(GL_COLOR_BUFFER_BIT);
  }

  void swap() override {
    if (skiaContext) {
      TRACE_EVENT("rendering", "flush");
      skiaContext->flush();
    }
      TRACE_EVENT("rendering", "eglSwapBuffers");
      eglSwapBuffers(eglDisplay, eglSurface);
    }
  }
  void show() override {
    /*TODO  attach wl buffer */
  }
  void hide() override {
    /*TODO attach null buffer */
  }

  SkSurface* target() override { return skiaSurface; }
  GrDirectContext* context() override { return skiaContext; }

}

std::unique_ptr<Window> loki::createWindow(int screenW, int screenH) {
  return std::make_unique<WindowWayland>(screenW, screenH);
}
