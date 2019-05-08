#Need to properly write this file. This is conceptual.

.PHONY: all
all:
    @echo Please provide destination.

# OCF deployment
.PHONY: deploy-ocf
deploy-ocf:
    DST=namer
    TARGETDST='~/public_html/$(DST)'

    @echo Setup virtualenv
    cd $(TARGETDST)
    virtualenv -p python3 venv
    . venv/bin/activate
    pip install flask
    pip install flup6
    deactivate

    cp -r src/ocf/* $(TARGETDST)
    cp src/ocf/run.fcgi $(TARGETDST)

    chmod a+x ~/public_html/namer/run.fcgi
