list keyLinkNumber = [4, 3, 2, 5, 6, 7, 10, 9, 8, 11];
list backLinkNumber = [1];

string beep = "Beep Sound";
float volume = 0.3;

integer timerGap = 30;  
list attemptedCode = [];

integer codeLength = 3;
list doorCode = [4, 6, 11];

key doorKey = "2e55995b-3687-2c2d-a2ec-914dbaeaaf74"
integer doorChannel = -150; 

resetAttempts(key toucher)
{
    attemptedCode = [];
    llInstantMessage(toucher, "Code reset. Please try again.");
}
doorUnlock() {
    llRegionSayTo(doorKey, doorChannel, "unlock");
}




default
{
    state_entry()
    {
        llSetTimerEvent(timerGap);
    }

    touch(integer numberOfTouchers)
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
            llInstantMessage(toucher, string(attemptedCode));
        }
        if (llGetListLength(attemptedCode) == codeLength && llListFindList(attemptedCode, doorCode) != -1)
        {
            llInstantMessage(toucher, "Door unlocked!");
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