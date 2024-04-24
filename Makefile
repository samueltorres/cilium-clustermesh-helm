.PHONY: create-clusters
create-clusters:
	kind create cluster --config kind-1.yaml
	kind create cluster --config kind-2.yaml

.PHONY: install-metallb
install-metallb:
	./install-metallb.sh
	
.PHONY: install-cilium
install-cilium:
	./install-cilium.sh

.PHONY: generate-certs
generate-certs:
	./generate-certs.sh

.PHONY: install-test-bed
install-test-bed:
	./install-test-bed.sh

.PHONY: test-clustermesh
test-clustermesh:
	kubectl run --restart Never --rm -it --image nicolaka/netshoot netshoot -- /bin/sh -c 'for i in $$(seq 1 100); do curl http://rebel-base/; done'