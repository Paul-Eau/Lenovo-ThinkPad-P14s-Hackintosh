/*
 *Set GPHD to one
 */
DefinitionBlock ("", "SSDT", 2, "DRTNIA", "GPI0", 0x00000000)
{
    External (GPHD, FieldUnitObj)

    If (_OSI ("Darwin"))
    {
        \GPHD = One
    }
}

