# MPI5001_touch_driver_loader
### What

An automatic solution to loading the driver of the touch control of MPI5001 LCD screens.

### Why

On some Ubuntu platforms, the touch input ought to plug and play, but the system fails to bind a driver/binds a wrong driver to the device.

### How 1

1. Put the contents of `udev/` under `/etc/udev/`, then the device should work when plugged in.
2. Tested on Ubuntu 16.04, Ubuntu 18.04

### How 2

1. It uses the udev to monitor events from devices with specific attributes, and runs the driver unbind/bind commands in a script. 
2. Depending on udev versions, the 2nd line of `udev/rules.d/90-mpi5001-touch-driver.rules`  could work independently w/o the 3rd line and `udev/mpi5001_bind_driver.bash`. 
3. Part of USB id (`:config.interface`) is hard coded as `:1.0`, which may need to adjust accordingly.

