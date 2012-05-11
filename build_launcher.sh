cd launcher
echo Compiling..


javac -cp minecraft_launcher_unmodified.jar -d . LauncherFrame.java



# Preserve the backup
cp minecraft_launcher_unmodified.jar launcher-presign.jar
zip launcher-presign.jar net/minecraft/*
rm -r net/

zip -d launcher-presign.jar META-INF/MOJ\*

#mkdir META-INF
#echo "Manifest-Version: 1.2" > META-INF/MANIFEST.MF
#echo "Created-By: 1.6.0_24 (Sun Microsystems Inc.)" > META-INF/MANIFEST.MF
#echo "Main-Class: net.minecraft.MinecraftLauncher" > META-INF/MANIFEST.MF

#zip launcher-presign.jar META-INF/
#rm -r META-INF

echo Signing...
jarsigner -keystore ../keystore -storepass minecraft -keypass riking -signedjar signed-launcher.jar launcher-presign.jar MOJANG
