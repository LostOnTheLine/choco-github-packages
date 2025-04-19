# LostOnTheLine Chocolatey Packages

A custom Chocolatey source for GitHub apps not available in the official Chocolatey community repository.

## Currently Includes

- **Scrutiny Collector**: Collects SMART metrics for hard drives & sends them to your Scrutiny WebUI.
  - Project: [Scrutiny](https://github.com/AnalogJ/scrutiny) by [AnalogJ](https://github.com/AnalogJ)
  - Default install directory: `C:\opt\scrutiny`
  - Custom directory: `--params "/InstallDir:C:\tools\scrutiny"`
  - Auto-detects ARM64 or AMD64 CPU
  - License: Apache 2.0 (see `packages/scrutiny/LICENSE.txt`)
  - Copyright: © AnalogJ & contributors
  - Usage: See [Scrutiny Documentation](https://github.com/AnalogJ/scrutiny/blob/master/docs/TROUBLESHOOTING_DEVICE_COLLECTOR.md#hub--spoke-model-with-multiple-hosts)

- **ExplorerPatcher**: Enhances Windows with Windows 10-like taskbar & Start menu.
  - Project: [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher) by [valinet](https://github.com/valinet)
  - Default install directory: `C:\Program Files\ExplorerPatcher`
  - Custom directory: `--params "/InstallDir:C:\tools\explorerpatcher"`
  - Auto-detects ARM64 or AMD64 CPU
  - License: GPL-2.0 (see `packages/explorerpatcher/LICENSE.txt`)
  - Copyright: © valinet & contributors

## Installation

1. **Add the Repository**:
    ```powershell
    choco source add -n=ChocoGitHub -s="https://github.com/LostOnTheLine/choco-github-packages/releases/download/v1.0" --priority=232
    ```
    - This installs the `Source` as `ChocoGitHub` with a low priority. This means that any sources like the default Chocolatey source will be checked & packages will only be installed from this Source if they do not exist in the offical sources. The priority is set arbitrarily to 232 so anything with a lower number will take priority.
	    - If you want to install from this source specifically you can use the flag `--source ChocoGitHub` for example: `choco install explorerpatcher --source ChocoGitHub` to install specifically from this one.
2. **Install regularly**
    ```powershell
	choco install scrutiny
	```
    **Install from ChocoGitHub only**
    ```powershell
	choco install scrutiny --source ChocoGitHub
	```

<sub><sub>Please note that this is my 1st time working with Chocolatey Packages so there are likely to be issues. Please report issues or submit a pull request to fix them</sub></sub>