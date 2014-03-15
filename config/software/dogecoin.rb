name       "dogecoin"
version    "1.6"
dependency "db"
dependency "openssl"
dependency "boost"
dependency "miniupnpc"

source :url => "https://github.com/dogecoin/dogecoin/archive/#{version}.tar.gz",
       :md5 => "2340d89110f00c68fa748ab7b74a6087"

relative_path "#{name}-#{version}/src"

env = {
  "CFLAGS" => "-I/opt/dogecoin/embedded/include",
  "LDFLAGS" => "-Wl,-rpath,/opt/dogecoin/embedded/lib -L/opt/dogecoin/embedded/lib"
}

build do
  command "make -f makefile.unix USE_UPNP=1 USE_IPV6=1 USE_QRCODE=1", :env => env
  command "cp dogecoind #{install_dir}/bin"
  command "rm -rf /opt/#{name}/embedded/docs"
  command "rm -rf /opt/#{name}/embedded/share/man"
  command "rm -rf /opt/#{name}/embedded/share/doc"
  command "rm -rf /opt/#{name}/embedded/ssl/man"
  command "rm -rf /opt/#{name}/embedded/info"
end


