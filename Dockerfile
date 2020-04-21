FROM registry.opensuse.org/yast/sle-15/sp2/containers/yast-ruby
COPY . /usr/src/app
RUN zypper --non-interactive in --no-recommends skelcd-control-SLES

