//Add QXX method pour entre autres les touches fonctions
//Voir a quoi correspondent les autres fonctions Q avec le DSDT

DefinitionBlock ("", "SSDT", 2, "Paul", "KBD", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.HKEY.MLCS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.HKEY.MMTS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ16, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ1F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ60, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ61, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ62, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ64, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ66, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ6A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)

    Scope (\_SB.PCI0.LPCB.EC)
    {
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
    }

    Scope (_SB.PCI0.LPCB.KBD)
    {
        Name (RMCF, Package (0x02)
        {
            "Keyboard", 
            Package (0x02)
            {
                "Custom PS2 Map", 
                Package (0x04)
                {
                    Package (0x00){}, 
                    "e037=64", 
                    "46=80", 
                    "e045=80"
                }
            }
        })
    }
}

