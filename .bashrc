# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

source /etc/profile.d/modules.sh
module load mpi/openmpi-x86_64

PS1="\[\e[01;34m\]> \[\e[01;32m\]\W\[\e[0;0m\]:\[\e[01;33m\]\$\[\e[0;0m\] "
export QSYS_ROOTDIR="/home/jcyran/intelFPGA_lite/17.1/quartus/sopc_builder/bin"
SYSTEMC_HOME=/usr/local/systemc-2.3.3
export LD_LIBRARY_PATH=/usr/local/systemc-2.3.3/lib-linux64
export LD_LIBRARY_PATH=/opt/oracle/instantclient_23_6:$LD_LIBRARY_PATH

sccomp() {
    g++ -I. -I$SYSTEMC_HOME/include -L. -L$SYSTEMC_HOME/lib-linux64 "$@" -lsystemc -lm
    echo "g++ -I. -I$SYSTEMC_HOME/include -L. -L$SYSTEMC_HOME/lib-linux64 "$*" -lsystemc -lm"
}
. "$HOME/.cargo/env"

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
