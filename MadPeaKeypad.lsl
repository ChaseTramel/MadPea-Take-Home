list keyLinkNumber = [4, 3, 2, 5, 6, 7, 10, 9, 8, 11];
list backLinkNumber = [1];

string beep = "Beep Sound";
float volume = 0.3;

integer timerGap = 10;  // 10 second restart for testing
list attemptedCode = [];

integer codeLength = 3;
list doorCode = [4, 6, 11];

resetAttempts(key toucher)
{
    attemptedCode = [];
    llInstantMessage(toucher, "Code reset. Please try again.");
}
doorUnlock() {

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
        if (attemptedCode == doorCode)
        {
            llInstantMessage(toucher, "Door unlocked!");
            llSetTimerEvent(0);
        }
    }
    timer()
    {
        llSay(0, "Keypad has timed out. Please try again.");
        attemptedCode = [];
    }
}
