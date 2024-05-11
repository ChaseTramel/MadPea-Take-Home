list keyLinkNumber = [4, 3, 2, 5, 6, 7, 10, 9, 8, 11];
list backLinkNumber = [1];

string beep = "Beep Sound";
string door = "Slide Door Sound";
float volume = 0.3;

integer timerGap = 30;
list attemptedCode = [];

integer codeLength = 3;
list doorCode = [4, 6, 11];

resetAttempts(key toucher)
{
    attemptedCode = [];
    llInstantMessage(toucher, "Code reset. Please try again.");
}


default
{
    state_entry()
    {
        llSetTimerEvent(timerGap);
    }

    touch(integer numberOfTouchers)
    { 
        
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
        
    }
}
