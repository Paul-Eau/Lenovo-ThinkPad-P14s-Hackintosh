/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLWMEm6T.aml, Fri Jul  8 21:36:05 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000066 (102)
 *     Revision         0x02
 *     Checksum         0x64
 *     OEM ID           "Paul"
 *     OEM Table ID     "YVPC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Paul", "YVPC", 0x00000000)
{
    External (_SB_.PCI0.LPCB._EC_, DeviceObj)

    Scope (_SB.PCI0.LPCB._EC)
    {
        Device (YVPC)
        {
            Name (_HID, "VPC0000")  // _HID: Hardware ID
        }
    }
}

