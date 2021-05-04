module github.com/thetatoken/edgecore

require (
	github.com/aerospike/aerospike-client-go v1.36.0
	github.com/bgentry/speakeasy v0.1.0
	github.com/davecgh/go-spew v1.1.1
	github.com/dgraph-io/badger v1.6.0-rc1
	github.com/fd/go-nat v1.0.0
	github.com/golang/protobuf v1.3.1
	github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db
	github.com/gorilla/mux v1.6.2
	github.com/hashicorp/golang-lru v0.5.1
	github.com/herumi/bls-eth-go-binary v0.0.0-20200107021104-147ed25f233e
	github.com/huin/goupnp v1.0.0
	github.com/ipfs/go-datastore v0.0.5
	github.com/ipfs/go-ipfs-addr v0.0.1
	github.com/jackpal/gateway v1.0.5
	github.com/jackpal/go-nat-pmp v1.0.1
	github.com/karalabe/hid v0.0.0-20180420081245-2b4488a37358
	github.com/koron/go-ssdp v0.0.0-20180514024734-4a0ed625a78b
	github.com/libp2p/go-libp2p v0.3.0
	github.com/libp2p/go-libp2p-connmgr v0.1.1
	github.com/libp2p/go-libp2p-core v0.2.0
	github.com/libp2p/go-libp2p-crypto v0.1.0
	github.com/libp2p/go-libp2p-kad-dht v0.2.0
	github.com/libp2p/go-libp2p-peerstore v0.1.3
	github.com/libp2p/go-libp2p-pubsub v0.1.1
	github.com/libp2p/go-libp2p-swarm v0.2.0
	github.com/libp2p/go-libp2p-transport v0.1.0
	github.com/libp2p/go-nat v0.0.3
	github.com/libp2p/go-stream-muxer v0.1.0
	github.com/mattn/go-isatty v0.0.12
	github.com/mitchellh/go-homedir v1.1.0
	github.com/mongodb/mongo-go-driver v0.0.17
	github.com/multiformats/go-multiaddr v0.0.4
	github.com/pborman/uuid v0.0.0-20180906182336-adf5a7427709
	github.com/phoreproject/bls v0.0.0-20191016230924-b2e57acce2ed
	github.com/pion/datachannel v1.4.13
	github.com/pion/webrtc/v2 v2.1.12
	github.com/pkg/errors v0.8.1
	github.com/pkg/profile v1.4.0
	github.com/prysmaticlabs/prysm v0.0.0-20191018160938-a05dca18c7f7
	github.com/sirupsen/logrus v1.4.2
	github.com/smira/go-statsd v1.3.1
	github.com/spf13/cobra v0.0.5
	github.com/spf13/viper v1.5.0
	github.com/stretchr/testify v1.4.0
	github.com/syndtr/goleveldb v1.0.0
	github.com/thetatoken/theta v0.0.0
	github.com/thetatoken/theta/common v0.0.0
	github.com/thetatoken/theta/rpc/lib/rpc-codec/jsonrpc2 v0.0.0
	github.com/wedeploy/gosocketio v0.0.7-beta
	github.com/ybbus/jsonrpc v1.1.1
	go.opencensus.io v0.21.0
	golang.org/x/crypto v0.0.0-20191001170739-f9e2070545dc
	golang.org/x/net v0.0.0-20191021144547-ec77196f6094
	golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae
	gopkg.in/karalabe/cookiejar.v2 v2.0.0-20150724131613-8dcd6a7f4951
	gopkg.in/mgo.v2 v2.0.0-20180705113604-9856a29383ce
)

replace github.com/thetatoken/theta v0.0.0 => ../theta

replace github.com/thetatoken/theta/common v0.0.0 => ../theta/common

replace github.com/thetatoken/theta/rpc/lib/rpc-codec/jsonrpc2 v0.0.0 => ../theta/rpc/lib/rpc-codec/jsonrpc2/

go 1.13
