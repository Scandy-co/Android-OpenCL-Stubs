# Android-OpenCL-Stubs

Minimal project to build OpenCL stub library "libOpenCL.so" for Android platforms.
- See https://anteru.net/blog/2014/04/26/2368/
- Similar projects:
  - https://github.com/krrishnarraj/libopencl-stub
  - https://github.com/madeye/opencl-stub

Basic use:
- Requires CMake. Expects to be run in a Unix-like environment with bash.
- Obtain via: `git clone git@github.com:Scandy-co/Android-OpenCL-Stubs.git`
- Copy `example.env` to `.env`, which will be read for environment variables describing location of an Android NDK.
- In `.env`, change environment variables to match your development environment; in particular point `ANDROID_NDK` at your copy of the Android NDK.
- Configure: `./dev_scripts/config.bash`
  - Creates a build directory `build--${CMAKE_BUILD_TYPE}--${ANDROID_ABI}--${ANDROID_NATIVE_API_LEVEL}--${ANDROID_TOOLCHAIN_NAME}"`
  - Runs CMake to configure build.
- Build: `./dev_scripts/build.bash`
  - Runs `make` in build directory.
  - Produces `build--.../libOpenCL.so`

Copy the output `libOpenCL.so` into your Android project, and link your JNI code against it, but don't include the stub library in your Android package. When your code is run on Android, it will use the vendor-supplied `libOpenCL.so` instead.
