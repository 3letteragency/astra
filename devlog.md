
# Table of Contents

1.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>](#org729b89e)
2.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>](#orgf8bb58e)
3.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-11-17 Tue&gt;</span></span>](#org2f23d56)
4.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-01-21 Thu&gt;</span></span>](#org2c944dd)
5.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-08 Mon&gt;</span></span>](#org9bf96d7)
6.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-09 Tue&gt;</span></span>](#org763ff5b)
7.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-12 Fri&gt;</span></span>](#orgec6c1b9)
8.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-13 Sat&gt;</span></span>](#org3860556)
9.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2021-03-01 Mon&gt;</span></span>](#org3968a23)
10. [<span class="timestamp-wrapper"><span class="timestamp">&lt;2022-09-04 Sun&gt;</span></span>](#org8bed6d8)
11. [<span class="timestamp-wrapper"><span class="timestamp">&lt;2022-09-05 Mon&gt;</span></span>](#org89d0258)



<a id="org729b89e"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>

-   Ansible provisioner porting from bash is mostly finished. Just a couple small things like a SystemD service for automatically starting KSP on deployment, and autoconfiguring the firewall to allow connections to the kRPC ports from the provisioning machine(Laptop, workstation, etc.). Adding functionality via the ansible config will be very much easier than stuffing more bash in here. Once those are done I&rsquo;ll initiate a build based on the new provisioner, at which point I think we&rsquo;ll be able to get some real work done.
    
    As we&rsquo;re running the game without graphics, we do need some kind of visuals. Initially I believe some combination of NASA&rsquo;s GMAT, and OpenMCT will do the trick. I&rsquo;ll begin by linking up:
    
    -   Some misc. [SpaceCenter](https://krpc.github.io/krpc/python/api/space-center/space-center.html), [Comms](https://krpc.github.io/krpc/python/api/space-center/comms.html), [Parts](https://krpc.github.io/krpc/python/api/space-center/parts.html), [ReferenceFrame](https://krpc.github.io/krpc/python/api/space-center/reference-frame.html), and [Waypoints](https://krpc.github.io/krpc/python/api/space-center/waypoints.html) functions
    -   Most of the [Vessel](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [CelestialBody](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [Flight](https://krpc.github.io/krpc/python/api/space-center/flight.html), [Orbit](https://krpc.github.io/krpc/python/api/space-center/orbit.html), and [kRPC](https://krpc.github.io/krpc/python/api/krpc/krpc.html) functions
    
    This should all give a pretty good picture of what is going on in the game so we can begin flying and experimenting with the Control and Flight functions.


<a id="orgf8bb58e"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>

-   Another Saturday. I got the KSP systemd service and automatated opening the firewall for kRPC ports for connections from the controlling machine. Final image is built so we can start with the fun stuff, piping data into OpenMCT and GMAT. This will be roughly inspired by Telemachus and kerbal-openmct(both of which are quite outdated).


<a id="org2f23d56"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-11-17 Tue&gt;</span></span>

-   Its been a while, life was pretty crazy the last 6 weeks and I haven&rsquo;t done anything for this. I&rsquo;ve moved to Philadelphia, been her for almost a month now. Finally beginning to feel settled and can think clearly about side projects again. Today I rebuilt to the \`astra-node\` image and redeployed the terraform plan just to make sure everything works as I remember. I&rsquo;ve reviewed this log and the README, lost my way with this a bit so had to reorient. Looks like we&rsquo;re at the point of needing to setup the kRPC streams(all of them). I think what I&rsquo;ll do is setup these streams in the backend server, then write an API around that which will be called by OpenMCT(javascript/jquery) - however it should be noted this will only be for observation and basic/non-critical controls. All flight control/automation will be done on the &ldquo;flight&rdquo; servers to minimize communication latency. Or rather, anything that would actually be done onboard would be done on the &ldquo;flight&rdquo; servers, and anything that would be done remotely will be done on the c2/OpenMCT node(s). So I&rsquo;m realizing we might have 2 instances of OpenMCT, one &ldquo;onboard&rdquo; and one &ldquo;remote&rdquo; - since I think want to use OpenMCT as the flight  interface, heavily inspired by the new Crew Dragon touchscreen panel.
    
    Anyway. Next step in a sentance; backend data streams and astrctl cli(which will basically implement identical functionality to the OpenMCT C2, just entirely textual).


<a id="org2c944dd"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-01-21 Thu&gt;</span></span>

-   Well, almost exactly two months since last update and I&rsquo;ve NOT DONE A SINGLE BIT OF WORK. Ugh. Holidays and general life craziness(Did 2020 ever really end&#x2026;). I&rsquo;ve also got a new primary dev machine, so will need to first ensure I can run all the build scripts and what not from here - then I can get back to data stream integration as above. WML!
    
    UPDATE: Ugh. I suppose I should update my terraform modules to use the Vultr Provider v2..and might as well restructure some of the project while I&rsquo;m at it..picked up a few tricks since I started this.


<a id="org9bf96d7"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-08 Mon&gt;</span></span>

-   Just got off work and am going to go for a run. If afterwards I don&rsquo;t at least ensure I can download the Steam game, build the snapshot, and port everything to the Vultr TF Provider v2, someone open an issue on GH and call me a jabroni.


<a id="org763ff5b"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-09 Tue&gt;</span></span>

-   Alright so I drank a *few* beers and my ojectives changed. I got annoyed trying to port my build scripts over to my new machine, the slight nuances here and there, and decided instead of working on the TF stuff to move the build scripts over to github actions. At this point, I&rsquo;ve got the game pulling/archiving/and uploading to s3 done. So thats nice. Next is to port the image build script over to GH Actions and the packer build over to the Vultr Packer plugin to v2&#x2026;coulda swore I already did, will need to check my ThinkPad, it might be on there. In any case it is a small task. So in short I didn&rsquo;t get done what I&rsquo;d originally planned, but got other equally helpful stuff done. You can still call me a jabroni or whatever but I&rsquo;m just gonna keep drinking beers and chipping away at this.
    
    Update: Ok too many beers, gonna stop touching stuff. So what I&rsquo;d originally set out to do yesterday(update the TF provider to Vultr v2) has already been done, and it is the updating Packer to the Vultr v2 plugin that still needs to be done&#x2026; <del>yay</del> cheers?


<a id="orgec6c1b9"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-12 Fri&gt;</span></span>

-   Splitting the various Astra components(game build/archive, image build, terraform deployment module, etc.) into separate repos. Game builder repo is basically done. Will do packer image builder as part of updating packer to the Vultr v2 plugin. Need to do the actions script as well. Will be nice to not need to worry about local environment, the project should progress quite a bit faster with this automation in place.
    
    Update: Started this pretty much as soon as I got off work(4PM) and it is now 10:39PM. Strong day. The project organization is much better. Split out several repos:
    
    <https://github.com/Oogy/packer-astra-flight>
    <https://github.com/Oogy/astra-ksp>
    
    Next will be a separate repo for the Terraform module, and possibly the ansible plan. Maybe store a tar of the Ansible files as a release asset, pull it into the build similarly to <https://github.com/Oogy/packer-astra-flight/blob/fe2cb345191f138a95901e7f0b1638892483c9af/.github/workflows/build.yml#L31>. Time for a workout and sleep.


<a id="org3860556"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-02-13 Sat&gt;</span></span>

-   Just continuing from yesterday. Got the TF module in its own repo. Also setup a Discord git webhook for the 3LA org.


<a id="org3968a23"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-03-01 Mon&gt;</span></span>

-   Life really do be like that sometimes, yk?


<a id="org8bed6d8"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2022-09-04 Sun&gt;</span></span>

-   1.5 years later and here we are again. New knowledge, new skills. The vision to accomplish this is much clearer than before. I expect to have something interesting to show for it within a month or 2. Going to be reworking everyting to run on Coreweave rather than Vultr, obviously. Also going to clean everything up and see if I can run in just containers, much easier to writeup than VMs.


<a id="org89d0258"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2022-09-05 Mon&gt;</span></span>

-   Chipping away again. Should have the game ready for dev/connecting to kRPC shortly. This was much faster to an experimental state than previous attempt.

-   Regarding running graphically w/ xpra and NOT in -batchmode/-nographics, CPU use is **significant**. All CPU sit at roughly 85%-95% w/ 12 CPU.
    
    Hopefully we will not need graphics to run Principia, though, it would certainly be preferable to make use of the GPU if possible. May try to dive into Principia mod source and see if GPU may be accessed independently of the game.

-   I&rsquo;ve re-implemented a decent amount of the mod installation as a bash script, basically what we started with last time. And we now know how much better it is to just use Ansible where possible&#x2026;and we have the Ansible playbook for this already.
    
    Should I continue with re-implementing in bash, or should I just modify the existing Ansible?
    
    I think probably just use what you have, you know it works.

