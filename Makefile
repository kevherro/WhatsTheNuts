.PHONY: fmt
fmt:
		swift-format format --configuration .swift-format \
			--recursive \
			--parallel \
			--in-place \
			WhatsTheNuts/* WhatsTheNutsTests/*
