# Shell paths
export PATH="/usr/local/opt/libxml2/bin:/Users/sdnjohnson/.local/bin:/usr/local/bin:$PATH"

# Github API tokens
## Homebrew ##
export HOMEBREW_GITHUB_API_TOKEN=24b8fa9b53edf5d22918a52ac9c34dc3bcf57613

# Set JAVA_HOME so rJava package can find it
export JAVA_HOME=$(/usr/libexec/java_home -v 9)
export LD_LIBRARY_PATH=$JAVA_HOME/lib/serverexport PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/expat/bin:$PATH"

# libxml compiler flags
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"

# Package config paths
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
# CPath
# export CPATH=/Library/Developer/CommandLineTools/usr/include/c++/v1

# Gettext
export PATH="/usr/local/opt/gettext/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/gettext/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include"export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
