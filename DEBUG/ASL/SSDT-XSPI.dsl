DefinitionBlock ("", "SSDT", 2, "P14s", "XSPI", 0x00000000)
{
	External (_SB_.PCI0, DeviceObj)
	
	Scope (\_SB.PCI0)
	{
		Device (XSPI)
		{
			Name (_ADR, 0x001F0005)  // _ADR: Address
			Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
			{
				If ((Arg2 == Zero))
				{
					Return (Buffer (One)
					{
						 0x03                                             // .
					})
				}

				Return (Package (0x20)
				{
					"pci-device-hidden", 
					Buffer (0x08)
					{
						 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
					}
				})
			}

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