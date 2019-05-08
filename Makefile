#Need to properly write this file. This is conceptual.
DST = namer
TARGETDST = ~/public_html/
TARGETDST := $(TARGETDST)$(DST)

.PHONY: all 
all:
        @echo Please provide destination.

.PHONY: clean
clean:

        cd $(TARGETDST) && \
                rm -rf $$(ls | grep -v .used_names)


# OCF deployment
.PHONY: deploy-ocf
deploy-ocf:

        @echo Setup virtualenv
        mkdir -p $(TARGETDST)
        cd $(TARGETDST) && \
                virtualenv -p python3 venv && \
                . venv/bin/activate && \
                pip install flask && \
                pip install flup6 && \
                deactivate

        cp -r deploy/ocf/. $(TARGETDST)
        cp -r src/. $(TARGETDST)/$(DST)

        chmod a+x $(TARGETDST)/run.fcgi
