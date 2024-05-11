default
{
    touch_start(integer numberOfTouchers)
    {
        llSay(0, string(llDetectedTouchFace(0)));
    }
    
}