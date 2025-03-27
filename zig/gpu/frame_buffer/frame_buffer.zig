const std = @import("std");

pub const FrameBuffer = struct {
    width: usize,
    height: usize,
    buffer: *volatile [*]u32,

    pub fn put_pixel(self: *FrameBuffer, x: usize, y: usize, color: u32) void {
        if (x < self.width and y < self.height) {
            self.buffer[y][x] = color;
        }
    }

    pub fn clear(self: *FrameBuffer, color: u32) void {
        for (self.buffer) |row| {
            for (row) |pixel| {
                pixel.* = color;
            }
        }
    }
};

pub fn get_framebuffer() *FrameBuffer {
    const width = 640;
    const height = 480;
    const buffer = std.heap.calloc(u32, width * height);
    return FrameBuffer{ .width = width, .height = height, .buffer = buffer };
}
