list keyLinkNumber = [4, 3, 2, 5, 6, 7, 10, 9, 8, 11];
list backLinkNumber = [1];
// string beep = "Beep Sound"
// string door = "Slide Door Sound"

default
{
    state_entry()
    {
    }

    touch_start(integer numberOfTouchers)
    { 
        integer touchedItem = llDetectedLinkNumber(0);
        if(llListFindList(keyLinkNumber, [touchedItem]) !=  -1) 
        {
            llSay(0, "You touched a key");
        }
    }
}
