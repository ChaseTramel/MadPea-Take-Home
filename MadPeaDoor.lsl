string sound  = "Slide Door Sound";

integer listenHandler;
integer commandChannel = -150; 
key keypadKey = "b57fe2eb-8474-acf1-8b3b-122ecd2d323c";

integer rangeMeters = 5;

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
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
    }

    listen(integer channel, string name, key id, string message)
    {
        if (message == "unlock") 
        {
            moveDoor();
        }
    }
    sensor(integer numberOfAgents) {
        if (numberOfAgents > 0) {
            listenHandler = llListen(commandChannel, "", keypadKey, "");
        } else 
        {
            removeListen();
        }
    }
}
