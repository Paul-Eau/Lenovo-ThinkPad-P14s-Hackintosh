// Fix up memory controller

DefinitionBlock ("", "SSDT", 2, "P14s", "DMAC", 0x00000000)
{
	External (_SB.PCI0.LPCB, DeviceObj)
	
	// https://github.com/daliansky/OC-little/blob/master/06-%E6%B7%BB%E5%8A%A0%E7%BC%BA%E5%A4%B1%E7%9A%84%E9%83%A8%E4%BB%B6/SSDT-DMAC.dsl
	Scope (\_SB.PCI0.LPCB)
	{
		// https://github.com/khronokernel/DarwinDumped/blob/b6d91cf4a5bdf1d4860add87cf6464839b92d5bb/MacBookPro/MacBookPro14%2C1/ACPI%20Tables/DSL/DSDT.dsl#L5044
        // https://github.com/coreboot/coreboot/blob/master/src/soc/intel/common/block/acpi/acpi/lpc.asl
		Device (DMAC)
		{
			Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
			Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
			{
				IO (Decode16,
					0x0000,             // Range Minimum
					0x0000,             // Range Maximum
					0x01,               // Alignment
					0x20,               // Length
					)
				IO (Decode16,
					0x0081,             // Range Minimum
					0x0081,             // Range Maximum
					0x01,               // Alignment
					0x11,               // Length
					)
				IO (Decode16,
					0x0093,             // Range Minimum
					0x0093,             // Range Maximum
					0x01,               // Alignment
					0x0D,               // Length
					)
				IO (Decode16,
					0x00C0,             // Range Minimum
					0x00C0,             // Range Maximum
					0x01,               // Alignment
					0x20,               // Length
					)
				DMA (Compatibility, NotBusMaster, Transfer8_16, )
					{4}
			})
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