# LostOnTheLine Chocolatey Packages

A custom Chocolatey source for GitHub apps not available in the official Chocolatey community repository. 

## Currently includes:

- **Scrutiny Collector**: Collects SMART metrics for hard drives & sends them to your Scrutiny WebUI.
    - From the Project [Scrutiny](https://github.com/AnalogJ/scrutiny) by [AnalogJ](https://github.com/AnalogJ)
    - Scrutiny defaults to the installation directory `C:\opt\scrutiny` but can be changed with the `--params "/InstallDir"` flag
    ```powershell
    choco install scrutiny --params "/InstallDir:C:\tools\scrutiny"
    ```
	- See [The Documentation Page](https://github.com/AnalogJ/scrutiny/blob/master/docs/TROUBLESHOOTING_DEVICE_COLLECTOR.md#hub--spoke-model-with-multiple-hosts) for usage instructions.
    - Should auto-detect ARM or AMD64 CPU for install package
	- <sub><sup>Scrutiny Collector is licensed under the Apache License, Version 2.0.</sup></sub>
	- <sub><sup>Copyright © AnalogJ & contributors.</sup></sub>
- **ExplorerPatcher**: Enhances Windows with Windows 10-like taskbar & Start menu.
    - From the project [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher) by [valinet](https://github.com/valinet)
    - Should auto-detect ARM or AMD64 CPU for install package
	- <sub><sup>ExplorerPatcher is licensed under the GNU General Public License, Version 2.0.</sup></sub>
	- <sub><sup>Copyright © valinet and contributors.</sup></sub>

## Installation

1. **Add the Repository**:
    ```powershell
   choco source add -n=ChocoGitHub -s="https://github.com/LostOnTheLine/choco-github-packages/releases/download/v1.0" --priority=232
    ```
    - This installs the `Source` as `ChocoGitHub` with a low priority. This means that any sources like the default Chocolatey source will be checked & packages will only be installed from this Source if they do not exist in the offical sources. The priority is set arbitrarily to 232 so anything with a lower number will take priority.
	    - If you want to install from this source specifically you can use the flag `--source LocalRepo` for example: `choco install explorerpatcher --source LocalRepo` to install specifically from this one.
2. **Install regularly**
    ```powershell
	choco install scrutiny
	```
#### choco-github-packages

Please note that this is my 1st time working with Chocolatey Packages so there are likely to be issues. Please report issues or submit a pull request to fix them