编译源码(支持Python)
-----
### Windows   
本机配置：   
win10 x64   
Visual Studio 2017

1. 必要工具
    * [Python](https://www.python.org/downloads/)（因为要装YouComplateMe插件）
    * [Visual Studio](https://visualstudio.microsoft.com/zh-hans/vs/)
    * [Git](https://git-scm.com/) (获取vim源码)
2. 必要的文件和目录（可以在任何目录）
	* 目录 `\current\build\vim`:   
		用来存放vim源码和运行时的文件;   
		也用于构建Vim;   
		可以将`current`替换为你喜欢的文件夹，但是如果路径包含**空格**要多加注意！！！   
	* 目录 `\myname\bin`:   
		用于保存构建vim时的文件，以及运行vim的vim可执行文件；   
		`myname`可以替换为你喜欢的任何文件夹      
	* 创建文件 `\myname\bin\vimconfig.cmd`,包含以下代码（不想要python接口）：   
		```
		:: Set environment for wanted options before building Vim.
		set GUI=yes
		```
		另外，如果想要python接口：
		```
		:: Set environment for wanted options before building Vim.
		set GUI=yes
		set DYNAMIC_PYTHON=yes
		set PYTHON=C:/Python27
		set PYTHON_VER=27
		```
		如果想装Python3，将`PYTHON`替换为`PYTHON`:
		```
		:: Set environment for wanted options before building Vim.
		set GUI=yes
		set DYNAMIC_PYTHON3=yes
		set PYTHON36=C:/Python36
		set PYTHON_VER=36
		```
		其他可选项：
		```
		set NETBEANS=no
		set FEATURES=HUGE
		set CPUNR=i686
		set WINVER=0x500
		set OLE=yes
		```
		> 有关构建的更多可用信息 [here](http://vimdoc.sourceforge.net/howto/win32-compile/Vim-Compile-Win32-HOWTO/compiling.html)
	* 创建文件 `\myname\bin\vimcopy.cmd`:
		```
		:: Copy any new Vim exe + runtime files to current install
		@set SRC=C:\current\build\vim
		@set DST=C:\myname\bin\vim\vim73
		xcopy %SRC%\runtime\ %DST% /D /E /H /I /Y %*
		xcopy %SRC%\src\xxd\xxd.exe %DST%\* /D /Y %*
		xcopy %SRC%\src\GvimExt\gvimext.dll %DST%\* /D /Y %*
		xcopy %SRC%\src\*.exe %DST%\* /D /Y %*
		```

3. 获取Vim源码
	* 打开`\current\build`路径   
	* 使用git下载Vim源码：   
		`git clone https://github.com/vim/vim.git`

4. 建立Vim
	* 在开始菜单中找到`VS 2017的开发人员命令提示符 `
	* 运行以下命令：
		```
		cd \current\build\vim\src
		msvc2015.bat
		\myname\bin\vimconfig.cmd
		nmake -f Make_mvc.mak
		```
		* `\current\build\vim\src\msvc2015.bat`配置环境变量以允许在命令提示符下构建
		* `\myname\bin\vimconfig.cmd`为构建Vim时所需的选项配置环境变量
		* `nmake.exe`编译和链接Vim
	* 如果需要可以运行下列命令，生成一个命令行的vim：
		```
		cd \current\build\vim\src
		nmake -f Make_mvc.mak gui=no
		```
	* 如果你想修改以前构建Vim的选项，首先必须“cleaned”：
		```
		cd \current\build\vim\src
		msvc2010.bat
		\myname\bin\vimconfig.cmd
		nmake -f Make_mvc.mak clean
		```
5. 配置Vim
	 \_vimrc_


6. 安装Vim
	* 运行`\myname\bin\vimcopy.cmd`
	* 将Vim添加到环境变量中
	* 右键添加“Edit with Vim”：
		```
		cd \myname\bin\vim\vim81
		install
		```


### Unix(TODO)



配置.kidvim
-----
1. 在_vimrc添加 `source ~/.kidvim/.vimrc`  
2. 安装Vundle   
    ```
    git submodule init
    git submodule update
    ```
3. 安装插件：   
```
    :BundleInstall
```
4. 安装 `YouCompleteMe` 插件   
	* 安装以下软件：
		* [CMake](https://cmake.org/download/) 
		* [7zip](http://www.7-zip.org/download.html)   
		* [Python 2 or Python 3](https://www.python.org/downloads/windows/)
		* *Visual Studio 2015 以上*, 装好之后先建个MFC工程，编译运行一次
	* 编译YCM：
		```
		cd %USERPROFILE%/.kidvim/bundle/YouCompleteMe
		install.py --clang-completer
		```

		* C#: `--cs-completer`


~~1. 下载：http://www.vim.org/download.php#pc ~~   
	下载支持python的vim版本~~

~~2. 在_vimrc添加 `source ~/.kidvim/.vimrc`~~  

~~3. Install Plugins:~~   
~~`:BundleInstall`~~   

~~4. 安装 `YouCompleteMe` 插件   
	* 安装以下软件：
		* [CMake](https://cmake.org/download/) 
		* [7zip](http://www.7-zip.org/download.html)   
		* [Python 2 or Python 3](https://www.python.org/downloads/windows/)
		* *Visual Studio 2015 以上*, 装好之后先建个MFC工程，编译运行一次
	* 编译YCM：
		```
		cd %USERPROFILE%/.kidvim/bundle/YouCompleteMe
		install.py --clang-completer
		```
        * C#: `--cs-completer`~~

   
   
   



参考:
> 编译Vim：http://vim.wikia.com/wiki/Building_Vim   
> 编译vim（通过Visual Studio）：http://vim.wikia.com/wiki/Build_Vim_in_Windows_with_Visual_Studio   
> http://www.cnblogs.com/ppboy_dxh/p/3226938.html   
> http://blog.csdn.net/jasonding1354/article/details/45368593   
> http://www.open-open.com/lib/view/open1414227253419.html   
> Awesome:https://github.com/amix/vimrc.git   
> YouCompleteMe:http:https://github.com/Valloric/YouCompleteMe/blob/master/README.md#full-installation-guide   


