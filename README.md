# .kidvim
1. 下载：http://www.vim.org/download.php#pc
	下载支持python的vim版本

2. 在_vimrc添加 `source ~/.kidvim/.vimrc`  

3. Install Plugins:   
`:BundleInstall`   

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







参考:
> http://www.cnblogs.com/ppboy_dxh/p/3226938.html
> http://blog.csdn.net/jasonding1354/article/details/45368593   
> http://www.open-open.com/lib/view/open1414227253419.html   
> Awesome:https://github.com/amix/vimrc.git   
> YouCompleteMe:http:https://github.com/Valloric/YouCompleteMe/blob/master/README.md#full-installation-guide
