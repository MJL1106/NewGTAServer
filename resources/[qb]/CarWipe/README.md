<h1 align="center">Hi 👋, I'm LucaNL</h1>
<h3 align="center">I'am a mainly FiveM Developer</h3>

- 🔭 I’m currently working on [CarWipe](https://github.com/LucaNL/CarWipe-FiveM/)

- 📫 How to reach me **LucaNL#2230** on discord

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://www.w3schools.com/css/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="css3" width="40" height="40"/> </a> <a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a> <a href="https://www.java.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg" alt="java" width="40" height="40"/> </a> <a href="https://www.php.net" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/php/php-original.svg" alt="php" width="40" height="40"/> </a> <a href="https://www.lua.org" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Lua-Logo.svg/1024px-Lua-Logo.svg.png" alt="lua" width="40" height="40"/> </a> 
</p>


**Hello,**

I myself was always looking for a good working script for a carwipe every hour for example, but never really could find something good, and something that actually did it right. So I made my own version of a carwipe script.

# CarWipe-FiveM
A script that allows you to run a carwipe every so often (hours/minutes), this will remove all cars that no one is in to prevent lag. This script does not cause any performance loss.

### Features:

- Change time for carwipe with cron:runAt in the server.lua
- Notifications when a carwipe is upcoming and done in config
- Config the 10ms delay x vehicle to delete
- Multiple delete functions so the vehicle always goes away
- A command to manually start a carwipe if you like
- Delete & Normal destroyed vehicle's
- A option to use ESX or not
- Not deleting of someone is driveing the vehicle
- A option to only carwipe broken vehicles [PREVIEW v1.1.1](https://youtu.be/WGoHoXCuaVE)

  _This script has a version check, new versions will be released regularly, so you can see it right at the start of the server._
  
# Download and preview
[FiveM Post](https://forum.cfx.re/t/release-free-carwipe-fivem/4839898)

[PREVIEW v1.1.0](https://youtu.be/58E7WdJvPlQ)

[DOWNLOAD](https://github.com/LucaNL/CarWipe-FiveM/archive/refs/heads/main.zip) 

### Requirements

- [cron](https://github.com/esx-framework/cron/archive/refs/heads/master.zip) - For the automatic carwipe's every hour

### How to install
1. Download the recource
2. Change the config in config.lua and take a look at the server.lua for adjustments
3. Rename te script to: ```CarWipe```
4. Add this to your server.cfg:
```
ensure CarWipe
```
5. Enjoy the script :D

# Changelog
**Changelog v1.1.1** [PREVIEW v1.1.1](https://youtu.be/WGoHoXCuaVE)
```
  A option to only carwipe broken vehicles
```
  
**Changelog v1.1.0** [PREVIEW v1.1.0](https://youtu.be/58E7WdJvPlQ)
```
  Fixed some delay
  Made the config better
  Esx and not working (need to change the config)
  Can alerts set on/off
```
