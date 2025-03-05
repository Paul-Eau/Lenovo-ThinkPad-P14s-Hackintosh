DefinitionBlock ("", "SSDT", 2, "P14s", "P14s", 0x00000000)
{
    External (_SB_.HIDD._STA, UnknownObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
	External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
	External (_SB_.PCI0.LPCB.KBD_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
	External (_SB_.PCI0.LPCB.EC__.XQ16, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ1F, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ60, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ61, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ62, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ64, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ66, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.XQ6A, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.AC__, DeviceObj)
	External (_SB_.PCI0.LPCB.EC__.AC__._PSR, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY, DeviceObj)
	External (_SB_.PCI0.LPCB.EC__.HKEY.MLCS, MethodObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.MMTS, MethodObj)
	External (_SB_.PCI0.LPCB.EC__.B0I0, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B0I1, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B0I2, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B0I3, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B1I0, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B1I1, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B1I2, IntObj)
    External (_SB_.PCI0.LPCB.EC__.B1I3, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BAT0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.BATM, MutexObj)
    External (_SB_.PCI0.LPCB.EC__.BSWA, IntObj)
    External (_SB_.PCI0.LPCB.EC__.BSWR, IntObj)
    External (_SB_.PCI0.LPCB.EC__.HAM4, IntObj)
    External (_SB_.PCI0.LPCB.EC__.HB0S, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HB1S, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HIID, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC__.HT0H, IntObj)
    External (_SB_.PCI0.LPCB.EC__.HT0L, IntObj)
    External (_SB_.PCI0.LPCB.EC__.XBIF, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.LPCB.EC__.XBIX, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.LPCB.EC__.XBST, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.LPCB.EC__.XJTP, MethodObj)
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
	External(_SB.PCI0.RP09.PEGP._OFF, MethodObj)
    External (_SI_._SST, MethodObj) 
	External (B0I0, IntObj)
    External (B0I1, IntObj)
    External (B0I2, IntObj)
    External (B0I3, IntObj)
    External (B1I0, IntObj)
    External (B1I1, IntObj)
    External (B1I2, IntObj)
    External (B1I3, IntObj)
    External (HB0S, IntObj)
    External (HB1S, IntObj)
    External (HPTE, IntObj)
	External (GPHD, FieldUnitObj)
    External (LNUX, IntObj)
    External (STAS, FieldUnitObj)
    External (WNTF, IntObj)
    External (XPRW, MethodObj)



	Method (B1B2, 2, NotSerialized)
    {
        Local0 = (Arg1 << 0x08)
        Local0 |= Arg0
        Return (Local0)
    }

    Method (B1B4, 4, NotSerialized)
    {
        Local0 = Arg3
        Local0 = (Arg2 | (Local0 << 0x08))
        Local0 = (Arg1 | (Local0 << 0x08))
        Local0 = (Arg0 | (Local0 << 0x08))
        Return (Local0)
    }

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.HIDD._STA = Zero
			\GPHD = One
            HPTE = Zero
            LNUX = One
            STAS = One
            WNTF = One
        }

        Scope (_SB)
        {
            Scope (PCI0)
            {
                Device (GAUS)
                {
                    Name (_ADR, 0x00080000)  // _ADR: Address
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

                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x13)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (ALS0)
                    {
                        Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                        Name (_CID, "smc-als")  // _CID: Compatible ID
                        Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
                        Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
                        {
                            Package (0x02)
                            {
                                0x64, 
                                0x012C
                            }
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

                    Scope (EC)
                    {
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

                        Scope (AC)
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

                        Scope (HKEY)
                        {
                            If (_OSI ("Darwin"))
                            {
                                Name (OSYS, 0x07DF)
                            }

                            Method (CSSI, 1, NotSerialized)
                            {
                                If (_OSI ("Darwin"))
                                {
                                    \_SI._SST (Arg0)
                                }
                            }
                        }

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
						Name (LED1, Zero)
						Name (LED2, Zero)
						Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							Notify (\_SB.PCI0.LPCB.KBD, 0x0206)
							Notify (\_SB.PCI0.LPCB.KBD, 0x0286)
						}

						Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							Notify (\_SB.PCI0.LPCB.KBD, 0x0205)
							Notify (\_SB.PCI0.LPCB.KBD, 0x0285)
						}

						Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x036B)
								If ((LED1 == Zero))
								{
									\_SB.PCI0.LPCB.EC.HKEY.MMTS (0x02)
									LED1 = One
								}
								Else
								{
									\_SB.PCI0.LPCB.EC.HKEY.MMTS (Zero)
									LED1 = Zero
								}
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ6A ()
							}
						}

						Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ16 ()
							}
						}

						Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ64 ()
							}
						}

						Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x0369)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ66 ()
							}
						}

						Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
								Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
								Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ60 ()
							}
						}

						Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x011D)
								Notify (\_SB.PCI0.LPCB.KBD, 0x0448)
								Notify (\_SB.PCI0.LPCB.KBD, 0x019D)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ61 ()
							}
						}

						Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
							}
							Else
							{
								\_SB.PCI0.LPCB.EC.XQ62 ()
							}
						}

						Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
						{
							If (_OSI ("Darwin"))
							{
								If ((LED2 == Zero))
								{
									Notify (\_SB.PCI0.LPCB.KBD, 0x0136)
									Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
									Notify (\_SB.PCI0.LPCB.KBD, 0x01B6)
									\_SB.PCI0.LPCB.EC.HKEY.MLCS (One)
									LED2 = One
								}
								ElseIf ((LED2 == One))
								{
									Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
									Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
									Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
									\_SB.PCI0.LPCB.EC.HKEY.MLCS (0x02)
									LED2 = 0x02
								}
								ElseIf ((LED2 == 0x02))
								{
									Notify (\_SB.PCI0.LPCB.KBD, 0x012A)
									Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
									Notify (\_SB.PCI0.LPCB.KBD, 0x01AA)
									\_SB.PCI0.LPCB.EC.HKEY.MLCS (Zero)
									LED2 = Zero
								}
								Else
								{
									\_SB.PCI0.LPCB.EC.XQ1F ()
								}
							}
						}
						
						Method (MNXX, 0, NotSerialized)
						{
							Local0 = Buffer (0x10){}
							Local0 [Zero] = MN00 /* \_SB_.PCI0.LPCB.EC__.MN00 */
							Local0 [One] = MN01 /* \_SB_.PCI0.LPCB.EC__.MN01 */
							Local0 [0x02] = MN02 /* \_SB_.PCI0.LPCB.EC__.MN02 */
							Local0 [0x03] = MN03 /* \_SB_.PCI0.LPCB.EC__.MN03 */
							Local0 [0x04] = MN04 /* \_SB_.PCI0.LPCB.EC__.MN04 */
							Local0 [0x05] = MN05 /* \_SB_.PCI0.LPCB.EC__.MN05 */
							Local0 [0x06] = MN06 /* \_SB_.PCI0.LPCB.EC__.MN06 */
							Local0 [0x07] = MN07 /* \_SB_.PCI0.LPCB.EC__.MN07 */
							Local0 [0x08] = MN08 /* \_SB_.PCI0.LPCB.EC__.MN08 */
							Local0 [0x09] = MN09 /* \_SB_.PCI0.LPCB.EC__.MN09 */
							Local0 [0x0A] = MN0A /* \_SB_.PCI0.LPCB.EC__.MN0A */
							Local0 [0x0B] = MN0B /* \_SB_.PCI0.LPCB.EC__.MN0B */
							Local0 [0x0C] = MN0C /* \_SB_.PCI0.LPCB.EC__.MN0C */
							Local0 [0x0D] = MN0D /* \_SB_.PCI0.LPCB.EC__.MN0D */
							Local0 [0x0E] = MN0E /* \_SB_.PCI0.LPCB.EC__.MN0E */
							Local0 [0x0F] = MN0F /* \_SB_.PCI0.LPCB.EC__.MN0F */
							Return (ToString (Local0, Ones))
						}

						Method (DNXX, 0, NotSerialized)
						{
							Local0 = Buffer (0x10){}
							Local0 [Zero] = DN00 /* \_SB_.PCI0.LPCB.EC__.DN00 */
							Local0 [One] = DN01 /* \_SB_.PCI0.LPCB.EC__.DN01 */
							Local0 [0x02] = DN02 /* \_SB_.PCI0.LPCB.EC__.DN02 */
							Local0 [0x03] = DN03 /* \_SB_.PCI0.LPCB.EC__.DN03 */
							Local0 [0x04] = DN04 /* \_SB_.PCI0.LPCB.EC__.DN04 */
							Local0 [0x05] = DN05 /* \_SB_.PCI0.LPCB.EC__.DN05 */
							Local0 [0x06] = DN06 /* \_SB_.PCI0.LPCB.EC__.DN06 */
							Local0 [0x07] = DN07 /* \_SB_.PCI0.LPCB.EC__.DN07 */
							Local0 [0x08] = DN08 /* \_SB_.PCI0.LPCB.EC__.DN08 */
							Local0 [0x09] = DN09 /* \_SB_.PCI0.LPCB.EC__.DN09 */
							Local0 [0x0A] = DN0A /* \_SB_.PCI0.LPCB.EC__.DN0A */
							Local0 [0x0B] = DN0B /* \_SB_.PCI0.LPCB.EC__.DN0B */
							Local0 [0x0C] = DN0C /* \_SB_.PCI0.LPCB.EC__.DN0C */
							Local0 [0x0D] = DN0D /* \_SB_.PCI0.LPCB.EC__.DN0D */
							Local0 [0x0E] = DN0E /* \_SB_.PCI0.LPCB.EC__.DN0E */
							Local0 [0x0F] = DN0F /* \_SB_.PCI0.LPCB.EC__.DN0F */
							Return (ToString (Local0, Ones))
						}

						OperationRegion (BRAM, EmbeddedControl, Zero, 0x0100)
						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							RC00,   8, 
							RC01,   8, 
							FC00,   8, 
							FC01,   8, 
							Offset (0xA6), 
							Offset (0xA8), 
							AC00,   8, 
							AC01,   8, 
							BV00,   8, 
							BV01,   8, 
							Offset (0xAE), 
							Offset (0xB0)
						}

						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							SB00,   8, 
							SB01,   8, 
							Offset (0xA4), 
							CC00,   8, 
							CC01,   8
						}

						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							DC00,   8, 
							DC01,   8, 
							DV00,   8, 
							DV01,   8, 
							Offset (0xA6), 
							Offset (0xA8), 
							DT00,   8, 
							DT01,   8, 
							SN00,   8, 
							SN01,   8
						}

						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							CH00,   8, 
							CH01,   8, 
							CH02,   8, 
							CH03,   8
						}

						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							MN00,   8, 
							MN01,   8, 
							MN02,   8, 
							MN03,   8, 
							MN04,   8, 
							MN05,   8, 
							MN06,   8, 
							MN07,   8, 
							MN08,   8, 
							MN09,   8, 
							MN0A,   8, 
							MN0B,   8, 
							MN0C,   8, 
							MN0D,   8, 
							MN0E,   8, 
							MN0F,   8
						}

						Field (BRAM, ByteAcc, NoLock, Preserve)
						{
							Offset (0xA0), 
							DN00,   8, 
							DN01,   8, 
							DN02,   8, 
							DN03,   8, 
							DN04,   8, 
							DN05,   8, 
							DN06,   8, 
							DN07,   8, 
							DN08,   8, 
							DN09,   8, 
							DN0A,   8, 
							DN0B,   8, 
							DN0C,   8, 
							DN0D,   8, 
							DN0E,   8, 
							DN0F,   8
						}

						Method (GBIF, 3, NotSerialized)
						{
							If (_OSI ("Darwin"))
							{
								Acquire (BATM, 0xFFFF)
								If (Arg2)
								{
									HIID = (Arg0 | One)
									Local7 = B1B2 (SB00, SB01)
									Local7 >>= 0x0F
									Arg1 [Zero] = (Local7 ^ One)
									HIID = Arg0
									If (Local7)
									{
										Local1 = (B1B2 (FC00, FC01) * 0x0A)
									}
									Else
									{
										Local1 = B1B2 (FC00, FC01)
									}

									Arg1 [0x02] = Local1
									HIID = (Arg0 | 0x02)
									If (Local7)
									{
										Local0 = (B1B2 (DC00, DC01) * 0x0A)
									}
									Else
									{
										Local0 = B1B2 (DC00, DC01)
									}

									Arg1 [One] = Local0
									Divide (Local1, 0x14, Local2, Arg1 [0x05])
									If (Local7)
									{
										Arg1 [0x06] = 0xC8
									}
									ElseIf (B1B2 (DV00, DV01))
									{
										Divide (0x00030D40, B1B2 (DV00, DV01), Local2, Arg1 [0x06])
									}
									Else
									{
										Arg1 [0x06] = Zero
									}

									Arg1 [0x04] = B1B2 (DV00, DV01)
									Local0 = B1B2 (SN00, SN01)
									Name (SERN, Buffer (0x06)
									{
										"     "
									})
									Local2 = 0x04
									While (Local0)
									{
										Divide (Local0, 0x0A, Local1, Local0)
										SERN [Local2] = (Local1 + 0x30)
										Local2--
									}

									Arg1 [0x0A] = SERN /* \_SB_.PCI0.LPCB.EC__.GBIF.SERN */
									HIID = (Arg0 | 0x06)
									Arg1 [0x09] = DNXX ()
									HIID = (Arg0 | 0x04)
									Name (BTYP, Buffer (0x05)
									{
										 0x00, 0x00, 0x00, 0x00, 0x00                     // .....
									})
									BTYP = B1B4 (CH00, CH01, CH02, CH03)
									Arg1 [0x0B] = BTYP /* \_SB_.PCI0.LPCB.EC__.GBIF.BTYP */
									HIID = (Arg0 | 0x05)
									Arg1 [0x0C] = MNXX ()
								}
								Else
								{
									Arg1 [One] = 0xFFFFFFFF
									Arg1 [0x05] = Zero
									Arg1 [0x06] = Zero
									Arg1 [0x02] = 0xFFFFFFFF
								}

								Release (BATM)
								Return (Arg1)
							}
							Else
							{
								Return (\_SB.PCI0.LPCB.EC.XBIF (Arg0, Arg1, Arg2))
							}
						}

						Method (GBIX, 3, Serialized)
						{
							If (_OSI ("Darwin"))
							{
								Acquire (BATM, 0xFFFF)
								If (Arg2)
								{
									HIID = (Arg0 | One)
									Local7 = B1B2 (CC00, CC01)
									Arg1 [0x08] = Local7
									Local7 = B1B2 (SB00, SB01)
									Local7 >>= 0x0F
									Arg1 [One] = (Local7 ^ One)
									HIID = Arg0
									If (Local7)
									{
										Local1 = (B1B2 (FC00, FC01) * 0x0A)
									}
									Else
									{
										Local1 = B1B2 (FC00, FC01)
									}

									Arg1 [0x03] = Local1
									HIID = (Arg0 | 0x02)
									If (Local7)
									{
										Local0 = (B1B2 (DC00, DC01) * 0x0A)
									}
									Else
									{
										Local0 = B1B2 (DC00, DC01)
									}

									Arg1 [0x02] = Local0
									Divide (Local1, 0x14, Local2, Arg1 [0x06])
									If (Local7)
									{
										Arg1 [0x07] = 0xC8
									}
									ElseIf (B1B2 (DV00, DV01))
									{
										Divide (0x00030D40, B1B2 (DV00, DV01), Local2, Arg1 [0x07])
									}
									Else
									{
										Arg1 [0x07] = Zero
									}

									Arg1 [0x05] = B1B2 (DV00, DV01)
									Local0 = B1B2 (SN00, SN01)
									Name (SERN, Buffer (0x06)
									{
										"     "
									})
									Local2 = 0x04
									While (Local0)
									{
										Divide (Local0, 0x0A, Local1, Local0)
										SERN [Local2] = (Local1 + 0x30)
										Local2--
									}

									Arg1 [0x11] = SERN /* \_SB_.PCI0.LPCB.EC__.GBIX.SERN */
									HIID = (Arg0 | 0x06)
									Arg1 [0x10] = DNXX ()
									HIID = (Arg0 | 0x04)
									Name (BTYP, Buffer (0x05)
									{
										 0x00, 0x00, 0x00, 0x00, 0x00                     // .....
									})
									BTYP = B1B4 (CH00, CH01, CH02, CH03)
									Arg1 [0x12] = BTYP /* \_SB_.PCI0.LPCB.EC__.GBIX.BTYP */
									HIID = (Arg0 | 0x05)
									Arg1 [0x13] = MNXX ()
								}
								Else
								{
									Arg1 [0x02] = 0xFFFFFFFF
									Arg1 [0x06] = Zero
									Arg1 [0x07] = Zero
									Arg1 [0x03] = 0xFFFFFFFF
								}

								Release (BATM)
								Return (Arg1)
							}
							Else
							{
								Return (\_SB.PCI0.LPCB.EC.XBIX (Arg0, Arg1, Arg2))
							}
						}

						Method (GBST, 4, Serialized)
						{
							If (_OSI ("Darwin"))
							{
								Acquire (BATM, 0xFFFF)
								If ((Arg1 & 0x20))
								{
									Local0 = 0x02
								}
								ElseIf ((Arg1 & 0x40))
								{
									Local0 = One
								}
								Else
								{
									Local0 = Zero
								}

								If ((Arg1 & 0x07)){}
								Else
								{
									Local0 |= 0x04
								}

								If (((Arg1 & 0x07) == 0x07))
								{
									Local1 = 0xFFFFFFFF
									Local2 = 0xFFFFFFFF
									Local3 = 0xFFFFFFFF
								}
								Else
								{
									HIID = Arg0
									Local3 = B1B2 (BV00, BV01)
									If (Arg2)
									{
										Local2 = (B1B2 (RC00, RC01) * 0x0A)
									}
									Else
									{
										Local2 = B1B2 (RC00, RC01)
									}

									Local1 = B1B2 (AC00, AC01)
									If ((Local1 >= 0x8000))
									{
										If ((Local0 & One))
										{
											Local1 = (0x00010000 - Local1)
										}
										Else
										{
											Local1 = Zero
										}
									}
									ElseIf (!(Local0 & 0x02))
									{
										Local1 = Zero
									}

									If (Arg2)
									{
										Local1 *= Local3
										Divide (Local1, 0x03E8, Local7, Local1)
									}
								}

								Local5 = (One << (Arg0 >> 0x04))
								BSWA |= BSWR /* External reference */
								If (((BSWA & Local5) == Zero))
								{
									Arg3 [Zero] = Local0
									Arg3 [One] = Local1
									Arg3 [0x02] = Local2
									Arg3 [0x03] = Local3
									If ((Arg0 == Zero))
									{
										B0I0 = Local0
										B0I1 = Local1
										B0I2 = Local2
										B0I3 = Local3
									}
									Else
									{
										B1I0 = Local0
										B1I1 = Local1
										B1I2 = Local2
										B1I3 = Local3
									}
								}
								Else
								{
									If (^AC._PSR ())
									{
										If ((Arg0 == Zero))
										{
											Arg3 [Zero] = B0I0 /* External reference */
											Arg3 [One] = B0I1 /* External reference */
											Arg3 [0x02] = B0I2 /* External reference */
											Arg3 [0x03] = B0I3 /* External reference */
										}
										Else
										{
											Arg3 [Zero] = B1I0 /* External reference */
											Arg3 [One] = B1I1 /* External reference */
											Arg3 [0x02] = B1I2 /* External reference */
											Arg3 [0x03] = B1I3 /* External reference */
										}
									}
									Else
									{
										Arg3 [Zero] = Local0
										Arg3 [One] = Local1
										Arg3 [0x02] = Local2
										Arg3 [0x03] = Local3
									}

									If ((((Local0 & 0x04) == Zero) && ((Local2 > Zero) && 
										(Local3 > Zero))))
									{
										BSWA &= ~Local5
										Arg3 [Zero] = Local0
										Arg3 [One] = Local1
										Arg3 [0x02] = Local2
										Arg3 [0x03] = Local3
									}
								}

								Release (BATM)
								Return (Arg3)
							}
							Else
							{
								Return (\_SB.PCI0.LPCB.EC.XBST (Arg0, Arg1, Arg2, Arg3))
							}
						}

						Method (AJTP, 3, NotSerialized)
						{
							If (_OSI ("Darwin"))
							{
								Local0 = Arg1
								Acquire (BATM, 0xFFFF)
								HIID = Arg0
								Local1 = B1B2 (RC00, RC01)
								Release (BATM)
								If ((Arg0 == Zero))
								{
									Local2 = HB0S /* External reference */
								}
								Else
								{
									Local2 = HB1S /* External reference */
								}

								If ((Local2 & 0x20))
								{
									If ((Arg2 > Zero))
									{
										Local0 += One
									}

									If ((Local0 <= Local1))
									{
										Local0 = (Local1 + One)
									}
								}
								ElseIf ((Local2 & 0x40))
								{
									If ((Local0 >= Local1))
									{
										Local0 = (Local1 - One)
									}
								}

								Return (Local0)
							}
							Else
							{
								Return (\_SB.PCI0.LPCB.EC.XJTP (Arg0, Arg1, Arg2))
							}
						}

						Method (NBAT, 0, Serialized)
						{
							If (CondRefOf (BAT0))
							{
								Notify (BAT0, 0x80) // Status Change
							}
						}
						
						
						
						
						
                    }

                    Device (PMCR)
                    {
                        Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFE000000,         // Address Base
                                0x00010000,         // Address Length
                                )
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (SBUS)
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
				Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
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

                Device (TERM)
                {
                    Name (_ADR, 0x00120000)  // _ADR: Address
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

                Device (UART)
                {
                    Name (_ADR, 0x00160003)  // _ADR: Address
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

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
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

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }

        Method (XOSI, 1, NotSerialized)
        {
            Local0 = Package (0x16)
                {
                    "Windows 2015"
                }
            If (_OSI ("Darwin"))
            {
                Return ((Ones != Match (Local0, MEQ, Arg0, MTR, Zero, Zero)))
            }
            Else
            {
                Return (_OSI (Arg0))
            }
        }
    }
	
	Device(RMD1)
    {
        Name(_HID, "RMD10000") // _HID: Hardware ID
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

        Method(_INI)
        {
            If (_OSI ("Darwin"))
            {
               // disable discrete graphics (Nvidia/Radeon) if it is present
               If (CondRefOf(\_SB.PCI0.RP09.PEGP._OFF)) { \_SB.PCI0.RP09.PEGP._OFF() }
            }
            Else
            {
            }
        }
    }
}

