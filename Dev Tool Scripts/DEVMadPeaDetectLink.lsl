default
{
    touch_start(integer num_detected)
    {
        llOwnerSay("Link number clicked: " + (string)llDetectedLinkNumber(0) );       
    }
}