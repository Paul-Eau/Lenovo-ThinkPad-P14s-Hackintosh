/*
 *Disable DGPU with .OFF method and PS3 just to be sure
 */

DefinitionBlock ("", "SSDT", 2, "Paul", "NOPGU", 0x00000000)
{
    External (_SB_.PCI0.RP09.PEGP._DSM, MethodObj)    // 4 Arguments
    External (_SB_.PCI0.RP09.PEGP._OFF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP09.PEGP._PS3, MethodObj)    // 0 Arguments

    Device (NHG1)
    {
        Name (_HID, "NHG10000")  // _HID: Hardware ID
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

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                If ((CondRefOf (\_SB.PCI0.RP09.PEGP._DSM) && CondRefOf (\_SB.PCI0.RP09.PEGP._PS3)))
                {
                    \_SB.PCI0.RP09.PEGP._DSM (ToUUID ("a486d8f8-0bda-471b-a72b-6042a6b5bee0") /* Unknown UUID */, 0x0100, 0x1A, Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x03                           // ....
                        })
                    \_SB.PCI0.RP09.PEGP._PS3 ()
                }

                If (CondRefOf (\_SB.PCI0.RP09.PEGP._OFF))
                {
                    \_SB.PCI0.RP09.PEGP._OFF ()
                }
            }
            Else
            {
            }
        }
    }
}

