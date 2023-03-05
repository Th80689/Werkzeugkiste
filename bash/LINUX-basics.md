# LINUX - Basisbefehle

## Filesystem - Basis
- du
- df

Szenario: "A program needs 1.3G of space to install. Check that there is enough space."	
`df -h`
Szenario: "You are running out of space and need to delete some files. List all files and folders greater than 500M."
du -h -a --threshold=500M