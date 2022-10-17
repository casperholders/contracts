build-erc20:
	cd contracts/erc20/ && make prepare && cargo build --release --target wasm32-unknown-unknown -p erc20-token
	./wasm-opt -Oz -o contracts/erc20/target/wasm32-unknown-unknown/release/erc20_token.wasm contracts/erc20/target/wasm32-unknown-unknown/release/erc20_token.wasm
	wasm-strip contracts/erc20/target/wasm32-unknown-unknown/release/erc20_token.wasm

build-uniswap-erc20:
	cd contracts/uniswap_erc20/erc20/ && make prepare && cargo build --release -p erc20 --target wasm32-unknown-unknown
	wasm-opt -Oz -o contracts/uniswap_erc20/erc20/target/wasm32-unknown-unknown/release/erc20-token.wasm contracts/uniswap_erc20/erc20/target/wasm32-unknown-unknown/release/erc20-token.wasm
	wasm-strip contracts/uniswap_erc20/erc20/target/wasm32-unknown-unknown/release/erc20-token.wasm

build-cep47:
	cd contracts/cep47/ && make prepare && cargo build --release -p cep47 --target wasm32-unknown-unknown
	wasm-opt -Oz -o contracts/cep47/target/wasm32-unknown-unknown/release/cep47-token.wasm contracts/cep47/target/wasm32-unknown-unknown/release/cep47-token.wasm
	wasm-strip contracts/cep47/target/wasm32-unknown-unknown/release/cep47-token.wasm

build-cep78:
	cd contracts/cep78/ && make prepare
	cd contracts/cep78/contract && cargo build --release --target wasm32-unknown-unknown
	cd contracts/cep78/client/mint_session && cargo build --release --target wasm32-unknown-unknown
	cd contracts/cep78/client/balance_of_session && cargo build --release --target wasm32-unknown-unknown
	cd contracts/cep78/client/owner_of_session && cargo build --release --target wasm32-unknown-unknown
	cd contracts/cep78/client/get_approved_session && cargo build --release --target wasm32-unknown-unknown
	cd contracts/cep78/client/transfer_session && cargo build --release --target wasm32-unknown-unknown

	wasm-opt -Oz -o contracts/cep78/contract/target/wasm32-unknown-unknown/release/contract.wasm contracts/cep78/contract/target/wasm32-unknown-unknown/release/contract.wasm
	wasm-opt -Oz -o contracts/cep78/client/mint_session/target/wasm32-unknown-unknown/release/mint_call.wasm contracts/cep78/client/mint_session/target/wasm32-unknown-unknown/release/mint_call.wasm
	wasm-opt -Oz -o contracts/cep78/client/balance_of_session/target/wasm32-unknown-unknown/release/balance_of_call.wasm contracts/cep78/client/balance_of_session/target/wasm32-unknown-unknown/release/balance_of_call.wasm
	wasm-opt -Oz -o contracts/cep78/client/owner_of_session/target/wasm32-unknown-unknown/release/owner_of_call.wasm contracts/cep78/client/owner_of_session/target/wasm32-unknown-unknown/release/owner_of_call.wasm
	wasm-opt -Oz -o contracts/cep78/client/get_approved_session/target/wasm32-unknown-unknown/release/get_approved_call.wasm contracts/cep78/client/get_approved_session/target/wasm32-unknown-unknown/release/get_approved_call.wasm
	wasm-opt -Oz -o contracts/cep78/client/transfer_session/target/wasm32-unknown-unknown/release/transfer_call.wasm contracts/cep78/client/transfer_session/target/wasm32-unknown-unknown/release/transfer_call.wasm
	
	wasm-strip contracts/cep78/contract/target/wasm32-unknown-unknown/release/contract.wasm
	wasm-strip contracts/cep78/client/mint_session/target/wasm32-unknown-unknown/release/mint_call.wasm
	wasm-strip contracts/cep78/client/balance_of_session/target/wasm32-unknown-unknown/release/balance_of_call.wasm
	wasm-strip contracts/cep78/client/owner_of_session/target/wasm32-unknown-unknown/release/owner_of_call.wasm
	wasm-strip contracts/cep78/client/get_approved_session/target/wasm32-unknown-unknown/release/get_approved_call.wasm
	wasm-strip contracts/cep78/client/transfer_session/target/wasm32-unknown-unknown/release/transfer_call.wasm

build-all: build-erc20 build-cep47 build-cep78 build-uniswap-erc20