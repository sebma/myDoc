# Recursive file delation with fdfind

How to recursively delete files with [fdfind](https://github.com/sharkdp/fd) according to a pattern, type these commands :
```shell
pattern="t.t"
path=~/tmp?/
fdfind -HI $pattern $path -x rm -v
removed '/home/sebastien/tmp1/output.txt'
removed '/home/sebastien/tmp5/toto2'
removed '/home/sebastien/tmp1/toto'
removed '/home/sebastien/tmp5/toto1'
removed '/home/sebastien/tmp6/toto_files/react-tag-loader_7c4d220e.js'
removed '/home/sebastien/tmp1/toto2'
rm: cannot remove '/home/sebastien/tmp6/toto_files': Is a directory
removed '/home/sebastien/tmp6/toto.html'
removed '/home/sebastien/tmp7/toto.gpg'
removed '/home/sebastien/tmp7/mpv_issue_9939.txt'
removed '/home/sebastien/tmp6/no_idea.txt'
removed '/home/sebastien/tmp7/mpv_issue_6788.txt'
removed '/home/sebastien/tmp3/smem_snapshot_AFTER_REBOOT.txt'
removed '/home/sebastien/tmp3/output.txt'
removed '/home/sebastien/tmp7/mpv_issue_9721.txt'
removed '/home/sebastien/tmp3/smem_snapshot_BEFORE_logoff.txt'
removed '/home/sebastien/tmp7/mpv_issue_9663.txt'
removed '/home/sebastien/tmp7/mpv_issue_9720.txt'
removed '/home/sebastien/tmp3/smem_snapshot_AFTER_login.txt'
removed '/home/sebastien/tmp3/smem_snapshot_20220227.txt'
removed '/home/sebastien/tmp3/systemd_--user__not_killed.txt'
```
ATTENTION : Be every careful to place `-x rm` at the end of this command or else data loss happens with [fdfind](https://github.com/sharkdp/fd) version 9.0.0 (I've lost 25G of data in less than 2 seconds !!!) :
```shell
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
rm: cannot remove './ImagesVersets/bibliorama.fr': Is a directory
removed './ImagesVersets/getBiblioramaWallpapers.log'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './ImagesVersets/getBiblioramaWallpapers.sh'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
rm: cannot remove './BIBLE_TRANSLATIONS': Is a directory
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
rm: cannot remove './ImagesVersets': Is a directory
removed './BIBLE_TRANSLATIONS/martin_1744.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/hebrewnewtestam00deli_bw.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/Download-King-James-Bible.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/Bible_Martin1744.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/NT_Martin_1744_2014.rar'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/bible_de_l_epee.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/King-James-Bible-KJV-Bible-PDF.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './ImagesVersets/bibliorama.fr/ciel_dieu_fort.jpg'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './ImagesVersets/bibliorama.fr/1920_galets.jpg'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/hebrewnewtestam00deli.epub'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './ImagesVersets/bibliorama.fr/montagne_amour_800_Ro_8_37.jpg'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/douayr.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/bjc_internet.pdf'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/NTMARTIN_1744.PDF'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/Bible_Louis_Segond_1910.epub'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/hebrewnewtestam00deli.mobi'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
removed './BIBLE_TRANSLATIONS/La_Sainte_Bible_Martin_1744.rar'
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
rm: cannot remove 'yt-dlp_errors': No such file or directory
rm: cannot remove '/multimedia/': Is a directory
$ find -type f
$
```
