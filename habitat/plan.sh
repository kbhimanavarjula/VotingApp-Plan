pkg_name=VotingApp
pkg_origin=kbhimanavarjula
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('GPU')
pkg_source="https://github.com/kbhimanavarjula/VotingApp"
pkg_build_deps=(core/git)
pkg_deps=(core/coreutils core/python2 core/redis)
pkg_exports=([port]=port)
pkg_exposes=(port)
pkg_svc_user="root"
#pkg_binds=()


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
	local source_dir="${HAB_CACHE_SRC_PATH}/${pkg_dirname}/${pkg_filename}"
        build_line "source dir is ${source_dir}"
	vote_dirname="vote"
	if [ -d "${vote_dirname}" ];
        then
            rm -rf ${vote_dirname}
        fi
	rm -rf /src/vote
	mkdir ${vote_dirname}
	mkdir /src/vote
	cp -vr ${source_dir}/vote/* ${vote_dirname}/
	cp -vr ${source_dir}/vote/* /src/vote/
#	virtualenv venv
#    	source venv/bin/activate
	
        pip install -r "${vote_dirname}/requirements.txt"

}

