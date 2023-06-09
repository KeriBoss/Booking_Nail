<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit55f3aa60986629cf5f8af6198def7ecd
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
            $loader->prefixLengthsPsr4 = ComposerStaticInit55f3aa60986629cf5f8af6198def7ecd::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit55f3aa60986629cf5f8af6198def7ecd::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit55f3aa60986629cf5f8af6198def7ecd::$classMap;

        }, null, ClassLoader::class);
    }
}
