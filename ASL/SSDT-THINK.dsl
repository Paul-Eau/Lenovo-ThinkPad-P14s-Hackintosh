DefinitionBlock ("", "SSDT", 2, "Paul", "THINK", 0x00000000)
{
    External (_SB.PCI0.LPCB.EC, DeviceObj)    // EC path
    External (_SB.PCI0.LPCB.EC.HKEY, DeviceObj)    // HKEY path
    External (_SB.PCI0.LPCB.EC.HFSP, FieldUnitObj)    // Fan control register
    External (_SB.PCI0.LPCB.EC.HFNI, FieldUnitObj)    // Fan control register
    External (_SB.PCI0.LPCB.EC.VRST, FieldUnitObj)    // Second fan switch register
    External (_SI._SST, MethodObj)    // Indicator
    External (LNUX, IntObj)    // Variable set with "Linux" or "FreeBSD"
    External (WNTF, IntObj)    // Variable set with "Windows 2001" or "Microsoft Windows NT"

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            // Initialze mute button mode like Linux when it's broken, may be combined with MuteLEDFixup in prefpane.
            LNUX = One
            // Enable DYTC thermal-management on newer Thinkpads. Please check \_SB.PCI0.LPCB.EC.HKEY.DYTC()
            WNTF = One

        }
    }

    
    
    /*
     * ThinkSMC sensor access
     * Double check name of FieldUnit for collision
     * Registers return 0x00 for non-implemented, 
     * and return 0x80 when not available.
     */

    Scope (_SB.PCI0.LPCB.EC)
    {
        OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
        Field (ESEN, ByteAcc, Lock, Preserve)
        {
            Offset (0x78), 
            TMP0,   8, 
            TMP1,   8, 
            TMP2,   8, 
            Offset (0x7C), 
            TMP3,   8, 
            TMP4,   8, 
            TMP5,   8, 

        }
    }
    
    
    /**
     * Proxy methods for YogaSMC
     */

    Scope (\_SB.PCI0.LPCB.EC.HKEY)
    {
        
        // Optional: Write access to fan control register
        Method (CFSP, 1, NotSerialized)
        {
            \_SB.PCI0.LPCB.EC.HFSP = Arg0
        }

        Method (CFNI, 1, NotSerialized)
        {
            \_SB.PCI0.LPCB.EC.HFNI = Arg0
        }

        Method (CRST, 1, NotSerialized)
        {
            \_SB.PCI0.LPCB.EC.VRST = Arg0
        }
        
        // Used as a proxy-method to interface with \_SI._SST in YogaSMC
        Method (CSSI, 1, NotSerialized)
        {
            \_SI._SST (Arg0)
        }
    }
}

