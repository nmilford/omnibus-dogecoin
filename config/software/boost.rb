name     "boost"
version  "1.55.0"
flat_ver = version.gsub(".","_")

dependency "bzip2"

source :url => "http://downloads.sourceforge.net/boost/boost_#{flat_ver}.tar.bz2",
       :md5 => "d6eef4b4cacb2183f2bf265a5a03a354"

relative_path "boost_#{flat_ver}"

env = {
  "CFLAGS" => "-I#{install_dir}/embedded/include",
  "LDFLAGS" => "-Wl,-rpath,#{install_dir}/embedded/lib -L#{install_dir}/embedded/lib"
}

build do
  command "./bootstrap.sh", :env => env
  command "./bjam --without-mpi --without-python --prefix=#{install_dir}/embedded link=static runtime-link=static install", :env => env
end
