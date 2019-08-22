# Docker + Python
### How To Get There?



## About me

* Daniel Kravetz <!-- .element: class="fragment" -->
* Backend developer <!-- .element: class="fragment" --> 
* Devops <!-- .element: class="fragment" --> 
* Enjoy hiking with my camera <!-- .element: class="fragment" --> 


# What is Docker?


### It's nothing more than an isolated process



## What does this mean?

* No CPU emulation <!-- .element: class="fragment" -->
* No Hypervisor <!-- .element: class="fragment" -->
* Namespaces <!-- .element: class="fragment" -->
* cgroups <!-- .element: class="fragment" -->
* It's just a process managed by the Docker service <!-- .element: class="fragment" -->
Note:
Unlike a VM, docker doesn't rely on hardware emulation nor hypervisors. It uses namespaces to provide isolation between containers (each container gets its own namespace) and cgroups (control groups) to provide isolation to hardware resources. That said, on non Linux platforms, docker relies on one form of emulation or another, HyperKit for MacOS and HyperV for Windows




## Why Docker?

* Repeatability <!-- .element: class="fragment" -->
* Portability <!-- .element: class="fragment" -->
* Reusability <!-- .element: class="fragment" -->
* Many more <!-- .element: class="fragment" -->

Note:
Repeatability: your container behaves as expected on different computers.
Portability: No need to worry about other dependencies. I'll get back to this one in a minute.
Reusability: Shared components can be re-used.



# An example use case
<img data-src="img/story_time.gif">


### We use Python...


### ...and a native C library
which we need to configure, compile and install...


<!-- .slide: data-background="./img/horror.gif" -->
Note:
For both MacOS AND linux


Ubuntu configure, make and compile
<pre><code class="dockerfile" data-line-numbers="6, 7, 12">
wget -O libpostal.tar.gz \ 
  https://github.com/openvenues/libpostal/archive/v1.1-alpha.tar.gz && \
  tar -xzvf libpostal.tar.gz && \
  rm -f libpostal.tar.gz && \
  ./bootstrap.sh && \
  ./configure --datadir=/usr/share/ && \
  make -j4 && \
  make install && \
  cd .. && \
  rm -fr libpostal-1.1-alpha && \
  ldconfig
</code></pre>

Note:
In order for this to work, you need to install gcc (a C/C++ compiler), know how to configure, compile and install a C++ project (for different platforms!). This is problematic. What happens (line 7) if the path is different between platforms? What if the configuration script (line 6) performs some platform specific instructions?


### This means maintaining at least two target platforms
Note:
This implies knowing how to deal with potential errors for different platforms, and makes distribution and deploys significantly harder than they need to be.


<!-- .slide: data-background="./img/thinking_2.gif" data-background-size="50%" data-background-color="black"-->
Note:
What are our options?


We tried the PEX route...
Note:
PEX files are basically a zip file with superpowers. They are flagged as executable, contain the entire Python runtime, as well as your code, and your dependencies.


...it didn't work out for us
Note:
This means that we ended up with a LOT of very large PEX files. We had a build system to help us with this, but it still presented all of the same problems, it just simplified deployment and distribution, but nothing else.



<!-- .slide: data-background="./img/docker_logo.png" data-background-size="50%" -->
Note:
Enter docker. What did it bring for us?



* Portability <!-- .element: class="fragment" -->
* Usability <!-- .element: class="fragment" -->
* Fidelity <!-- .element: class="fragment" -->
* No more "but it works on my machine!" <!-- .element: class="fragment" -->
Note:
Portability: We can ignore the host's OS.
Usability: No need to know how to configure and compile
Fidelity: The development environment is as close as possible to production
And my personal favorite...


<!-- .slide: data-background="./img/omg.gif" data-background-size="50%" data-background-color="black" -->



## The end
<img data-src="img/qrcode.png">

Twitter [@Av4t4r](https://twitter.com/Av4t4r) | Github [dkravetz](https://github.com/dkravetz)