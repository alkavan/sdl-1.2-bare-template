# Generic Makefile for compiling an executable, with pkg-config dependencies.

CC := gcc
PKGS := sdl
SRCDIR := src
BUILDDIR := build
CFLAGS := -g -Wall -std=c++11 `pkg-config --cflags $(PKGS)` -Iinclude
LIBS := `pkg-config --libs $(PKGS)` -lstdc++
TARGET := sdl_demo

SRCEXT = cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS := $(OBJECTS:.o=.deps)

$(TARGET): $(OBJECTS)
	@echo " Linking..."; $(CC) $^ -o $(TARGET) $(LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo " CC $<"; $(CC) $(CFLAGS) -MD -MF $(@:.o=.deps) -c -o $@ $<
clean:
	@echo " Cleaning..."; $(RM) -r $(BUILDDIR) $(TARGET)

-include $(DEPS)

.PHONY: clean
