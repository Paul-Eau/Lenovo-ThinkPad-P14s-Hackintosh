DefinitionBlock ("", "SSDT", 2, "P14s", "SRAM", 0x00000000)
{
	External (_SB.PCI0, DeviceObj)
	
	Scope (\_SB.PCI0)
	{
		Device (SRAM)
		{
			Name (_ADR, 0x00140002)  // _ADR: Address
			Method (_STA, 0, NotSerialized)  // _STA: Status
			{
				If (_OSI ("Darwin"))
				{
					Return (0x0F)
				}
				Else
				{
					Return (Zero)
				}
			}
		}
	}	
}