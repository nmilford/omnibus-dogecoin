name     "miniupnpc"
version  "1.9"

source :url => "http://miniupnp.free.fr/files/miniupnpc-1.9.tar.gz",
       :md5 => "5ef3ba321e6df72d6519b728b292073e"

relative_path "#{name}-#{version}"

env = {
  "CFLAGS" => "-I/opt/dogecoin/embedded/include",
  "LDFLAGS" => "-Wl,-rpath,/opt/dogecoin/embedded/lib -L/opt/dogecoin/embedded/lib",
  "INSTALLPREFIX" => "#{install_dir}/embedded"
}

build do
  command "make install", :env => env
end
