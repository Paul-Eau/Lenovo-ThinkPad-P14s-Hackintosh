DefinitionBlock ("", "SSDT", 2, "P14s", "THBT", 0x00000000)
{
	External (_SB.PCI0, DeviceObj)
	External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
	
	Scope (\_SB.PCI0)
	{
		Scope (RP05)
		{
			If (_OSI ("Darwin"))
			{
				Scope (PXSX)
				{
					Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
					{
						Return (Zero)
					}

					Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
					{
						If ((Arg2 == Zero))
						{
							Return (Buffer (One)
							{
								 0x03                                             // .
							})
						}

						Return (Package (0x02)
						{
							"PCI-Thunderbolt", 
							One
						})
					}

					Device (DSB0)
					{
						Name (_ADR, Zero)  // _ADR: Address
						Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
						{
							Return (Zero)
						}

						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}

						Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
						{
							If ((Arg2 == Zero))
							{
								Return (Buffer (One)
								{
									 0x03                                             // .
								})
							}

							Return (Package (0x02)
							{
								"PCIHotplugCapable", 
								Zero
							})
						}

						Device (NHI0)
						{
							Name (_ADR, Zero)  // _ADR: Address
							Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
							Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
							{
								Return (Zero)
							}

							Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
							{
								If ((Arg2 == Zero))
								{
									Return (Buffer (One)
									{
										 0x03                                             // .
									})
								}

								Return (Package (0x03)
								{
									"power-save", 
									One, 
									Buffer (One)
									{
										 0x00                                             // .
									}
								})
							}
						}
					}

					Device (DSB1)
					{
						Name (_ADR, 0x00010000)  // _ADR: Address
						Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
						{
							Return (Zero)
						}

						Method (_STA, 0, NotSerialized)  // _STA: Status
						{
							Return (0x0F)
						}

						Device (UPS0)
						{
							Name (_ADR, Zero)  // _ADR: Address
							Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
							{
								Return (One)
							}
						}
					}
				}
			}
		}
	}	
}