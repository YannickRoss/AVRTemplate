CC = avra


init:
	mkdir src
	mkdir dist

dist/build.hex: src/$(SRC).asm
	$(CC) src/$(SRC).asm -o dist/build.hex -e dist/build.eep.hex -d dist/build.obj

run: src/$(SRC).asm
	$(CC) src/$(SRC).asm -o dist/build.hex -e dist/build.eep.hex -d dist/build.obj
	sudo avrdude -p $(TARGET) -c avrispmkII -U flash:w:dist/build.hex

clear: 
	rm -rf dist/
	mkdir dist
