// This script goes into the keypad


list keyLinkNumber = [4, 3, 2, 5, 6, 7, 10, 9, 8, 11];
list backLinkNumber = [1];

string beep = "Beep Sound";
float volume = 0.3;

integer timerGap = 30;  
list attemptedCode = [];

integer codeLength = 3;
list doorCode = [4, 6, 11];

key doorKey = "fd569079-bbc8-5eae-55b3-121aeebebd4a";
key hudKey = "4a0f014f-4548-f11a-e1f2-fd2b587b2562";
integer commandChannel = -150; 

float secSleep = 0.5;


resetAttempts(key toucher)
{
    attemptedCode = [];
    llInstantMessage(toucher, "Code reset. Please try again.");
}

doorUnlock() {
    llRegionSayTo(doorKey, commandChannel, "unlock");
    llSleep(secSleep);
    llRegionSayTo(hudKey, commandChannel, "change");
}




default
{
    state_entry()
    {
    }

    touch_start( integer numOfTouchers)
    { 
        llSetTimerEvent(timerGap);
        key toucher = llDetectedKey(0);
        integer touchedItem = llDetectedLinkNumber(0);
        if (llGetListLength(attemptedCode) == codeLength)
        {
            resetAttempts(toucher);
        } 
        else if(llListFindList(keyLinkNumber, [touchedItem]) !=  -1) 
        {
            llPlaySound(beep, volume);
            attemptedCode += [touchedItem];
            llSay(0,"Beep");
        }
        if (llGetListLength(attemptedCode) == codeLength && llListFindList(attemptedCode, doorCode) != -1)
        {
            llInstantMessage(toucher, "Door unlocked!");
            doorUnlock();
            llSetTimerEvent(0);
        }
    }
    timer()
    {
        if (llGetListLength(attemptedCode) > 0)
        {
            llSay(0, "Keypad has timed out. Please try again.");
            attemptedCode = [];
        }

    }
}