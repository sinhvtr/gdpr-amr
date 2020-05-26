README

This is PROLEG system for simulating judge's reasoning

Directory configuration is as follows.

├ bin/
│ ├ PrologTracer.exe  ... Command to generate block diagram
│ └ ChartControl.dll  ... DLL use to generate block diagram
├ proleg/
│ ├ prolegEng190804.pl
│ ├ demo_script.txt
│ ├ simplechintai.pl
│ ├ simplechintai.bmp
│ ├ chintairulebase.pl
│ ├ proleg_fact.pl
│ ├ chintaidemo.bmp
│ ├ gdprRuleML.pl
│ ├ demo_scriptGDPR.txt
│ └ gdprRuleML.bmp
└ README.txt (this file)

1. Install Prolog

First, you need to install SWI-Prolog because PROLOG is the program that runs on SWI-Prolog. If your OS is Windows, you should install SWI-Prolog-Editor that includes editing environment.

    Go to the distribution page of SWI-Prolog-Editor. (http://arbeitsplattform.bildung.hessen.de/fach/informatik/swiprol og/indexe.html） Select your language.
    Follow the instruction on the screen to install Prolog-Editor.

2. Install the Program to Generate Block Diagram

PROLEG has the function to generate a block diagram. In order to use this function, PrologTracer.exe and ChartControl.dll must be properly positioned.

Please copy bin/PrologTracer.exe and bin/ChartControl.dll to C:\pl\bin\.

3. Example
Please see
demo_script.txt
or
demo_scriptGDPR.txt
