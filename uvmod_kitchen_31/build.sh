#!/bin/bash

rm -rf temp 2>/dev/null
mkdir temp

python3 qsfirm.py unpack k5_v2.01.26_publish.bin temp/fw.dec.bin temp/fw.ver.bin

# here comment or uncomment mods

python mod_enable_swd_port.py           temp\fw.dec.bin
python mod_custom_freq_ranges.py        temp\fw.dec.bin
python mod_remove_tx_limits.py          temp\fw.dec.bin
python mod_enable_am_everywhere.py      temp\fw.dec.bin
python mod_disable_freq_copy_timeout.py temp\fw.dec.bin
python mod_universal_version.py         temp\fw.ver.bin

# end of mods

python3 qsfirm.py pack temp/fw.dec.bin temp/fw.ver.bin k5_v2.01.26_MODDED.bin
