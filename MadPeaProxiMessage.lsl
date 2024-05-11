integer rangeMeters = 1;  // Range in meters, 1 for testing
list alreadySentMessage;
float timerGap = 10.0;  // Timer for re-sending proximity message, 10 for testing
default
{
    state_entry()
    {
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
        llSetTimerEvent(timerGap);
    }

    // touch_start(integer total_number)
    // {
    //     llSay(0, "You touched me.");
    // }

    sensor(integer numberOfAgents) {
        // llSay(0, "Players in range: " + (string)numberOfAgents + ".");
        string currentPlayerKey;
        integer i;
        for (i = 0; i < numberOfAgents; i++) 
        {  // For each player in range
            currentPlayerKey = llDetectedKey(i);
            if (llListFindList(alreadySentMessage, [currentPlayerKey]) == -1) {
                llInstantMessage(currentPlayerKey, "Type in key");
                alreadySentMessage += currentPlayerKey;
            }
        }
    }

    timer()
    {
        alreadySentMessage = [];
    }
}
