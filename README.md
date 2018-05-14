# Cryptographic Key Generation from Biometric Data

This repository builds standalone binaries to create 'Secure Sketch's from biometric data both on Linux and macOS  
Binaries are implementation of algorithms from the paper [Fuzzy Extractors: How to Generate Strong Keys from Biometrics and Other Noisy Data](http://www.cs.bu.edu/~reyzin/papers/fuzzy.pdf) and vanilla code can be downloaded from [here](http://www.cs.bu.edu/~reyzin/code/fuzzy.html)  
All build tools and dependencies are compiled from scratch.  


### Build instructions
```shell
# run once to install Xcode CLI tools for macOS
$ xcode-select --install

# clone and build
$ git clone https://github.com/kozyilmaz/biokey.git
$ cd biokey
$ source environment
$ PRINT_DEBUG=y make all
```

After a successful build, final binaries will be installed to `out` directory under project root  
You can then copy binary directory anywhere you like there are no dependencies to the build tree anymore  
```shell
bash-3.2$ ls -lrt out/
total 13224
-rwxr-xr-x  1 loki  staff  2432796 May 14 13:53 sketch
-rwxr-xr-x  1 loki  staff  2399436 May 14 13:53 differ
-rwxr-xr-x  1 loki  staff  1933860 May 14 13:53 ijs
bash-3.2$ otool -L out/sketch 
out/sketch:
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.50.4)
bash-3.2$ otool -L out/differ
out/differ:
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.50.4)
bash-3.2$ otool -L out/ijs 
out/ijs:
    /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 400.9.0)
    /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.50.4)
```
