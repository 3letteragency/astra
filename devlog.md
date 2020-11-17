
# Table of Contents

1.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>](#org43ec54b)
2.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>](#orge102224)
3.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-11-17 Tue&gt;</span></span>](#org58a3240)



<a id="org43ec54b"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>

-   Ansible provisioner porting from bash is mostly finished. Just a couple small things like a SystemD service for automatically starting KSP on deployment, and autoconfiguring the firewall to allow connections to the kRPC ports from the provisioning machine(Laptop, workstation, etc.). Adding functionality via the ansible config will be very much easier than stuffing more bash in here. Once those are done I&rsquo;ll initiate a build based on the new provisioner, at which point I think we&rsquo;ll be able to get some real work done.
    
    As we&rsquo;re running the game without graphics, we do need some kind of visuals. Initially I believe some combination of NASA&rsquo;s GMAT, and OpenMCT will do the trick. I&rsquo;ll begin by linking up:
    
    -   Some misc. [SpaceCenter](https://krpc.github.io/krpc/python/api/space-center/space-center.html), [Comms](https://krpc.github.io/krpc/python/api/space-center/comms.html), [Parts](https://krpc.github.io/krpc/python/api/space-center/parts.html), [ReferenceFrame](https://krpc.github.io/krpc/python/api/space-center/reference-frame.html), and [Waypoints](https://krpc.github.io/krpc/python/api/space-center/waypoints.html) functions
    -   Most of the [Vessel](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [CelestialBody](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [Flight](https://krpc.github.io/krpc/python/api/space-center/flight.html), [Orbit](https://krpc.github.io/krpc/python/api/space-center/orbit.html), and [kRPC](https://krpc.github.io/krpc/python/api/krpc/krpc.html) functions
    
    This should all give a pretty good picture of what is going on in the game so we can begin flying and experimenting with the Control and Flight functions.


<a id="orge102224"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>

-   Another Saturday. I got the KSP systemd service and automatated opening the firewall for kRPC ports for connections from the controlling machine. Final image is built so we can start with the fun stuff, piping data into OpenMCT and GMAT. This will be roughly inspired by Telemachus and kerbal-openmct(both of which are quite outdated).


<a id="org58a3240"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-11-17 Tue&gt;</span></span>

-   Its been a while, life was pretty crazy the last 6 weeks and I haven&rsquo;t done anything for this. I&rsquo;ve moved to Philadelphia, been her for almost a month now. Finally beginning to feel settled and can think clearly about side projects again. Today I rebuilt to the \`astra-node\` image and redeployed the terraform plan just to make sure everything works as I remember. I&rsquo;ve reviewed this log and the README, lost my way with this a bit so had to reorient. Looks like we&rsquo;re at the point of needing to setup the kRPC streams(all of them). I think what I&rsquo;ll do is setup these streams in the backend server, then write an API around that which will be called by OpenMCT(javascript/jquery) - however it should be noted this will only be for observation and basic/non-critical controls. All flight control/automation will be done on the &ldquo;flight&rdquo; servers to minimize communication latency. Or rather, anything that would actually be done onboard would be done on the &ldquo;flight&rdquo; servers, and anything that would be done remotely will be done on the c2/OpenMCT node(s). So I&rsquo;m realizing we might have 2 instances of OpenMCT, one &ldquo;onboard&rdquo; and one &ldquo;remote&rdquo; - since I think want to use OpenMCT as the flight  interface, heavily inspired by the new Crew Dragon touchscreen panel.
    
    Anyway. Next step in a sentance; backend data streams and astrctl cli(which will basically implement identical functionality to the OpenMCT C2, just entirely textual).

