// Fix power-button

DefinitionBlock ("", "SSDT", 2, "P14s", "PWRB", 0x00000000)
{
	External (_SB_, DeviceObj)
	
	Scope (\_SB)
	{
		// Fix ACPI power-button-device
        // @See https://github.com/daliansky/OC-little/blob/master/06-%E6%B7%BB%E5%8A%A0%E7%BC%BA%E5%A4%B1%E7%9A%84%E9%83%A8%E4%BB%B6/SSDT-PWRB.dsl
        // @See https://github.com/khronokernel/DarwinDumped/blob/b6d91cf4a5bdf1d4860add87cf6464839b92d5bb/MacBookPro/MacBookPro14%2C1/ACPI%20Tables/DSL/DSDT.dsl#L8082
		Device (PWRB)
		{
			Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
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