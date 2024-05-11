string sound  = "Slide Door Sound";

integer listenHandler;
integer keypadChannel = -150; 
key keypadKey = "2318cfc2-57f0-c859-09e0-61db469b4799";

removeListenForProx()
{
    llListenRemove(listenForProx);
}

default
{
    state_entry()
    {
        llSay(0, "Hello, Avatar!");
        listenHandler = llListen(keypadChannel, "", keypadKey, "");
    }
    listen(integer channel, string name, key id, string message)
    {
        if (message == "unlock") 
        {
            llSay(0, "unlocked");
        }
    }
}
