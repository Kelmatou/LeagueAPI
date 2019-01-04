# LeagueAPI

League API is a League of Legends Framework in Swift. It provides an easy way to get League's data into your iOS application.

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

This section lists main solutions to be able to `import LeagueAPI` in your project.

* Go back to your project, target settings -> Build Settings -> Framework Search Paths, then add the path to LeagueAPI.framework.

If none of these helped you, open an issue describing your problem and I'll try to check it out as soon as possible.


## 📋 Requirements 📋

The only required element from the framework user is a Riot API Key.
You'll get one by visiting https://developer.riotgames.com. Create an account and on you dashboard, you'll be able to generate your key.
By default, Riot will generate a 'Development Key', which expires in 24h. When your application is ready to be deployed and respects Riot API usage conditions, you can apply for a 'Production Key'.
Please note that you should agree with [Riot API usage policy](https://developer.riotgames.com/policies.html)

## 😈 First Blood 😈

Starting using this framework requires you to create an instance of LeagueAPI by writing:

`let league = LeagueAPI(APIToken: "*INSERT YOUR KEY HERE*")`

Now use this instance everywhere, you shouldn't recreate the LeagueAPI variable.

## 🧐 And then? 🧐

LeagueAPI has 2 major parts:
* Riot API's methods
* Other custom methods

### Riot API <img src="https://www.riotgames.com/darkroom/original/06fc475276478d31c559355fa475888c:af22b5d4c9014d23b550ea646eb9dcaf/riot-logo-fist-only.png" width="44" height="40">

Riot API provides data related to players, that are evolving when you play. LeagueAPI offers a safe (all problems such as key's rate limit are handled)  wrapper on this Riot service. It is accessible from `league.riotAPI`. From there, you'll access many informations on:

* [Summoners](https://github.com/Kelmatou/LeagueAPI/wiki/Summoners)
* [Spectator/Live Game](https://github.com/Kelmatou/LeagueAPI/wiki/Spectator---Live-Game)
* [Ranked/Leagues](https://github.com/Kelmatou/LeagueAPI/wiki/Ranked---Leagues)
* [Match History](https://github.com/Kelmatou/LeagueAPI/wiki/Match-History)
* [Champion Mastery](https://github.com/Kelmatou/LeagueAPI/wiki/Champion-Mastery)
* [Champions](https://github.com/Kelmatou/LeagueAPI/wiki/Champions)
* [Server Status](https://github.com/Kelmatou/LeagueAPI/wiki/Status)
* [Verification Code](https://github.com/Kelmatou/LeagueAPI/wiki/Verification-Code)
* [Tournament Stub](https://github.com/Kelmatou/LeagueAPI/wiki/Tournament-Stub)
* [Tournaments](https://github.com/Kelmatou/LeagueAPI/wiki/Tournaments)

**LeagueAPI now uses Riot API v4, as v3 will be deprecated on 28th january 2019.**  
**❗️Upgrading to LeagueAPI >= 1.2.0 will break any SummonerId or AccountId you may store.❗️**

### Custom Methods 

Some League of Legends data only change with patches (champions, items...). Those data can be found directly without creating a LeagueAPI instance `league`. You'll be able to get data on:

* [Patch](https://github.com/Kelmatou/LeagueAPI/wiki/Patch)
* [Champions](https://github.com/Kelmatou/LeagueAPI/wiki/Champions-(Detailed))
* [Profile Icons](https://github.com/Kelmatou/LeagueAPI/wiki/Profile-Icons)
* [Items](https://github.com/Kelmatou/LeagueAPI/wiki/Items)
* [Summoner Spells](https://github.com/Kelmatou/LeagueAPI/wiki/Summoner-Spells)
* [Runes](https://github.com/Kelmatou/LeagueAPI/wiki/Runes)
* [Ranked Tier](https://github.com/Kelmatou/LeagueAPI/wiki/Ranked-Tiers)

Full documentation is available [here](https://github.com/Kelmatou/LeagueAPI/wiki).  
Note that only the last release will appear in the documentation. See previous revisions for older LeagueAPI versions.

## Make LeagueAPI Grow Up!

If anything you wanted was missing, do not hesitate to open an issue or create a pull request. It could help future developers.
If you found LeagueAPI helpfull or cool to use don't hesitate to promote it by adding a ⭐️ 😉

## Authors

Antoine Clop ([Kelmatou](https://github.com/Kelmatou))  
Ronan Cendrier ([Hanoki](https://github.com/Hanoki))
