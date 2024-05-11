string sound  = "Slide Door Sound";

integer listenHandler;
integer keypadChannel = -150; 
key keypadKey = "c017da8e-dc89-b3cb-7b0a-3f9c83913b32";

integer rangeMeters = 5;

vector initalPos;
vector targetPos;
float moveDistance = 3.08;
float moveTime = 5.0;
float waitTime = 6.0;

removeListen()
{
    llListenRemove(listenHandler);
}

moveDoor()
{
    llTriggerSound(sound, 0.3);
    llSetKeyframedMotion(
        [<(moveDistance * -1), 0.0, 0.0>, ZERO_ROTATION, moveTime,
            <0.0, 0.0, 0.0>`, ZERO_ROTATION, waitTime, 
            <moveDistance, 0.0, 0.0>, ZERO_ROTATION, moveTime],
        [KFM_MODE, KFM_FORWARD]);
}

default
{
    state_entry()
    {
        llSetLinkPrimitiveParamsFast(LINK_THIS,
    [PRIM_PHYSICS_SHAPE_TYPE, PRIM_PHYSICS_SHAPE_CONVEX]);
    llSetKeyframedMotion([],[]);
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
