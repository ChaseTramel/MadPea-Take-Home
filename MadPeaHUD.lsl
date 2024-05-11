vector blue = <0, 0, 255>;
vector red = <255, 0, 0>;

integer listenHandler;
integer commandChannel = -150; 
key keypadKey = "c017da8e-dc89-b3cb-7b0a-3f9c83913b32";

integer face = 0;

integer rangeMeters = 5;

changeColor() {
    llSay(0, "doing it");
    llSetLinkPrimitiveParamsFast(2, [PRIM_COLOR, ALL_SIDES, blue, 1.0]);   
}

removeListen()
{
    llListenRemove(listenHandler);
}

default
{
    state_entry()
    {
        listenHandler = llListen(commandChannel, "", keypadKey, "");
        llSay(0, "listening");
    }

    listen(integer channel, string name, key id, string message)
    {
        if (message == "change") 
        {
            llSay(0, "change color");
            changeColor();
        }
    }
}
