/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLQaRQkS.aml, Tue Jul  5 18:03:51 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000060 (96)
 *     Revision         0x02
 *     Checksum         0x98
 *     OEM ID           "tyler"
 *     OEM Table ID     "_PWRB"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "tyler", "_PWRB", 0x00001000)
{
    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Return (Zero)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                               
                Return (0x0F)
                
            }
        }
    }
}

