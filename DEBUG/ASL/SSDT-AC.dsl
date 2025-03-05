// Patching AC-Device so that AppleACPIACAdapter-driver loads.
// Device named ADP1 on Mac
// See https://github.com/khronokernel/DarwinDumped/blob/b6d91cf4a5bdf1d4860add87cf6464839b92d5bb/MacBookPro/MacBookPro14%2C1/ACPI%20Tables/DSL/DSDT.dsl#L7965

DefinitionBlock ("", "SSDT", 2, "P14s", "AC", 0x00000000)
{
	External (_SB.PCI0.LPCB.EC.AC, DeviceObj)
	
	Scope (\_SB.PCI0.LPCB.EC.AC)
	{
		If (_OSI ("Darwin"))
		{
			Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
			{
				0x17, 
				0x03
			})
		}
	}	
}