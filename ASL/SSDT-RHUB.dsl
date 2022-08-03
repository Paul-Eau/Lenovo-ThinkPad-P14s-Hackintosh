/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLw7CZcI.aml, Fri Jul  8 21:35:23 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000145 (325)
 *     Revision         0x02
 *     Checksum         0x17
 *     OEM ID           "DRTNIA"
 *     OEM Table ID     "RhubOff"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "RhubOff", 0x00001000)
{
    External (_SB_.PCI0.XHC1.RHUB, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)
    External (_SB_.PCI0.XHCI.RHUB, DeviceObj)

    If (CondRefOf (\_SB.PCI0.XHC.RHUB))
    {
        Scope (_SB.PCI0.XHC.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHCI.RHUB))
    {
        Scope (_SB.PCI0.XHCI.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }

    If (CondRefOf (\_SB.PCI0.XHC1.RHUB))
    {
        Scope (_SB.PCI0.XHC1.RHUB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
    }
}

