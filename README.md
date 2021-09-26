# CDLCD
## Custom Debian LiveCD

Skrypt powłoki BASH pozwalający na utworzenie dostoswanego do naszych potrzeb
LiveCD z dystrybucją GNU/Linux Debian.

**Wymagania**
1. Dystrybucja GNU/Linux Debian lub oparta na nim wykorzystująca manager
pakietów APT.
2. Dostęp do konta użytkownika *root*

**Instalacja**
1. # git clone https://github.com/xf0r3m/cdlcd.git
2. # chmod +x customDebianLiveCD.sh

**Konfiguracja**
1. W pliku customDebianLiveCD.sh:
  * Zmienna `LIVE_NAME` - nazwa dla LiveCD, pojawia się w kilku mało istonych
    miejscach
  * Zmienna `DEBIAN_MIRROR` - najbliższy mirror GNU/Linux Debian
2. W pliku chmodCommand.sh:
  * Zmienna `LIVE_NAME` - jw.
  * Zmienna `PKGS_LIST` - lista z nazwami paczek repozytorium do doinstalowania
    na LiveCD.
  * Zmienna `WALLPAPER_URL` - podanie url dla tapety środowiska graficznego

Generalnie cały plik chmodCommand.sh należy dostosować pod siebie, domyślnie 
plik zakłada użycie środowiska `icewm` i takie jest też zasugerowane w 
domyślniej liście pakietów, stąd również zasugerowanie zmiany tapety użyte w
kodzie. Można usunąć te właściwość. Poza `icewm`, obsługą sieci oraz klientem
SSH nie ma zbyt wielu domyślnych pakietów więc warto wziąć to pod uwagę.

**Aktualizacje**

Istnieje możliwość usunięcia pliku .squashfs oraz pliku .iso, i stworzenie ich
na nowo. Przydatne w przypadku trudnej do oskryptowania ingrencji pobrany
obraz Debiana. Służy do tego opcja `--upgrade`.

**Ingrencja w obraz Debiana**

Po zakończeniu pracy przez skrypt, możemy oczywiście dokonywać zmian w obrazie
za pomocą polecenia `# chmod ~/$LIVE_NAME/chroot` środowiwsko zostanie
przełączone i teraz można dokonywać innych zmian niż te zapisane w plik
chrootCommand.sh. Po zakończeniu pracy należy pamiętać aby wywołać skrypt
customDebianLiveCD.sh z opcja `--upgrade` aby wygenerować nowe pliki .squashfs
oraz .iso 

**Stosowanie obrazów na MacBook A1181**

Użycie obrazów nie tyczy się samego obrazu ale sposób na jego wgrania na dysk
przenośny. Większość czynności należy wykonać w identyczny sposób jak opisany
pod tym adresem: [https://wiki.debian.org/InstallingDebianOn/Apple/MacBook/2-1](https://wiki.debian.org/InstallingDebianOn/Apple/MacBook/2-1)
Niestety aby można było bootwać dysk z obrazami LiveCD tworzonymi przez ten 
skrypt potrzebnych jest kilka zmian.

* W pliku `/mnt/usb/boot/grub/grub.cfg` zamiast plików `linux` oraz `initrd.gz`
należy podać pliki znajdujące się w wewnątrz katalogu `live` w obrazie
pamiętając o odniesieniu się do katalogu `live` bo tam będą te pliki.
* W pliku `/mnt/usb/boot/grub/grub.cfg` w linii z wpisem jądra.
`linux (hd0,msdos1)/live/vmlinuz` należy dodać opcję `boot=live`
`linux (hd0,msdos1)/live/vmlinuz boot=live`
* Na dysk kopiujemy tylko katalog `live`.

Teraz dysk jest gotowy.
