 // Neccessary dependcies to read from the machine's embedded controller.
 
 // For use with YogaSMC.kext and App
 // https://github.com/zhen-zen/YogaSMC

DefinitionBlock ("", "SSDT", 2, "P14s", "ECRW", 0x00000000)
{
	External (_SB.PCI0.LPCB.EC__, DeviceObj)
	
	Scope (\_SB.PCI0.LPCB.EC)
	{
		/* 
         * Called from RECB, grabs a single byte from EC
         * Arg0 - offset in bytes from zero-based EC
         */
		Method (RE1B, 1, NotSerialized)
		{
			If (_OSI ("Darwin"))
			{
				OperationRegion (ERAM, EmbeddedControl, Arg0, One)
				Field (ERAM, ByteAcc, NoLock, Preserve)
				{
					BYTE,   8
				}

				Return (BYTE) /* \_SB_.PCI0.LPCB.EC__.RE1B.BYTE */
			}

			Return (Zero)
		}

		 /* 
         * Grabs specified number of bytes from EC
         * Arg0 - offset in bytes from zero-based EC
         * Arg1 - size of buffer in bits
         */
		Method (RECB, 2, Serialized)
		{
			If (_OSI ("Darwin"))
			{
				Arg1 = ((Arg1 + 0x07) >> 0x03)
				Name (TEMP, Buffer (Arg1){})
				Arg1 += Arg0
				Local0 = Zero
				While ((Arg0 < Arg1))
				{
					TEMP [Local0] = RE1B (Arg0)
					Arg0++
					Local0++
				}

				Return (TEMP) /* \_SB_.PCI0.LPCB.EC__.RECB.TEMP */
			}

			Return (Zero)
		}

		Method (WE1B, 2, NotSerialized)
		{
			If (_OSI ("Darwin"))
			{
				OperationRegion (ERAM, EmbeddedControl, Arg0, One)
				Field (ERAM, ByteAcc, NoLock, Preserve)
				{
					BYTE,   8
				}

				BYTE = Arg1
			}
		}

		Method (WECB, 3, Serialized)
		{
			If (_OSI ("Darwin"))
			{
				Arg1 = ((Arg1 + 0x07) >> 0x03)
				Name (TEMP, Buffer (Arg1){})
				TEMP = Arg2
				Arg1 += Arg0
				Local0 = Zero
				While ((Arg0 < Arg1))
				{
					WE1B (Arg0, DerefOf (TEMP [Local0]))
					Arg0++
					Local0++
				}
			}
		}
		
		OperationRegion (ESEN, EmbeddedControl, Zero, 0x0100)
		Field (ESEN, ByteAcc, Lock, Preserve)
		{
			Offset (0x78), 
			EST0,   8, 
			EST1,   8, 
			EST2,   8, 
			EST3,   8, 
			EST4,   8, 
			EST5,   8, 
			EST6,   8, 
			EST7,   8, 
			Offset (0xC0), 
			EST8,   8, 
			EST9,   8, 
			ESTA,   8, 
			ESTB,   8, 
			ESTC,   8, 
			ESTD,   8, 
			ESTE,   8, 
			ESTF,   8
		}		
	}	
}