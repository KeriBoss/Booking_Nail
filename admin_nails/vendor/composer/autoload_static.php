<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitea1565d0b8d518b764bcb7a47e310d9d
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twilio\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twilio\\' => 
        array (
            0 => __DIR__ . '/..' . '/twilio/sdk/src/Twilio',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitea1565d0b8d518b764bcb7a47e310d9d::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitea1565d0b8d518b764bcb7a47e310d9d::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitea1565d0b8d518b764bcb7a47e310d9d::$classMap;

        }, null, ClassLoader::class);
    }
}
