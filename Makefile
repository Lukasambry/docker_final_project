install-frontend:
	cd frontend && npm install

install-auth:
	cd services/auth-service && npm install

install-order:
	cd services/order-service && npm install

install-product:
	cd services/product-service && npm install
	./scripts/init-products.sh

start-containers:
	$(call log, "Starting containers...")
	docker compose up --build -d

init: install-frontend install-auth install-order install-product start-containers

stop:
	docker compose down -v

logs:
	docker compose logs -f

test:
	./scripts/run-tests.sh