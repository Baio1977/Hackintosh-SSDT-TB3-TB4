DefinitionBlock ("", "SSDT", 2, "Hack", "TB36540", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)

    Scope (\)
    {
        Scope (_SB)
        {
            Scope (PCI0)
            {
                If (_OSI ("Darwin"))
                {
                    Scope (RP09)
                    {
                        Scope (PXSX)
                        {
                            Name (_STA, Zero)  // _STA: Status
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }

                        Device (UPSB)
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
                                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                {
                                    Local0 = Package (0x02)
                                        {
                                            "PCI-Thunderbolt", 
                                            One
                                        }
                                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                    Return (Local0)
                                }

                                Return (Zero)
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
                                    If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
                                    {
                                        Local0 = Package (0x02)
                                            {
                                                "PCIHotplugCapable", 
                                                Zero
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
                                    }

                                    Return (Zero)
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
                                        Local0 = Package (0x13)
                                            {
                                                "ThunderboltDROM", 
                                                Buffer (0x75)
                                                {
                                                    /* 0000 */  0x13, 0x00, 0xDD, 0x10, 0x88, 0xF1, 0xBC, 0x2A,  // .......*
                                                    /* 0008 */  0x8C, 0x96, 0x65, 0x21, 0x48, 0x01, 0x68, 0x00,  // ..e!H.h.
                                                    /* 0010 */  0x31, 0x00, 0x42, 0x60, 0x01, 0x28, 0x08, 0x81,  // 1.B`.(..
                                                    /* 0018 */  0x80, 0x02, 0x80, 0x00, 0x00, 0x00, 0x08, 0x82,  // ........
                                                    /* 0020 */  0x90, 0x01, 0x80, 0x00, 0x00, 0x00, 0x08, 0x83,  // ........
                                                    /* 0028 */  0x80, 0x04, 0x80, 0x01, 0x00, 0x00, 0x08, 0x84,  // ........
                                                    /* 0030 */  0x90, 0x03, 0x80, 0x01, 0x00, 0x00, 0x02, 0x85,  // ........
                                                    /* 0038 */  0x0B, 0x86, 0x20, 0x01, 0x00, 0x64, 0x00, 0x00,  // .. ..d..
                                                    /* 0040 */  0x00, 0x00, 0x00, 0x03, 0x87, 0x80, 0x05, 0x88,  // ........
                                                    /* 0048 */  0x50, 0x00, 0x00, 0x05, 0x89, 0x50, 0x00, 0x00,  // P....P..
                                                    /* 0050 */  0x05, 0x8A, 0x50, 0x00, 0x00, 0x05, 0x8B, 0x50,  // ..P....P
                                                    /* 0058 */  0x00, 0x00, 0x0D, 0x01, 0x41, 0x70, 0x70, 0x6C,  // ....Appl
                                                    /* 0060 */  0x65, 0x20, 0x49, 0x6E, 0x63, 0x2E, 0x00, 0x0E,  // e Inc...
                                                    /* 0068 */  0x02, 0x4D, 0x61, 0x63, 0x42, 0x6F, 0x6F, 0x6B,  // .MacBook
                                                    /* 0070 */  0x20, 0x50, 0x72, 0x6F, 0x00                     //  Pro.
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
                                            }
                                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                                        Return (Local0)
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

                            Device (DSB4)
                            {
                                Name (_ADR, 0x00040000)  // _ADR: Address
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

        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }
    }
}

