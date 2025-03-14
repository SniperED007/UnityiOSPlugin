# Unity iOS Plugin

This Unity package provides easy access to native iOS features directly within your Unity project. Developed and maintained by **Lighthouse Games Studio**, it simplifies the integration of native iOS capabilities like controlling the iOS Status Bar and providing haptic feedback.

---

## 🚀 Features

- **Status Bar**  
  *Unity doesn't support changing the Status Bar settings during runtime, so this feature addresses that.*  
  - **Show/Hide iOS Status Bar**  
  - **Change iOS Status Bar Style:**  
    - Automatic  
    - Light  
    - Dark  

- **Haptics**
  *Easily add native haptic feedback to enhance user interaction.*
  - **Check Haptic Support**
  - **Play Haptic Feedback:**
    - Light Impact
    - Medium Impact
    - Heavy Impact
    - Success
    - Warning
    - Error

*(Additional features coming soon!)*

---

## 📥 Installation

Install directly from GitHub using Unity Package Manager:

1. Open Unity Editor.
2. Navigate to **Window → Package Manager**.
3. Click the **+** button → **Add package from git URL**.
4. Paste the following URL:

```bash
https://github.com/SniperED007/UnityiOSPlugin.git
```

Unity will automatically download and include the plugin in your project.

---

## 📖 How to Use

### Showing or Hiding the Status Bar

```csharp
using LighthouseGames;

public class Example : MonoBehaviour
{
    void Start()
    {
        iOS.ShowStatusBar = false; // Hide Status Bar
    }
}
```

### Setting the Status Bar Style

```csharp
using LighthouseGames;

public class Example : MonoBehaviour
{
    void Start()
    {
        iOS.SetStatusBarStyle(StatusBarStyle.Dark); // Set Status Bar to Dark style
    }
}
```

### Using Haptic Feedback

```csharp
using LighthouseGames;

public class Example : MonoBehaviour
{
    void Start()
    {
        iOS.PlayHaptic(HapticType.Success); // Play Success haptic feedback
    }
}
```

---

## 🗂 Folder Structure

```
UnityiOSPlugin/
├── Runtime/            # C# scripts for Unity runtime
├── Plugins/iOS/        # Native iOS code
├── Editor/             # Post-Build script to set up required Xcode configurations
├── package.json        # Unity Package Manifest
├── README.md           # This file
```

---

## ⚙️ Requirements

- Unity 2021.3 or higher
- iOS Build Target

---

