# mimikatz

**`mimikatz`** is a tool `gentilkiwi` made to learn `C` and make somes experiments with Windows security and forked by me to wrap it in dll library in `guardicore` fork way.

It's now well known to extract plaintexts passwords, hash, PIN code and kerberos tickets from memory. **`mimikatz`** can also perform pass-the-hash, pass-the-ticket or build _Golden tickets_.

`Crypto`, `Terminal Server`, `Events`, ... lots of informations in the GitHub Wiki https://github.com/gentilkiwi/mimikatz/wiki or on http://blog.gentilkiwi.com (in French, _yes_).

If you don't want to build it, original binaries are availables on https://github.com/gentilkiwi/mimikatz/releases, wrapped binaries are available on https://github.com/Mathtin/mimikatz/releases



## Build
`mimikatz` is in the form of a Visual Studio Solution and a WinDDK driver (optional for main operations), so prerequisites are:
* for `mimikatz` and `mimilib` : Visual Studio 2010, 2012 or 2013 for Desktop (**2013 Express for Desktop is free and supports x86 & x64** - http://www.microsoft.com/download/details.aspx?id=44914)
* _for `mimikatz driver`, `mimilove` (and `ddk2003` platform) : Windows Driver Kit **7.1** (WinDDK) - http://www.microsoft.com/download/details.aspx?id=11800_

`mimikatz` uses `SVN` for source control, but is now available with `GIT` too!
You can use any tools you want to sync, even incorporated `GIT` in Visual Studio 2013 =)

### Synchronize!
* GIT URL is  : https://github.com/gentilkiwi/mimikatz.git
* SVN URL is  : https://github.com/gentilkiwi/mimikatz/trunk
* ZIP file is : https://github.com/gentilkiwi/mimikatz/archive/master.zip

### Build the solution
* After opening the solution, `Build` / `Build Solution` (you can change architecture)
* `mimikatz` is now built and ready to be used! (`Win32` / `x64`)
  * you can have error `MSB3073` about `_build_.cmd` and `mimidrv`, it's because the driver cannot be build without Windows Driver Kit **7.1** (WinDDK), but `mimikatz` and `mimilib` are OK.

### ddk2003
With this optional MSBuild platform, you can use the WinDDK build tools, and the default `msvcrt` runtime (smaller binaries, no dependencies)

For this optional platform, Windows Driver Kit **7.1** (WinDDK) - http://www.microsoft.com/download/details.aspx?id=11800 and Visual Studio **2010** are mandatory, even if you plan to use Visual Studio 2012 or 2013 after.

Follow instructions:
* http://blog.gentilkiwi.com/programmation/executables-runtime-defaut-systeme
* _http://blog.gentilkiwi.com/cryptographie/api-systemfunction-windows#winheader_

## Licence
CC BY 4.0 licence - https://creativecommons.org/licenses/by/4.0/

`mimikatz` needs coffee to be developed:
* ETH: 0x3a56af999b5e68f9e6e0a7dce1833efefad5b470
* BTC: 1C6bubazp9xq3BfYiHvsqP1sEhFYykUDo5
* PayPal: https://www.paypal.me/delpy/

## Author
* Benjamin DELPY `gentilkiwi`, you can contact me on Twitter ( @gentilkiwi ) or by mail ( benjamin [at] gentilkiwi.com )
* DCSync function in `lsadump` module was co-writed with Vincent LE TOUX, you can contact him by mail ( vincent.letoux [at] gmail.com ) or visit his website ( http://www.mysmartlogon.com )
* Wrap changes was taken from `guardicore` repo as for 2584e1666da75584ac9e9e7aaf2b586b3eea16bc merge by Daniel Goldberg ( https://github.com/danielguardicore )

This is a **personal** development, please respect its philosophy and don't use it for bad things!