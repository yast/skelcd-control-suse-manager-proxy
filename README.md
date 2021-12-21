skelcd-control-suse-manager-proxy
===================

[![Workflow Status](https://github.com/yast/skelcd-control-suse-manager-proxy/workflows/CI/badge.svg?branch=master)](
https://github.com/yast/skelcd-control-suse-manager-proxy/actions?query=branch%3Amaster)

Installation control file for SUSE Manager Proxy product. It is based on SLES
product with modifications expressed in xslt.

See also the [documentation for the `control.xml` file][1].

## Building XML

Run `rake build` to build the final XML file. By default it uses the base SLES
XML file from the `skelcd-control-SLES` package.

That can be changed via the `BASE_XML` environment variable to point to a Git
checkout directly:
``` shell
BASE_XML=../skelcd-control-SLES/control/installation.SLES.xml rake build
```

## Validation

Run `rake test:validation` to validate the built XML file. It uses `jing` for
XML validation, if that is not installed it fallbacks to `xmllint` (which
unfortunately has a worse error reporting).

You can use the `BASE_XML` environment variable to set the base XML path,
see above.

[1]: https://github.com/yast/yast-installation/blob/master/doc/control-file.md
