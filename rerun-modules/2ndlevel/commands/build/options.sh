# generated by stubbs:add-option
# Wed 27 Jun 2012 23:21:12 EDT

# print USAGE and exit
rerun_option_error() {
    [ -z "$USAGE"  ] && echo "$USAGE" >&2
    [ -z "$SYNTAX" ] && echo "$SYNTAX $*" >&2
    return 2
}

# check option has its argument
rerun_option_check() {
    [ "$1" -lt 2 ] && rerun_option_error
}

# options: [build-file destination project revision type]
while [ "$#" -gt 0 ]; do
    OPT="$1"
    case "$OPT" in
        -f|--build-file) rerun_option_check $# ; BUILD_FILE=$2 ; shift ;;
        -d|--destination) rerun_option_check $# ; BUILD_DEST=$2 ; shift ;;
        -p|--project) rerun_option_check $# ; PROJECT=$2 ; shift ;;
        -r|--revision) rerun_option_check $# ; REVISION=$2 ; shift ;;
        -t|--type) rerun_option_check $# ; TYPE=$2 ; shift ;;
        # unknown option
        -?)
            rerun_option_error
            ;;
        # end of options, just arguments left
        *)
            break
    esac
    shift
done

# If defaultable options variables are unset, set them to their DEFAULT
[ -z "$PROJECT" ] && PROJECT=2ndlevel
[ -z "$TYPE" ] && TYPE=dev

# GIT_COMMIT env var takes precedence (if set non-empty)
[ "${GIT_COMMIT:+x}" ] && REVISION=$GIT_COMMIT
[ -z "$REVISION" ] && REVISION=develop

# Check required options are set
[ -z "$BUILD_FILE" ] && { echo "missing required option: --build-file" ; return 2 ; }
[ -z "$BUILD_DEST" ] && { echo "missing required option: --destination" ; return 2 ; }
#
return 0
