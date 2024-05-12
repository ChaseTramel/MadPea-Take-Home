// This script goes into the HUD object


vector blue = <0, 0, 255>;
vector red = <255, 0, 0>;

integer listenHandler;
integer commandChannel = -150; 
key keypadKey = "b57fe2eb-8474-acf1-8b3b-122ecd2d323c";

integer face = 0;

changeColor() {
    llSetLinkPrimitiveParamsFast(2, [PRIM_COLOR, ALL_SIDES, blue, 1.0]);   
}

default
{
    state_entry()
    {
        listenHandler = llListen(commandChannel, "", keypadKey, "");
    }

    listen(integer channel, string name, key id, string message)
    {
        if (message == "change") 
        {
            changeColor();
        }
    }
}
