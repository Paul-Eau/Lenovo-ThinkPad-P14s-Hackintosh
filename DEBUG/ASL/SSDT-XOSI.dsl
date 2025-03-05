DefinitionBlock ("", "SSDT", 2, "P14s", "XOSI", 0x00000000)
{	
	Scope (\)
	{
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
}