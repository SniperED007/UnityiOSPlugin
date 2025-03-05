using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;

namespace LighthouseGames.Editor
{
  public class InfoPlistUpdater
  {
    [UnityEditor.Callbacks.PostProcessBuild]
    public static void OnPostprocessBuild(UnityEditor.BuildTarget buildTarget, string pathToBuiltProject)
    {
      if (buildTarget != UnityEditor.BuildTarget.iOS)
        return;

      string plistPath = System.IO.Path.Combine(pathToBuiltProject, "Info.plist");
      var plist = new UnityEditor.iOS.Xcode.PlistDocument();
      plist.ReadFromFile(plistPath);

      // Set UIViewControllerBasedStatusBarAppearance to NO
      plist.root.SetBoolean("UIViewControllerBasedStatusBarAppearance", false);

      // Write changes back to the plist file
      plist.WriteToFile(plistPath);
    }
  }
}
