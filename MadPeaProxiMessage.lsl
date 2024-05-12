// This script can go into any of the objects, but I put it in the keypad


integer rangeMeters = 5; 
list alreadySentMessage;
float timerGap = 30.0;  

key doorKey = "2e55995b-3687-2c2d-a2ec-914dbaeaaf74";

default
{
    state_entry()
    {
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
        llSetTimerEvent(timerGap);
    }

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
