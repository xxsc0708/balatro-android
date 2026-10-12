@echo off
chcp 65001 >nul
echo ==========================================
echo   Balatro Android 构建环境检查脚本
echo ==========================================
echo.

set ERRORS=0

echo [1/6] 检查 JAVA_HOME...
if "%JAVA_HOME%"=="" (
    echo   ❌ JAVA_HOME 未设置
    set /a ERRORS+=1
) else (
    echo   ✅ JAVA_HOME = %JAVA_HOME%
    "%JAVA_HOME%\bin\java.exe" -version 2>&1 | findstr /r "version"
    if errorlevel 1 (
        echo   ❌ java.exe 运行失败
        set /a ERRORS+=1
    )
)

echo.
echo [2/6] 检查 ANDROID_HOME...
if "%ANDROID_HOME%"=="" (
    echo   ❌ ANDROID_HOME 未设置
    set /a ERRORS+=1
) else (
    echo   ✅ ANDROID_HOME = %ANDROID_HOME%
    if not exist "%ANDROID_HOME%\platform-tools\adb.exe" (
        echo   ❌ 缺少 platform-tools\adb.exe
        set /a ERRORS+=1
    ) else (
        echo   ✅ 找到 adb.exe
    )
)

echo.
echo [3/6] 检查 Android SDK Platform 34...
if not exist "%ANDROID_HOME%\platforms\android-34\android.jar" (
    echo   ❌ 缺少 Android 14 (API 34) 平台
    echo   👉 请在 Android Studio SDK Manager 安装 "Android SDK Platform 34"
    set /a ERRORS+=1
) else (
    echo   ✅ 找到 android-34
)

echo.
echo [4/6] 检查 Build-Tools 34...
dir "%ANDROID_HOME%\build-tools\34*" /b /ad >nul 2>&1
if errorlevel 1 (
    echo   ❌ 缺少 Build-Tools 34.x
    echo   👉 请在 Android Studio SDK Manager 安装 "Android SDK Build-Tools 34"
    set /a ERRORS+=1
) else (
    for /d %%d in ("%ANDROID_HOME%\build-tools\34*") do (
        echo   ✅ 找到 %%~nxd
    )
)

echo.
echo [5/6] 检查 NDK 26+...
dir "%ANDROID_HOME%\ndk\26*" /b /ad >nul 2>&1
if errorlevel 1 (
    dir "%ANDROID_HOME%\ndk\27*" /b /ad >nul 2>&1
    if errorlevel 1 (
        dir "%ANDROID_HOME%\ndk\28*" /b /ad >nul 2>&1
        if errorlevel 1 (
            echo   ❌ 缺少 NDK 26+
            echo   👉 请在 Android Studio SDK Manager 安装 "NDK (Side by side) 26 或更新"
            set /a ERRORS+=1
        ) else (
            for /d %%d in ("%ANDROID_HOME%\ndk\28*") do echo   ✅ 找到 %%~nxd
        )
    ) else (
        for /d %%d in ("%ANDROID_HOME%\ndk\27*") do echo   ✅ 找到 %%~nxd
    )
) else (
    for /d %%d in ("%ANDROID_HOME%\ndk\26*") do echo   ✅ 找到 %%~nxd
)

echo.
echo [6/6] 检查 CMake 3.22+...
dir "%ANDROID_HOME%\cmake\3.2*" /b /ad >nul 2>&1
if errorlevel 1 (
    dir "%ANDROID_HOME%\cmake\3.3*" /b /ad >nul 2>&1
    if errorlevel 1 (
        echo   ❌ 缺少 CMake 3.22+
        echo   👉 请在 Android Studio SDK Manager 安装 "CMake 3.22.1 或更新"
        set /a ERRORS+=1
    ) else (
        for /d %%d in ("%ANDROID_HOME%\cmake\3.3*") do echo   ✅ 找到 %%~nxd
    )
) else (
    for /d %%d in ("%ANDROID_HOME%\cmake\3.2*") do echo   ✅ 找到 %%~nxd
)

echo.
echo ==========================================
if %ERRORS%==0 (
    echo   🎉 所有检查通过！可以开始构建
    echo.
    echo   运行构建命令：
    echo   cd /d D:\love-android ^&^& .\gradlew.bat assembleDebug
) else (
    echo   ❌ 发现 %ERRORS% 个问题，请按提示解决后重新运行此脚本
)
echo ==========================================
pause