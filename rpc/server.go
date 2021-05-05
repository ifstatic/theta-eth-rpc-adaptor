package rpc

import (
	"fmt"
	"net"

	log "github.com/sirupsen/logrus"

	erpclib "github.com/ethereum/go-ethereum/rpc"
	"github.com/spf13/viper"
	"github.com/thetatoken/theta-eth-rpc-adaptor/common"
	"github.com/thetatoken/theta-eth-rpc-adaptor/rpc/ethrpc"
)

var logger *log.Entry = log.WithFields(log.Fields{"prefix": "rpc"})

const (
	netNamespace = "net"
	ethNamespace = "eth"
)

var (
	HTTPModules = []string{netNamespace, ethNamespace}
	WSModules   = []string{netNamespace, ethNamespace}

	httpListener     net.Listener
	httpHandler      *erpclib.Server
	wsListener       net.Listener
	wsHandler        *erpclib.Server
	httpEndpoint     = ""
	wsEndpoint       = ""
	httpVirtualHosts = []string{"*"}
	httpTimeouts     = erpclib.DefaultHTTPTimeouts
	httpOrigins      = []string{"*"}
	wsOrigins        = []string{"*"}
)

// Version of the RPC
type Version int

// Namespace of the RPC version
func (n Version) Namespace() string {
	return HTTPModules[n]
}

// StartServers starts the http & ws servers
func StartServers(apis []erpclib.API) error {
	apis = append(apis, getAPIs()...)

	if viper.GetBool(common.CfgRPCEnabled) {
		httpAddr := viper.GetString(common.CfgRPCHttpAddress)
		httpPort := viper.GetString(common.CfgRPCHttpPort)
		httpEndpoint = fmt.Sprintf("%v:%v", httpAddr, httpPort)
		if err := startHTTP(apis); err != nil {
			return err
		}

		wsAddr := viper.GetString(common.CfgRPCHttpAddress)
		wsPort := viper.GetString(common.CfgRPCHttpPort)
		wsEndpoint = fmt.Sprintf("%v:%v", wsAddr, wsPort)
		if err := startWS(apis); err != nil {
			return err
		}
	}

	return nil
}

// StopServers stops the http & ws servers
func StopServers() error {
	if httpListener != nil {
		if err := httpListener.Close(); err != nil {
			return err
		}
		httpListener = nil
		logger.Infof("HTTP endpoint closed")
	}
	if httpHandler != nil {
		httpHandler.Stop()
		httpHandler = nil
	}
	if wsListener != nil {
		if err := wsListener.Close(); err != nil {
			return err
		}
		wsListener = nil
		logger.Infof("WS endpoint closed")
	}
	if wsHandler != nil {
		wsHandler.Stop()
		wsHandler = nil
	}
	return nil
}

// getAPIs returns all the API methods for the RPC interface
func getAPIs() []erpclib.API {
	publicAPIs := []erpclib.API{
		ethrpc.NewEthRPCService(ethNamespace),
	}

	return publicAPIs
}

func startHTTP(apis []erpclib.API) (err error) {
	httpListener, httpHandler, err = erpclib.StartHTTPEndpoint(
		httpEndpoint, apis, HTTPModules, httpOrigins, httpVirtualHosts, httpTimeouts,
	)
	if err != nil {
		return err
	}

	logger.Infof("Started RPC server at: %v\n", httpEndpoint)
	return nil
}

func startWS(apis []erpclib.API) (err error) {
	wsListener, wsHandler, err = erpclib.StartWSEndpoint(wsEndpoint, apis, WSModules, wsOrigins, true)
	if err != nil {
		return err
	}

	logger.Infof("Started WS server at: %v\n", wsEndpoint)
	return nil
}