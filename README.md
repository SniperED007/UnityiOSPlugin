# Unity iOS Plugin

This Unity package provides easy access to native iOS features directly within your Unity project. Developed and maintained by **Lighthouse Games Studio**, it simplifies the integration of native iOS capabilities like controlling the iOS Status Bar.

---

## 🚀 Features

- **Show/Hide iOS Status Bar**
- **Change iOS Status Bar Style:**
  - Automatic
  - Light
  - Dark

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

---

## 🗂 Folder Structure

```
UnityiOSPlugin/
├── Runtime/            # C# scripts for Unity runtime
├── Plugins/iOS/        # Native iOS code
├── package.json        # Unity Package Manifest
├── README.md           # This file
```

---

## ⚙️ Requirements

- Unity 2021.3 or higher
- iOS Build Target

---




