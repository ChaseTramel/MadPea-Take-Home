string sound  = "Slide Door Sound";

integer listenHandler;
integer keypadChannel = -150; 
key keypadKey = "c017da8e-dc89-b3cb-7b0a-3f9c83913b32";

integer rangeMeters = 5;

vector initalPos;
vector targetPos;
float moveDistance = 3.08;

removeListen()
{
    llListenRemove(listenHandler);
}

moveDoor()
{
    llTriggerSound(sound, 0.3);
    llSetPos(targetPos);
    llSetTimerEvent(6);
    llTriggerSound(sound, 0.3);
    llSetPos(initalPos);
}

default
{
    state_entry()
    {
        initalPos = llGetPos();
        targetPos = initalPos - <moveDistance, 0, 0>;
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
    }

    listen(integer channel, string name, key id, string message)
    {
        if (message == "unlock") 
        {
            llSay(0, "unlocked");
            moveDoor();
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
    touch_start(integer numberOfTouchers)
    {
        moveDoor();
    }
}
