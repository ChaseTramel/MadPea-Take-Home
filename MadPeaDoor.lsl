string sound  = "Slide Door Sound";

integer listenHandler;
integer keypadChannel = -150; 
key keypadKey = "2318cfc2-57f0-c859-09e0-61db469b4799";

integer rangeMeters = 5;

removeListen()
{
    llListenRemove(listenHandler);
}

default
{
    state_entry()
    {
        listenHandler = llListen(keypadChannel, "", keypadKey, "");
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
    }

    listen(integer channel, string name, key id, string message)
    {
        if (message == "unlock") 
        {
            llSay(0, "unlocked");
        }
    }
    sensor(integer numberOfAgents) {
        if (numberOfAgents > 0) {
            listenHandler = llListen(keypadChannel, "", keypadKey, "");
        } else 
        {
            removeListen();
        }
        
    }
}
