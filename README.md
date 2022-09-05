
# Table of Contents

1.  [Astra](#org4297c51)
    1.  [Stage 1 - Prep <code>[0/5]</code>](#orgf2298af)
    2.  [Stage 2 - Data(and Project Automation) <code>[0/1]</code>](#orgb8055c7)
    3.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org2e81183)
    4.  [Stage 4 - Operations <code>[0/3]</code>](#org07e8a92)
        1.  [For re-usable missions: <code>[0/1]</code>](#orgb721a8a)
        2.  [Starlink(s) <code>[0/0]</code>](#orgc627851)
        3.  [Long running, real time ops <code>[0/0]</code>](#orge50ecac)
    5.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#orgd74e85e)
    6.  [Backlog/As Needed <code>[0/2]</code>](#org05cf2eb)
    7.  [KSP Mod Requirements](#orga00d090)



<a id="org4297c51"></a>

# Astra


<a id="orgf2298af"></a>

## TODO Stage 1 - Prep <code>[0/5]</code>

-   [-] Kubernetes Deployment <code>[0/10]</code>
    -   [-] Game start script <code>[1/3]</code>
        -   [X] sshd <code>[3/3]</code>
            -   [X] allow root
            -   [X] public key only
            -   [X] allow X11 forwarding
        -   [ ] xpra
        -   [ ] ksp on xpra display
    -   [-] Mod install <code>[3/7]</code>
        -   [ ] Why are we re-implementing the existing Ansible playbook in bash? Just modify the playbook where needed&#x2026; <code>[0/1]</code>
            -   [ ] Figure out what to do with Principia, devs host it on Google Drive?!
                -   Include in repo?
                    -   ADD in Dockerfile
                -   Host elsewhere?
        -   [X] [KK&rsquo;s SpaceX Pack](https://forum.kerbalspaceprogram.com/index.php?/topic/193933-110-kks-spacex-pack-july-06-2020/)
        -   [X] RO via CKAN
        -   [ ] Principia
        -   [X] Install CKAN.deb
        -   [ ] kRPC manually from github
        -   [ ] AutoLoadGame - Allista
    -   [ ] astra-base.sfs
    -   [ ] AutoLoadGame.conf
    -   [ ] settings.cfg
    -   [ ] krpc-settings.cfg
    -   [ ] AutoLoadGame - Now supports specifying SFS files
    -   [ ] POC kRPC - connection over Internet successful, responses receieved
    -   [ ] Install KSP <del>1.7.3</del> 1.8.1 from S3
    -   [ ] File provision packer/files/\*
-   [ ] Automate game-archiver
-   [ ] Choose kRPC client language - C++/Python
-   [ ] Xpra/xpra attach workflow for graphical debugging and SFS building
-   [ ] Debug RO Install, problems w/ Kopernicus?


<a id="orgb8055c7"></a>

## TODO Stage 2 - Data(and Project Automation) <code>[0/1]</code>

-   [ ] Python classes <code>[0/4]</code>
    -   [ ] CraftTransmitter
    -   [ ] CraftReciever
    -   [ ] StationTransmitter
    -   [ ] StationReceiver


<a id="org2e81183"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="org07e8a92"></a>

## TODO Stage 4 - Operations <code>[0/3]</code>


<a id="orgb721a8a"></a>

### [-] For re-usable missions: <code>[0/1]</code>

1.  [ ] Will need something like [FMRS](https://forum.kerbalspaceprogram.com/index.php?/topic/157214-19x-flight-manager-for-reusable-stages-fmrs-now-with-recoverycontroller-integration/) implemented via kRPC


<a id="orgc627851"></a>

### [-] Starlink(s) <code>[0/0]</code>


<a id="orge50ecac"></a>

### [-] Long running, real time ops <code>[0/0]</code>


<a id="orgd74e85e"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org05cf2eb"></a>

## TODO Backlog/As Needed <code>[0/2]</code>

-   [ ] If TCP latency becomes a problem, try implementing a kRPC unix socket comm. protocol
    -   <del>There are module load errors in KSP.log, not sure if its preventing AutoLoadGame from doing its thing, or if that is related to the Changelog startup dialog in KSP Main Menu.</del> KSP 1.8.1 Works great
    -   <del>Why are we stuck at the Change Log dialog on KSP Start?</del> A bit annoying but appears to be inconsequential for my automation purposes.
        -   ksp settings.cfg:
            -   SHOW<sub>WHATSNEW</sub><sub>DIALOG</sub> = False
            -   <del>Version 1.7.3 was not honoring settings.cfg, lets see if 1.8.1 works</del> Still not honored in 1.8.1 but again, appears inconsequential


<a id="orga00d090"></a>

## KSP Mod Requirements

-   [AutoLoadGame](https://github.com/allista/AutoLoadGame) - by Allista, allows creating a configuration file in your saves dir that will automatically load the specified sfs file upong game start.
-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.

