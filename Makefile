build: update-submodules

clean:
	@@echo "Removing docs..."
	@@rm -rf docs/*

docs: update-submodules
	@@echo "Building docs..."
	@@lib/docco/bin/docco src/*.py

test:
	@@python -m unittest discover -v test/ "*.py"

# Taken from jquery/jquery Makefile
#
# change pointers for submodules and update them to what is specified in jQuery
# --merge  doesn't work when doing an initial clone, thus test if we have non-existing
# submodules, then do an real update
update-submodules:
	@@echo "Updating submodules..."
	@@if [ -d .git ]; then \
		if git submodule status | grep -q -E '^-'; then \
			git submodule update --init --recursive; \
		else \
			git submodule update --init --recursive --merge; \
		fi; \
	fi;
