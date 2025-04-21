DefinitionBlock ("", "SSDT", 2, "HACK", "TB4H", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.TDM0, DeviceObj)
    External (_SB_.PCI0.TDM1, DeviceObj)
    External (_SB_.PCI0.TRP0, DeviceObj)
    External (_SB_.PCI0.TRP1, DeviceObj)
    External (_SB_.PCI0.TRP2, DeviceObj)
    External (_SB_.PCI0.TRP3, DeviceObj)
    External (_SB_.PCI1, DeviceObj)
    External (_SB_.PCI1.TRP0, DeviceObj)
    External (_SB_.PCI1.TRP1, DeviceObj)
    External (_SB_.PCI1.TRP2, DeviceObj)
    External (_SB_.PCI1.TRP3, DeviceObj)

    Scope (\)
    {
        Scope (_SB)
        {
            // Check your Bios original ACPI and adjust SSDT according to your motherboard structure.
            //Scope (PCI0,PC00 ecc.ecc)
            Scope (PCI0)
            {
                Scope (TDM0)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
                        {
                            If ((Arg2 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package (0x03)
                            {
                                "power-save", 
                                One, 
                                Buffer (One)
                                {
                                     0x00                                             // .
                                }
                            })
                        }

                        Return (Zero)
                    }
                }

                Scope (TDM1)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
                        {
                            If ((Arg2 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package (0x03)
                            {
                                "power-save", 
                                One, 
                                Buffer (One)
                                {
                                     0x00                                             // .
                                }
                            })
                        }

                        Return (Zero)
                    }
                }

                Scope (TRP0)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP1)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP2)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP3)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }
            }

            Scope (PCI1)
            {
                Scope (TRP0)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP1)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP2)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }

                Scope (TRP3)
                {
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If (_OSI ("Darwin"))
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

                        Return (Zero)
                    }
                }
            }
        }
    }
}

