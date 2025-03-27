#ifdef FRAME_BUFFER_H
#define FRAME_BUFFER_H

typedef struct FrameBuffer Framebuffer;

FrameBuffer* get_framebuffer_c(void);
void framebuffer_clear_c(FrameBuffer* fb, uint32_t color);
void framebuffer_put_pixel_c(FrameBuffer* fb, size_t x, size_t y, uint32_t color);

#endif // FRAME_BUFFER_H