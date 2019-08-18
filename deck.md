# Docker + Python
### How To Get There?



# About me

* Daniel Kravetz <!-- .element: class="fragment" -->
* Backend developer <!-- .element: class="fragment" --> 
* Devops <!-- .element: class="fragment" --> 
* Enjoy hiking with my camera <!-- .element: class="fragment" --> 
* Twitter <!-- .element: class="fragment" --> [@Av4t4r](https://twitter.com/Av4t4r)
* Github <!-- .element: class="fragment" --> [dkravetz](https://github.com/dkravetz)



# What is Docker?


### It's nothing more than an isolated process



# What does this mean?

* No CPU emulation <!-- .element: class="fragment" -->
* No Hypervisor <!-- .element: class="fragment" -->
* It's just a process managed by the Docker service <!-- .element: class="fragment" -->



# Benefits of using Docker

* Repeatability <!-- .element: class="fragment" -->
* Portability <!-- .element: class="fragment" -->
* Reusability <!-- .element: class="fragment" -->
* Too many to mention in a slide <!-- .element: class="fragment" -->

Note:
Repeatability: your container behaves as expected on different computers.
Portabiliy: No need to worry about other dependencies. I'll get back to this one in a minute.
Reusabilty: Shared components can be re-used.



# An example use case
<img data-src="img/story_time.gif">


### We use Python...


### ...and a native C library
which we need to configure, compile and install...


For both MacOS and Linux <!-- .slide: data-background="./img/horror.gif" -->


This is the relevant snippet
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
In order for this to work, you need to install gcc, specify a configuration directory (which can change based on the OS), etc.


### This means mantaining at least two target platforms
Note:
This implies knowing how to deal with potential errors for different platforms, and makes distribution and deploys significantly harder than they need to be.


<!-- .slide: data-background="./img/thinking.gif" data-background-size="50%" data-background-color="black"-->
# What are our options? <!-- .element: class="fragment" -->


We tried the PEX route...
Note:
This lead to huge PEX files, which anyway you needed somehow to compile the linux variant of libpostal from a Mac...



<!-- .slide: data-background="./img/docker_logo.png" data-background-size="50%" -->


* Portability <!-- .element: class="fragment" -->
* Usability <!-- .element: class="fragment" -->
* Fidelity <!-- .element: class="fragment" -->
* No more "but it works on my machine!" <!-- .element: class="fragment" -->
Note:
Portability: We can ignore the host's OS.
Usability: No need to know how to configure and compile
Fidelity: The development environment is as close as possible to production
And my favourite...
