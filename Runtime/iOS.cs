using UnityEngine;
using System.Runtime.InteropServices;

public enum StatusBarStyle
{
  Automatic = 0,
  Light = 1,
  Dark = 2
}

public enum HapticType
{
  LightImpact = 0,
  MediumImpact = 1,
  HeavyImpact = 2,
  Success = 3,
  Warning = 4,
  Error = 5
}

namespace LighthouseGames
{
  public static class iOS
  {
#if UNITY_IOS && !UNITY_EDITOR
    [DllImport("__Internal")] private static extern void _SetStatusBarVisible(bool visible);
    [DllImport("__Internal")] private static extern void _SetStatusBarStyle(int style);

    [DllImport("__Internal")] private static extern bool _IsHapticsSupported();
    [DllImport("__Internal")] private static extern void _PlayHaptic(int hapticType);
#endif

    /// <summary>
    /// Show or hide the status bar.
    /// </summary>
    public static bool ShowStatusBar
    {
      set
      {
#if UNITY_IOS && !UNITY_EDITOR
        _SetStatusBarVisible(value);
#endif
      }
    }

    /// <summary>
    /// Set the status bar style.
    /// </summary>
    /// <param name="style"></param>
    public static void SetStatusBarStyle(StatusBarStyle style)
    {
#if UNITY_IOS && !UNITY_EDITOR
      _SetStatusBarStyle((int)style);
#endif
    }

    /// <summary>
    /// Check if haptics are supported at runtime.
    /// </summary>
    public static bool IsHapticsSupported()
    {
#if UNITY_IOS && !UNITY_EDITOR
      return _IsHapticsSupported();
#else
      return false;
#endif
    }

    /// <summary>
    /// Play haptic feedback of the specified type.
    /// </summary>
    public static void PlayHaptic(HapticType type)
    {
#if UNITY_IOS && !UNITY_EDITOR
      if (IsHapticsSupported())
      {
          _PlayHaptic((int)type);
      }
#endif
    }
  }
}
