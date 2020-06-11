# This Windows API call is used to set mouse precision immediately but temporarily (effect is lost upon reboot).
# Modifying the registry keeps the setting, but the change does not reflect until a reboot.

$typeDef = @"
using System;
using System.Runtime.InteropServices;

public static class WinApi {
    [Flags]
    enum SPIF
    {
        None = 0x00,
        /// <summary>Writes the new system-wide parameter setting to the user profile.</summary>
        SPIF_UPDATEINIFILE = 0x01,
        /// <summary>Broadcasts the WM_SETTINGCHANGE message after updating the user profile.</summary>
        SPIF_SENDCHANGE = 0x02,
        /// <summary>Same as SPIF_SENDCHANGE.</summary>
        SPIF_SENDWININICHANGE = 0x02
    }

    enum SPI : uint
    {
        SPI_GETMOUSE = 0x03,
        SPI_SETMOUSE = 0x04,
        SPI_GETMOUSESPEED = 0x70,
        SPI_SETMOUSESPEED = 0x71
    }

    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    static extern bool SystemParametersInfo(SPI uiAction, uint uiParam, int[] pvParam, SPIF fWinIni);

    [DllImport("user32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    static extern bool SystemParametersInfo(SPI uiAction, uint uiParam, int pvParam, SPIF fWinIni);

    public static void SetMousePrecision(bool enabled)
    {
        var param = new int[3];
        if (!SystemParametersInfo(SPI.SPI_GETMOUSE, 0, param, 0))
        {
            throw new Exception("SPI_GETMOUSE");
        }

        param[2] = enabled ? 1 : 0;
        if (!SystemParametersInfo(SPI.SPI_SETMOUSE, 0, param, SPIF.SPIF_SENDCHANGE))
        {
            throw new Exception("SPI_SETMOUSE");
        }
    }
}
"@

Add-Type -TypeDefinition $typeDef
[WinApi]::SetMousePrecision($false)