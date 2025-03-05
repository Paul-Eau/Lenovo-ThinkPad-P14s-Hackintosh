DefinitionBlock ("", "SSDT", 2, "P14s", "ARTC", 0x00000000)
{
	External (_SB.PCI0.LBCP, DeviceObj)
	
	Scope (\_SB.PCI0.LPCB)
	{
		Device (ARTC)
		{
			Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
			Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
			{
				Return (0x05)
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