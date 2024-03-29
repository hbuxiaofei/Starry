# Test scripts

define unit_test
  $(call run_cmd,cargo test,-p percpu $(1) -- --nocapture)
  $(call run_cmd,cargo test,-p axfs $(1) --features "myfs" -- --nocapture)
  $(call run_cmd,cargo test,--workspace --exclude "arceos-*" --exclude "monolithic*" --exclude "axstarry*" --exclude "axprocess" $(1) -- --nocapture)
endef

test_app :=
ifneq ($(filter command line,$(origin A) $(origin APP)),)
  test_app := $(APP)
endif

define app_test
  $(CURDIR)/scripts/test/app_test.sh $(test_app)
endef

define app_test_for_monolithic
  $(CURDIR)/scripts/test/app_test_for_monolithic.sh $(test_app)
endef
