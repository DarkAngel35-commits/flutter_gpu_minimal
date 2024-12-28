import 'package:flutter/material.dart';
import 'package:flutter_gpu/gpu.dart' as gpu;
import 'package:vector_math/vector_math.dart' as vecmat;

class MyGpuPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final texture =
        gpu.gpuContext.createTexture(
          gpu.StorageMode.devicePrivate,
          size.width.toInt(),
          size.height.toInt(),
        )!;

    final renderTarget = gpu.RenderTarget.singleColor(
      gpu.ColorAttachment(
        texture: texture,
        clearValue: vecmat.Colors.royalBlue,
      ),
    );

    final commandBuffer = gpu.gpuContext.createCommandBuffer();
    commandBuffer.createRenderPass(renderTarget);
    commandBuffer.submit();

    final image = texture.asImage();
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant MyGpuPainter oldDelegate) => true;
}
