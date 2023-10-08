DefinitionBlock ("", "SSDT", 2, "Hack", "TB36240", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)

    Scope (\)
    {
        Scope (_SB)
        {
            Scope (PCI0)
            {
                If (_OSI ("Darwin"))
                {
                    Scope (RP01)
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
                        }

                        Device (DSB0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

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

                                    Return (Package (0x13)
                                    {
                                        "ThunderboltDROM", 
                                        Buffer (0x65)
                                        {
                                            /* 0000 */  0x63, 0x00, 0x06, 0xBB, 0xAD, 0xA2, 0x93, 0x78,  // c......x
                                            /* 0008 */  0x2D, 0xF4, 0x15, 0x15, 0x66, 0x01, 0x58, 0x00,  // -...f.X.
                                            /* 0010 */  0x01, 0x00, 0x10, 0x00, 0x01, 0x00, 0x08, 0x81,  // ........
                                            /* 0018 */  0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                            /* 0020 */  0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x08, 0x83,  // ........
                                            /* 0028 */  0x80, 0x04, 0x80, 0x01, 0x00, 0x00, 0x08, 0x84,  // ........
                                            /* 0030 */  0x90, 0x03, 0x80, 0x01, 0x00, 0x00, 0x05, 0x85,  // ........
                                            /* 0038 */  0x09, 0x01, 0x00, 0x05, 0x86, 0x09, 0x01, 0x00,  // ........
                                            /* 0040 */  0x02, 0x87, 0x03, 0x88, 0x20, 0x03, 0x89, 0x80,  // .... ...
                                            /* 0048 */  0x02, 0xCA, 0x02, 0xCB, 0x12, 0x01, 0x4C, 0x65,  // ......Le
                                            /* 0050 */  0x6E, 0x6F, 0x76, 0x6F, 0x20, 0x54, 0x68, 0x69,  // novo Thi
                                            /* 0058 */  0x6E, 0x6B, 0x70, 0x61, 0x64, 0x00, 0x07, 0x02,  // nkpad...
                                            /* 0060 */  0x58, 0x32, 0x38, 0x30, 0x00                     // X280.
                                        }, 

                                        "ThunderboltConfig", 
                                        Buffer (0x20)
                                        {
                                            /* 0000 */  0x00, 0x02, 0x1C, 0x00, 0x02, 0x00, 0x05, 0x03,  // ........
                                            /* 0008 */  0x01, 0x00, 0x04, 0x00, 0x05, 0x03, 0x02, 0x00,  // ........
                                            /* 0010 */  0x03, 0x00, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00,  // ........
                                            /* 0018 */  0x03, 0x03, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00   // ........
                                        }, 

                                        "pathcr", 
                                        Buffer (0x50)
                                        {
                                            /* 0000 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0008 */  0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,  // ........
                                            /* 0010 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0018 */  0x00, 0x00, 0x07, 0x00, 0x10, 0x00, 0x10, 0x00,  // ........
                                            /* 0020 */  0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0E, 0x00,  // ........
                                            /* 0028 */  0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0030 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0038 */  0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00,  // ........
                                            /* 0040 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0048 */  0x00, 0x00, 0x07, 0x00, 0x02, 0x00, 0x01, 0x00   // ........
                                        }, 

                                        "linkDetails", 
                                        Buffer (0x08)
                                        {
                                             0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00   // ........
                                        }, 

                                        "TBTFlags", 
                                        Buffer (0x04)
                                        {
                                             0x03, 0x00, 0x00, 0x00                           // ....
                                        }, 

                                        "sscOffset", 
                                        Buffer (0x02)
                                        {
                                             0x00, 0x07                                       // ..
                                        }, 

                                        "TBTDPLowToHigh", 
                                        Buffer (0x04)
                                        {
                                             0x01, 0x00, 0x00, 0x00                           // ....
                                        }, 

                                        "ThunderboltUUID", 
                                        ToUUID ("95e6bcfa-5a4a-5f81-b3d2-f0e4bd35cf1e") /* Unknown UUID */, 
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
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
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
        }
    }
}

