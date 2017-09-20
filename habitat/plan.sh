pkg_name=VotingApp
pkg_origin=kbhimanavarjula
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('GPU')
pkg_source="https://github.com/kbhimanavarjula/VotingApp"
pkg_build_deps=(core/git core/virtualenv)
pkg_deps=(core/coreutils core/python2 python2/pip core/redis)
pkg_exports=([port]=port)
pkg_exposes=(port)
pkg_svc_user="root"
pkg_binds=(
[db]


image: postgres:9.4
    container_name: db
    volumes:
      - "db-data:/var/lib/postgresql/data"
    networks:
      - back-tier

volumes:
  db-data:

networks:
  front-tier:
  back-tier:

adapter = "postgresql"
name = "Votingapp_production"
user = "Votingapp"
password = "myrailsapp"
)


do_download()  
{
        build_line "do_download() =================================================="  
        cd ${HAB_CACHE_SRC_PATH}

        build_line "\$pkg_dirname=${pkg_dirname}"  
        build_line "\$pkg_filename=${pkg_filename}"

        if [ -d "${pkg_dirname}" ];  
        then  
            rm -rf ${pkg_dirname}  
        fi

        mkdir ${pkg_dirname}  
        cd ${pkg_dirname}  
        GIT_SSL_NO_VERIFY=true git clone --branch master https://github.com/kbhimanavarjula/VotingApp.git
        return 0  
}

do_verify() {
	
	return 0
}
do_clean() {
	build_line "do_clean() ===================================================="
	return 0
}

do_unpack() {
	build_line "do_unpack() ===================================================="
	return 0
}

do_build() {
	build_line "do_build() ===================================================="
	#local source_dir="${HAB_CACHE_SRC_PATH}/${pkg_dirname}/${pkg_filename}"
	#pip install -r "${source_dir}/vote/requirements.txt"
	return 0
}

do_install() {
	build_line "do_install() ===================================================="
	#cd $pkg_prefix
	virtualenv venv
    	source venv/bin/activate
	local source_dir="${HAB_CACHE_SRC_PATH}/${pkg_dirname}/${pkg_filename}"
        build_line "source dir is ${source_dir}"
        pip install -r "${source_dir}/vote/requirements.txt"

}












# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
# pkg_shasum="TODO"
# pkg_deps=(core/glibc)
# pkg_build_deps=(core/make core/gcc)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="bin/haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"
