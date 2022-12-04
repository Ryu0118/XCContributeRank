COMMAND_NAME = rank
MINTRUN = mint run
SWIFTFORMAT = mint run swiftformat
BINARY_PATH = ./.build/x86_64-apple-macosx/release/$(COMMAND_NAME)
VERSION = 0.0.1

.PHONY: release
release:
	mkdir -p releases
	swift build -c release
	cp $(BINARY_PATH) rank
	tar acvf releases/XCContributeRank_$(VERSION).tar.gz rank
	cp rank releases/rank
	rm rank

.PHONY: format
format:
	$(SWIFTFORMAT) .

