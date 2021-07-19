# Maintainer : Sparta_EN <nya at sparta-en dot org>
pkgname=cloudreve-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="A project helps you build your own cloud in minutes"
arch=('x86_64')
url="https://github.com/cloudreve/cloudreve"
license=('GPL3')
depends=('grep')
source=("https://github.com/cloudreve/Cloudreve/releases/download/${pkgver}/cloudreve_${pkgver}_linux_amd64.tar.gz"
        'cloudreve.service'
        'cloudreve.sysuser'
        'conf.ini'
        'cloudreve-init.sh'
        'cloudreve.hook')
sha256sums=('809649ff71e3aaf7dc8d94414f47d75a1cc683f5a767684f94fd8b0c8b6c04c7'
            '9ec05c05e5c68a1b8c93444bae51605b98f948c099c54076017d45b04b542cde'
            '93bebcf75b85aaee3f9b02a7fd456b912fd9418b2d45ae50da6be30b0c6e8815'
            '7c0ea447fb63d00a8aef433098407884118572def39c730321a1034c3bbeae34'
            '840f1362c69130144009c21f4345f91ac07587b41adfc7f8fd865b2aded8a23f'
            '3680fb1f60168adaaa949380441c66d7b34624fadccc836ddfaff7ff611411bc')
backup=('etc/cloudreve.ini')

package() {
    cd $srcdir
    install -D -m755 cloudreve $pkgdir/opt/cloudreve/cloudreve
    install -D -m644 conf.ini $pkgdir/etc/cloudreve.ini
    install -D -m644 cloudreve.service $pkgdir/usr/lib/systemd/system/cloudreve.service
    install -D -m644 cloudreve.sysuser $pkgdir/usr/lib/sysuser.d/cloudreve.conf
    install -D -m755 cloudreve-init.sh $pkgdir/usr/share/libalpm/scripts/cloudreve-init.sh
    install -D -m644 cloudreve.hook $pkgdir/usr/share/libalpm/hooks/cloudreve.hook
}