from ..packaging import AutotoolsPackage, package


@package
class NodeJSPackage(AutotoolsPackage):
    """Node.js is a JavaScript runtime."""

    name = "nodejs"
    homepage = "https://nodejs.org"
    version = "5.10.0"
    artifacts = ["bin/node", "bin/npm"]

    url = "https://nodejs.org/dist/v5.10.0/node-v5.10.0.tar.gz"
