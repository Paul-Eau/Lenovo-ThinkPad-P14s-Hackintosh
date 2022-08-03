    &/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLaWuVAI.aml, Sat Jul  9 02:32:16 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000D80 (3456)
 *     Revision         0x02
 *     Checksum         0xAC
 *     OEM ID           "Paul"
 *     OEM Table ID     "BAT0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Paul", "BAT0", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.AC__._PSR, MethodObj)    // 0 Arguments
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
    External (_SB_.PCI0.LPCB.EC__.XJTP, MethodObj)    // 3 Arguments
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

    Scope (\_SB.PCI0.LPCB.EC)
    {
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

        Method (RE1B, 1, NotSerialized)
        {
            OperationRegion (ECOR, EmbeddedControl, Arg0, One)
            Field (ECOR, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPCB.EC__.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 >>= 0x03
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

        Method (WE1B, 2, NotSerialized)
        {
            OperationRegion (ECOR, EmbeddedControl, Arg0, One)
            Field (ECOR, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
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
            Offset (0xAA), 
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
}

