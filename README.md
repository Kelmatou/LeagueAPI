# LeagueAPI - Documentation

[![Build Status](https://travis-ci.com/Kelmatou/LeagueAPI.svg?branch=master)](https://travis-ci.org/Kelmatou/LeagueAPI)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/LeagueAPI.svg)](https://img.shields.io/cocoapods/v/LeagueAPI.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/LeagueAPI.svg?style=flat)](https://github.com/Kelmatou/LeagueAPI)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/Kelmatou/LeagueAPI/blob/master/LICENSE)

<p align="center">
 <img width="200" src="https://github.com/Kelmatou/LeagueAPI/blob/master/screenshots/devices.png">
</p>
League API is a League of Legends Framework in Swift. It provides an easy way to get League's data into your iOS, WatchOS, TvOS and MacOS & Linux application.  

It is designed to be easy to use, taking advantage of Swift enums. It also comes with some internal mechanisms, to handle any API key rate limit. 

**Support League of Legends, Clash, Teamfight Tactics and League of Runnetera APIs**

<img width="200" src="https://github.com/Kelmatou/LeagueAPI/blob/master/screenshots/homepage.png"> <img width="200" src="https://github.com/Kelmatou/LeagueAPI/blob/master/screenshots/live_game.gif"> <img width="200" src="https://github.com/Kelmatou/LeagueAPI/blob/master/screenshots/history.gif"> <img width="200" src="https://github.com/Kelmatou/LeagueAPI/blob/master/screenshots/champion_info.png">

## 🚧 Installation 🚧

### Carthage

* Go in your project, in the folder where is located *YourProject.xcodeproj*.
* Create a file named *Cartfile* and write `github "Kelmatou/LeagueAPI"` in it.
* Run `carthage bootstrap --platform iOS` in Terminal.
* Open *YourProject.xcodeproj* and go to target General settings.
* Add LeagueAPI.framework in Embedded Binaries.
* If you can write `import LeagueAPI` in your project without compiler error, you're done. Great job! If it is not the case, read the troubleshooting section below.

### CocoaPods

* Go in your project, in the folder where is located *YourProject.xcodeproj*.
* Run `pod init`.
* Open Podfile for editing (do not use Textedit as it will insert invalid characters).
* Right under "use_frameworks!", write `pod 'LeagueAPI'`.
* Run `pod install`.
* A *YourProject.xcworkspace* was created. From now, you should open this file instead of *YourProject.xcodeproj*.
* If you can write `import LeagueAPI` in your project without compiler error, you're done. Great job! If it is not the case, you can open an issue so that I can look at your problem.

### Manual
* Download a Release version [here](https://github.com/Kelmatou/LeagueAPI/releases) (or Github content but you may get a version with experimental changes).
* Open *LeagueAPI/LeagueAPI.xcodeproj*.
* Select LeagueAPI-Release scheme and build it (play button or cmd+b) for your desired platform (Simulator or iOS Generic Device).
* In the Project Navigator, you'll find a folder Products with *LeagueAPI.framework*. Drag and drop it in your project general settings -> Embedded Binaries.
* If you can write `import LeagueAPI` in your project without compiler error, you're done. Great job! If you encounter a problem on this step, check if you selected the same platform as LeagueAPI.framework in you project's destination target (Simulator or iOS device). If it does not solve your problem, read the troubleshooting section below.

### Troubleshooting

This section lists the main solutions to be able to `import LeagueAPI` in your project.

* Go back to your project, target settings -> Build Settings -> Framework Search Paths, then add the path to LeagueAPI.framework.

If none of these helped you, open an issue describing your problem and I'll try to check it out as soon as possible.


## 📋 Requirements 📋

### 📦 Minimum versions 📦

📱 iOS 8.1  
⌚ WatchOS 2.0  
📺 TvOS 9.0  
💻 MacOS 10.9 (Mavericks)  

### 🔑 Riot API Key 🔑

To use LeagueAPI, you'll require a Riot API Key.
You'll get one by visiting https://developer.riotgames.com. Create an account and on you dashboard, you'll be able to generate your key.
By default, Riot will generate a 'Development Key', which expires in 24h. When your application is ready to be deployed and respects Riot API usage conditions, you can apply for a 'Production Key'.
Please note that you should agree with [Riot API usage policy](https://developer.riotgames.com/policies.html)

## 😈 First Blood 😈

Starting using this framework requires you to create an instance of LeagueAPI by writing:

`let league = LeagueAPI(APIToken: "*INSERT YOUR KEY HERE*")`

Now use this instance everywhere, you shouldn't recreate the LeagueAPI variable.

## 🧐 And then? 🧐

LeagueAPI is divided in 4 different APIs:
* Riot API
* League of Legends API
* Team Fight Tactics API
* Legends of Runnetera API

### Riot API

Riot API returns information about Riot Games accounts for each player.  
It is accessible from `league.riotAPI`. From there you'll access the methods for:

* [Riot Accounts](https://github.com/Kelmatou/LeagueAPI/wiki/Riot-Accounts)

### League of Legends API

League of Legends API contains methods related to League of Legends game.  
It is accessible through `league.lolAPI`. From there you'll get information about:

**League of Legends**
* [Summoners](https://github.com/Kelmatou/LeagueAPI/wiki/Summoners)
* [Spectator/Live Game](https://github.com/Kelmatou/LeagueAPI/wiki/Spectator---Live-Game)
* [Ranked/Leagues](https://github.com/Kelmatou/LeagueAPI/wiki/Ranked---Leagues)
* [Ranked/Leagues EXP](https://github.com/Kelmatou/LeagueAPI/wiki/Ranked-Leagues---EXP)
* [Match History](https://github.com/Kelmatou/LeagueAPI/wiki/Match-History)
* [Champion Mastery](https://github.com/Kelmatou/LeagueAPI/wiki/Champion-Mastery)
* [Champions](https://github.com/Kelmatou/LeagueAPI/wiki/Champions)
* [Server Status](https://github.com/Kelmatou/LeagueAPI/wiki/Status)
* [Verification Code](https://github.com/Kelmatou/LeagueAPI/wiki/Verification-Code)
* [Tournament Stub](https://github.com/Kelmatou/LeagueAPI/wiki/Tournament-Stub)
* [Tournaments](https://github.com/Kelmatou/LeagueAPI/wiki/Tournaments)
* [Patch](https://github.com/Kelmatou/LeagueAPI/wiki/Patch)
* [Profile Icons](https://github.com/Kelmatou/LeagueAPI/wiki/Profile-Icons)
* [Items](https://github.com/Kelmatou/LeagueAPI/wiki/Items)
* [Summoner Spells](https://github.com/Kelmatou/LeagueAPI/wiki/Summoner-Spells)
* [Runes](https://github.com/Kelmatou/LeagueAPI/wiki/Runes)
* [Ranked Tier](https://github.com/Kelmatou/LeagueAPI/wiki/Ranked-Tiers)
* [Champions Detailed](https://github.com/Kelmatou/LeagueAPI/wiki/Champions-(Detailed)) **- deprecated from 3.0.0**

**Clash**
* [Clash](https://github.com/Kelmatou/LeagueAPI/wiki/Clash)

### Teamfight Tactics

Teamfight Tactics API contains methods related to Teamfight Tactics game.  
It is accessible through `league.tftAPI`. From there you'll find information for:

* [Summoners](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Summoners)
* [Ranked](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Ranked-Leagues)
* [Match History](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Match-History)
* [Items](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Items)
* [Champions](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Champions)
* [Traits](https://github.com/Kelmatou/LeagueAPI/wiki/TFT-Traits)

### Leagueof Runnetera

Leagueof Runnetera API contains methods related to Leagueof Runnetera game.  
It is accessible through `league.lorAPI`. From there you'll get information about:

* [Ranked](https://github.com/Kelmatou/LeagueAPI/wiki/Runnetera-Ranked)

Full documentation is available [here](https://github.com/Kelmatou/LeagueAPI/wiki).  
Note that only the last release will appear in the documentation. See previous revisions for older LeagueAPI versions.

## Make LeagueAPI Grow Up!

If anything you wanted was missing, do not hesitate to open an issue or create a pull request. It could help future developers.
If you found LeagueAPI helpful or cool to use don't hesitate to promote it by adding a ⭐️ 😉

## Contributors

Antoine Clop ([Kelmatou](https://github.com/Kelmatou))
Ronan Cendrier ([Hanoki](https://github.com/Hanoki))
Ammon Parry ([AmmonP](https://github.com/AmmonP))
Sandi Karajic ([SKarajic](https://github.com/SKarajic))
