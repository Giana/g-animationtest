# G-AnimationTest

G-AnimationTest is a script for FiveM QBCore providing a command to test any animation given the animation dictionary and name.

<h1>INSTALLATION GUIDE</h1>

1. Drop the g-animationtest folder into your [standalone] folder (or whichever other ensured folder you want to use)
2. Use "add_ace" in your server.cfg to give desired access to the command
    1. Ex: add_ace group.admin "can.testanim" allow
    2. Ex. add_ace identifier.steam:xxxxxxxxxxxxxxx "can.testanim" allow
    3. For more info: https://forum.cfx.re/t/basic-aces-principals-overview-guide/90917

<h1>FEATURES</h1>

- /testanim [animDictionary] [animationName] used to test an animation on your player
    - Ex. /testanim anim@mp_snowball pickup_snowball
      - For more animations: https://alexguirre.github.io/animations-list/
- Menu allows you to select an animation flag or input your own

**IMAGES**
-----
Coming Soon

**DEPENDENCIES**
-----
- [QBCore](https://github.com/qbcore-framework)
    - [qb-core](https://github.com/qbcore-framework/qb-core)
    - [qb-input](https://github.com/qbcore-framework/qb-input)
    - [qb-menu](https://github.com/qbcore-framework/qb-menu)