using UnityEngine;
using System.Runtime.InteropServices;

public enum StatusBarStyle
{
  Automatic = 0,
  Light = 1,
  Dark = 2
}

public static class iOS
{
#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")] private static extern void _SetStatusBarVisible(bool visible);
    [DllImport("__Internal")] private static extern void _SetStatusBarStyle(int style);
#endif

  public static bool ShowStatusBar
  {
    set
    {
#if UNITY_IOS && !UNITY_EDITOR
        _SetStatusBarVisible(value);
#endif
    }
  }

  public static void SetStatusBarStyle(StatusBarStyle style)
  {
#if UNITY_IOS && !UNITY_EDITOR
      _SetStatusBarStyle((int)style);
#endif
  }
}
