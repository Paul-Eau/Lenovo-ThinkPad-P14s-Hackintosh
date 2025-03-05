DefinitionBlock ("", "SSDT", 2, "P14s", "INIT", 0x00000000)
{
	External (_SB.HIDD._STA, UnknownObj)
	External (_SB_.PCI0.LPCB.EC.HKEY, DeviceObj)
	External (_SB_.PCI0.LPCB.SBUS, DeviceObj)
	External (_SI_._SST, MethodObj) 
	External (GPHD, FieldUnitObj)
    External (HPTE, IntObj)
    External (LNUX, IntObj)
    External (STAS, FieldUnitObj)
    External (WNTF, IntObj)
	
	Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.HIDD._STA = Zero
			\GPHD = One
			// disable HPET. It shouldn't be needed on modern systems anyway and is also disabled in genuine OSX
            HPTE = Zero
			// Initialze mute button mode like Linux when it's broken, may be combined with MuteLEDFixup in prefpane.
            LNUX = One
            STAS = One
			// Enable DYTC thermal-management on newer Thinkpads. Please check \_SB.PCI0.LPCB.EC.HKEY.DYTC()
            WNTF = One
        }
	}	
	
	Scope(\_SB.PCI0.LPCB.EC.HKEY)
	{
		If (_OSI ("Darwin"))
		{
			// Patch OSYS to native value of darwin
			Name (OSYS, 0x07DF)
		}

		// Used as a proxy-method to interface with \_SI._SST in YogaSMC
		Method (CSSI, 1, NotSerialized)
		{
			If (_OSI ("Darwin"))
			{
				\_SI._SST (Arg0)
			}
		}
	}
	
	Scope(\_SB.PCI0.LPCB.SBUS)
	{
		Name (RCFG, Package (0x0E)
		{
			"ForceTouchType", 
			Zero, 
			"PalmRejectionMaxObjWidth", 
			0x05, 
			"PalmRejectionMaxObjHeight", 
			0x06, 
			"TrackpointMultiplier", 
			0x16, 
			"TrackpointDeadzone", 
			Zero,
			"TrackpointScrollMultiplierX",
			0x15,
			"TrackpointScrollMultiplierY",
			0x15
		})
	}
}