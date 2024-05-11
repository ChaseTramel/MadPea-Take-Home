integer rangeMeters = 5;

default
{
    state_entry()
    {
        llSensorRepeat("", "", AGENT, rangeMeters * PI, PI, 1);
    }

    touch_start(integer total_number)
    {
        llSay(0, "You touched me.");
    }
    sensor(integer numberOfAgents) {
        llSay(0, "Players in range: " + (string)numberOfAgents + ".");
        string currentPlayerKey;
        integer i;
        for (i = 0; i < numberOfAgents; i++) {
            currentPlayerKey = llDetectedKey(i);
            llInstantMessage(currentPlayerKey, "Type in key");
        }
    }
}
